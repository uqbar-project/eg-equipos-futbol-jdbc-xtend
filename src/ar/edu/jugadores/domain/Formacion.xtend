package ar.edu.jugadores.domain

import java.util.ArrayList
import java.util.List

class Formacion {
	
	@Property int id
	@Property Equipo equipo
	@Property List<Jugador> jugadores
	@Property int goles
	
	new(int id, Equipo equipo, int goles) {
		this.id = id
		this.equipo = equipo
		this.goles = goles
		this.jugadores = new ArrayList<Jugador>
	}
	
	def Equipo ganador(Formacion formacion) {
		if (goles == formacion.goles) {
			null
		} else {
			if (goles > formacion.goles) {
				equipo
			}  else {
				formacion.equipo
			}
		}
	}
	
	def agregarJugador(String nombre) {
		jugadores.add(new Jugador(nombre))
	}
	
}