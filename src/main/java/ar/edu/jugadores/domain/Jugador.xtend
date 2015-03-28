package ar.edu.jugadores.domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Jugador {

	String nombre

	new(String string) {
		this.nombre = nombre
	}

	override equals(Object jugador) {
		nombre == (jugador as Jugador).nombre
	}

	override hashCode() {
		nombre.hashCode
	}

}
