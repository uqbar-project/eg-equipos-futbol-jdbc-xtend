package ar.edu.jugadores.domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Equipo {
	
	int id
	String nombre
	
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