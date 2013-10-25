package ar.edu.jugadores.home

import ar.edu.jugadores.domain.Equipo
import ar.edu.jugadores.domain.Partido

interface HomePartidos {
	
	def Partido getPartido(Equipo equipo1, Equipo equipo2)
	def Partido getResultado(Equipo equipo1, Equipo equipo2)
	
}