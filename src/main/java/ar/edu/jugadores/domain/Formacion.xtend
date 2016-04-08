package ar.edu.jugadores.domain

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Formacion {
	
	int id
	Equipo equipo
	List<Jugador> jugadores
	int goles
	
	new(int id, Equipo equipo, int goles) {
		this.id = id
		this.equipo = equipo
		this.goles = goles
		this.jugadores = new ArrayList<Jugador>
	}
	
	def Equipo ganador(Formacion formacionContraria) {
		if (goles == formacionContraria.goles) {
			null
		} else {
			if (goles > formacionContraria.goles) {
				equipo
			}  else {
				formacionContraria.equipo
			}
		}
	}
	
	def agregarJugador(String nombre) {
		jugadores.add(new Jugador(nombre))
	}
	
}