package ar.edu.jugadores.repo

import ar.edu.jugadores.domain.Equipo
import ar.edu.jugadores.domain.Formacion
import ar.edu.jugadores.domain.Partido
import java.sql.Connection
import java.sql.DriverManager
import java.sql.ResultSet
import java.sql.Statement

class RepoJDBCPartidos implements RepoPartidos { 
	// JDBC driver name and database URL
	static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver"
	static final String DB_URL = "jdbc:mysql://localhost/jugadores"

	//  Database credentials
	static final String USER = "root"
	static final String PASS = "laura" // reemplazalo por la password de tu instalación

	Connection conn
	Statement stmt
	ResultSet rs

	new() {
		Class.forName(JDBC_DRIVER)
	}

	override getPartido(Equipo equipo1, Equipo equipo2) {
		val partido = getResultado(equipo1, equipo2)

		// Ahora vamos en profundidad
		val formacionLocal = partido.formacionLocal
		this.traerJugadores(formacionLocal)

		val formacionVisitante = partido.formacionVisitante
		this.traerJugadores(formacionVisitante)

		this.cerrarQuery()

		partido
	}

	def traerJugadores(Formacion formacion) {
		val sql = "
		select j.jugador_id,
       		   j.nombre
		  from formacion f,
		       formacion_jugador fj,
		       jugadores j
		 where f.equipo_id = " + formacion.equipo.id + "
		   and f.formacion_id = fj.formacion_id
		   and fj.jugador_id = j.jugador_id
		   and f.formacion_id = " + formacion.id

		val rs = this.ejecutarQuery(sql)
		while (rs.next()) {
			formacion.agregarJugador(rs.getString("nombre"))
		}
		rs.close()
	}

	override getResultado(Equipo equipo1, Equipo equipo2) {
		val sql = "
		select for_loc.formacion_id as idFormacionLocal,
               eq_loc.equipo_id as idEquipoLocal,
		       eq_loc.nombre as nombreEquipoLocal,
		       for_loc.goles as golesLocal,
		       for_vis.formacion_id as idFormacionVisitante,
               eq_vis.equipo_id as idEquipoVisitante,
		       eq_vis.nombre as nombreEquipoVisitante,
		       for_vis.goles as golesVisitante
		  from partidos p,
		       formacion for_loc,
		       formacion for_vis,
		       equipos eq_loc,
		       equipos eq_vis
		 where p.formacion_local_id = for_loc.formacion_id
		   and for_loc.equipo_id = eq_loc.equipo_id
		   and p.formacion_visitante_id = for_vis.formacion_id
		   and for_vis.equipo_id = eq_vis.equipo_id
		   and eq_loc.equipo_id = " + equipo1.id + "
           and eq_vis.equipo_id = " + equipo2.id

		val ResultSet rs = this.ejecutarQuery(sql)
		var partidoResult = new Partido

		while (rs.next()) {
			var idFormacion = rs.getInt("idFormacionLocal")
			var id = rs.getInt("idEquipoLocal")
			var nombre = rs.getString("nombreEquipoLocal")
			var goles = rs.getInt("golesLocal")
			partidoResult.formacionLocal = new Formacion(idFormacion, new Equipo(id, nombre), goles)

			idFormacion = rs.getInt("idFormacionVisitante")
			id = rs.getInt("idEquipoVisitante")
			nombre = rs.getString("nombreEquipoVisitante")
			goles = rs.getInt("golesVisitante")
			partidoResult.formacionVisitante = new Formacion(idFormacion, new Equipo(id, nombre), goles)
		}

		rs.close()
		this.cerrarQuery()

		partidoResult
	}

	def cerrarQuery() {
		stmt.close()
		conn.close()
	}

	def ejecutarQuery(String sql) {
		conn = DriverManager.getConnection(DB_URL, USER, PASS)
		stmt = conn.createStatement()
		rs = stmt.executeQuery(sql)
	}

}
