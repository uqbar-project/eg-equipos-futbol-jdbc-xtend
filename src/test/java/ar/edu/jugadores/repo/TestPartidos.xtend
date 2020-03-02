package ar.edu.jugadores.repo

import ar.edu.jugadores.domain.Equipo
import ar.edu.jugadores.domain.Jugador
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test
import static org.junit.jupiter.api.Assertions.assertTrue
import static org.junit.jupiter.api.Assertions.assertEquals

@DisplayName("Dado un partido")
class TestPartidos {

	RepoPartidos repoPartidos
	Equipo boca
	Equipo independiente
	Jugador palermo

	@BeforeEach
	def void setUp() {
		palermo = new Jugador("Palermo") 
		boca = new Equipo(1, "Boca")
		independiente = new Equipo(2, "Independiente")
		repoPartidos = new RepoJDBCPartidos
	}

	@Test
	@DisplayName("si uno de los equipos ganó, podemos determinar quién fue el equipo ganador")
	def void ganadorBoca2Independiente0() {
		val partido = repoPartidos.getResultado(boca, independiente)
		assertEquals(boca, partido.ganador)
	}

	@Test
	@DisplayName("sabemos si un jugador jugó ese partido")
	def void palermoJugoParaBocaEnBoca2Independiente0() {
		val partido = repoPartidos.getPartido(boca, independiente)
		assertTrue(partido.formacionLocal.jugadores.contains(palermo))
	}
		
}
