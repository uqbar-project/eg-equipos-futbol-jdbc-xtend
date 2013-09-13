package ar.edu.jugadores.domain

class Partido {
	
	@Property Formacion formacionLocal
	@Property Formacion formacionVisitante
		
	def ganador() {
		formacionLocal.ganador(formacionVisitante)
	}
}