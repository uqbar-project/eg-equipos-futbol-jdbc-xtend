package ar.edu.jugadores.repo

import ar.edu.jugadores.domain.Equipo
import ar.edu.jugadores.domain.Jugador
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestPartidos {

	RepoPartidos repoPartidos
	Equipo boca
	Equipo independiente
	Jugador palermo

	@Before
	def void setUp() {
		palermo = new Jugador("Palermo") 
		repoPartidos = new RepoJDBCPartidos
		boca = new Equipo(1, "Boca")
		independiente = new Equipo(2, "Independiente")
	}

	@Test
	def void ganadorBoca2Independiente0() {
		val partido = repoPartidos.getResultado(boca, independiente)
		Assert.assertEquals(boca, partido.ganador)
	}

	@Test
	def void palermoJugoParaBocaEnBoca2Independiente0() {
		val partido = repoPartidos.getPartido(boca, independiente)
		Assert.assertEquals(11, partido.formacionLocal.jugadores.size)
		Assert.assertTrue(partido.formacionLocal.jugadores.contains(palermo))
	}
		
}
