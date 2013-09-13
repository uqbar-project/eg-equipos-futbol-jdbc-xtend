package ar.edu.jugadores.domain

class Equipo {
	
	@Property int id
	@Property String nombre
	
	new(int id, String nombre) {
		this.id = id
		this.nombre = nombre
	}
	
	override equals(Object equipo) {
		id == (equipo as Equipo).id
	}
	
	override hashCode() {
		id.hashCode
	}
	
}