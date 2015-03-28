package ar.edu.jugadores.domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Partido {
	
	Formacion formacionLocal
	Formacion formacionVisitante
		
	def ganador() {
		formacionLocal.ganador(formacionVisitante)
	}
}