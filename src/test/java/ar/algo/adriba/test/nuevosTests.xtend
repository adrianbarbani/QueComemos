package ar.algo.adriba.test

import ar.algo.adriba.tp1.CondicionPreexistente
import ar.algo.adriba.tp1.Fecha
import ar.algo.adriba.tp1.Hipertenso
import ar.algo.adriba.tp1.Ingrediente
import ar.algo.adriba.tp1.Rutina
import ar.algo.adriba.tp1.Usuario
import ar.algo.adriba.tp1.Vegano
import java.util.ArrayList
import java.util.List
import org.junit.Before
import org.junit.Test
import org.junit.Assert
import ar.algo.adriba.tp1.Sexo
import ar.algo.adriba.tp1.Diabetico

class nuevosTests {

	Fecha fechaValida
	Fecha fechaInvalida
	List<Ingrediente> unasPreferenciasAlimentarias = new ArrayList<Ingrediente>
	List<CondicionPreexistente> unasCondicionesPreexistentesConHipertension = new ArrayList<CondicionPreexistente>
	List<CondicionPreexistente> unasCondicionesPreexistentesConVeganismo = new ArrayList<CondicionPreexistente>
	List<CondicionPreexistente> condicionesPreexistentes = new ArrayList<CondicionPreexistente>

	Usuario JuanCarlos

	Sexo Femenino
	Sexo Masculino

	
	
	@Before
	def void init() {

		// Usamos la fecha de ayer como fecha VALIDA
		fechaValida = new Fecha(System.currentTimeMillis() - 24 * 60 * 60 * 1000);

		// Usamos la fecha de mañana como fecha INVALIDA
		fechaInvalida = new Fecha(System.currentTimeMillis() + 24 * 60 * 60 * 1000);

		unasCondicionesPreexistentesConHipertension.add(new Hipertenso)
		unasCondicionesPreexistentesConVeganismo.add(new Vegano)

	}

	//Punto 1: Validacion de usuario
	@Test(expected=typeof(Exception))
	def void testValidacionDeUsuarioHipertensoNoValido() {
		new Usuario(50, 1.60, Femenino= new Sexo(), "Marina", fechaValida, new Rutina(20, true),
			unasCondicionesPreexistentesConHipertension, unasPreferenciasAlimentarias)
	}

	@Test
	def void testValidacionDeUsuarioVeganoValido() {
		new Usuario(52, 1.64, Masculino= new Sexo(), "JuanCarlos", fechaValida, new Rutina(30, true),
			unasCondicionesPreexistentesConVeganismo, unasPreferenciasAlimentarias)

	}

	//Punto2: Indice de masa corporal
	@Test
	def void indiceMasaCorporal() {
		JuanCarlos = new Usuario(52, 1.64, Masculino= new Sexo(), "JuanCarlos", fechaValida, new Rutina(40, true),
			unasCondicionesPreexistentesConVeganismo, unasPreferenciasAlimentarias)

		Assert.assertEquals(19.3, JuanCarlos.imc(), 0.5)

	}

	//Punto 2: Averiguar si un usuario sigue una rutina saludable
	@Test
	def void sigueRutinaValida() {
	condicionesPreexistentes.add(new Diabetico)
	unasPreferenciasAlimentarias.add(new Ingrediente(20, "frutas", 1))
	
	JuanCarlos = new Usuario(52, 1.64, Masculino= new Sexo(), "Adrian", fechaValida, new Rutina(40, true),
			condicionesPreexistentes, unasPreferenciasAlimentarias)
	
		JuanCarlos.sigoRutinaSaludable()

	}

	@Test (expected=typeof(Exception))
	def void sigueRutinaInvalida() {
	condicionesPreexistentes.add(new Diabetico)
	unasPreferenciasAlimentarias.add(new Ingrediente(20, "frutas", 1))
	JuanCarlos = new Usuario(52, 1.64, Masculino=new Sexo(), "Jose", fechaValida, new Rutina(35, false),
			condicionesPreexistentes, unasPreferenciasAlimentarias)
	
		JuanCarlos.sigoRutinaSaludable()
	
	}
}
