package ar.edu.jugadores.domain

class Jugador {

	@Property String nombre

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
