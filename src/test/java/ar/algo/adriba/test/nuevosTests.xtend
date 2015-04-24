package ar.algo.adriba.test

import ar.algo.adriba.tp1.Comida
import ar.algo.adriba.tp1.CondicionPreexistente
import ar.algo.adriba.tp1.Fecha
import ar.algo.adriba.tp1.Femenino
import ar.algo.adriba.tp1.Rutina
import ar.algo.adriba.tp1.Usuario
import java.util.List
import org.junit.Before
import org.junit.Test
import ar.algo.adriba.tp1.Vegano
import ar.algo.adriba.tp1.Diabetico
import java.util.ArrayList
import ar.algo.adriba.tp1.Hipertenso
import ar.algo.adriba.tp1.Masculino

class nuevosTests {

	Fecha fechaValida
	Fecha fechaInvalida
	List<Comida> unasPreferenciasAlimentarias = new ArrayList<Comida>
	List<CondicionPreexistente> unasCondicionesPreexistentesConHipertension = new ArrayList<CondicionPreexistente>
	List<CondicionPreexistente> unasCondicionesPreexistentesConVeganismo = new ArrayList<CondicionPreexistente>

	@Before
	def void init() {

		// Usamos la fecha de ayer como fecha VALIDA
		fechaValida = new Fecha(System.currentTimeMillis() - 24 * 60 * 60 * 1000);

		// Usamos la fecha de mañana como fecha INVALIDA
		fechaInvalida = new Fecha(System.currentTimeMillis() + 24 * 60 * 60 * 1000);

		unasCondicionesPreexistentesConHipertension.add(new Hipertenso)
		unasCondicionesPreexistentesConVeganismo.add(new Vegano)
	}

	@Test(expected=typeof(Exception))
	def void testValidacionDeUsuarioHipertensoNoValido() {
		new Usuario(50, 1.60, new Femenino, "Marina", fechaValida, new Rutina,
			unasCondicionesPreexistentesConHipertension, unasPreferenciasAlimentarias)
	}

	@Test
	def void testValidacionDeUsuarioVeganoValido() {
		new Usuario(52, 1.64, new Masculino, "JuanCarlos", fechaValida, new Rutina,
			unasCondicionesPreexistentesConVeganismo, unasPreferenciasAlimentarias)

	}
