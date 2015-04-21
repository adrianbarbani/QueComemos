package ar.algo.adriba.test

import ar.algo.adriba.tp1.Celiaco
import ar.algo.adriba.tp1.Diabetico
import ar.algo.adriba.tp1.Fecha
import ar.algo.adriba.tp1.Femenino
import ar.algo.adriba.tp1.Hipertenso
import ar.algo.adriba.tp1.Ingrediente
import ar.algo.adriba.tp1.Masculino
import ar.algo.adriba.tp1.Receta
import ar.algo.adriba.tp1.SedentarioConNadaDeEjercicio
import ar.algo.adriba.tp1.Usuario
import ar.algo.adriba.tp1.Vegano
import ar.algo.adriba.tp1.carne
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class Entrega1Tests {

	Usuario federico
	Usuario pedro
	Usuario marina
	Usuario adrian
	Usuario usuarioFalsoVegano
	Usuario usuarioDiabeticoConHipertension
	Fecha fechaValida
	Fecha fechaInvalida

	carne chorizo
	carne pollo
	carne nalga

	Receta ensaladaCaprese
	Receta papasAlHorno

	Ingrediente harina
	Ingrediente huevo
	Ingrediente panRallado

	@Before // agregué el método init para los tests y metí todos los constructores y setters ahi
	def void init() {

		// Usamos la fecha de ayer como fecha VALIDA
		fechaValida = new Fecha(System.currentTimeMillis() - 24 * 60 * 60 * 1000);

		// Usamos la fecha de mañana como fecha INVALIDA
		fechaInvalida = new Fecha(System.currentTimeMillis() + 24 * 60 * 60 * 1000);

		federico = new Usuario => [
			setSexo = new Masculino
			setNombre("Federico")
			setAltura(1.88)
			setPeso(83)
			rutinaUsuario = new SedentarioConNadaDeEjercicio
			fechaDeNacimiento = fechaValida
		]

		pedro = new Usuario => [
			setSexo = new Masculino
			setNombre("Pedro")
			setAltura(1.22)
			setPeso(53)
			rutinaUsuario = new SedentarioConNadaDeEjercicio
			fechaDeNacimiento = fechaInvalida
		]

		adrian = new Usuario => [
			sexo = new Masculino
			setNombre("Adrian")
			setAltura(2.00)
			setPeso(75)
		]

		marina = new Usuario => [
			federico.sexo = new Femenino
			setNombre("Marina")
			setAltura(1.60)
			setPeso(55)
		]

		usuarioDiabeticoConHipertension = new Usuario => [
			chorizo = new carne
			pollo = new carne
			setSexo = new Femenino
			setNombre("UsuarioDos")
			setAltura(1.76)
			setPeso(79)
			rutinaUsuario = new SedentarioConNadaDeEjercicio
			condicionesPreexistentes.add(new Diabetico)
			condicionesPreexistentes.add(new Hipertenso)
			preferenciasAlimentarias.add(chorizo)
			preferenciasAlimentarias.add(pollo)
			fechaDeNacimiento = fechaValida
		]

		usuarioFalsoVegano = new Usuario => [
			chorizo = new carne
			pollo = new carne
			setSexo = new Masculino
			setNombre("UsuarioVeganoFalso")
			setAltura(1.76)
			setPeso(79)
			rutinaUsuario = new SedentarioConNadaDeEjercicio
			condicionesPreexistentes.add(new Vegano)
			preferenciasAlimentarias.add(chorizo)
			fechaDeNacimiento = fechaValida
		]

		ensaladaCaprese = new Receta => [
			nalga = new carne
			harina = new Ingrediente
			huevo = new Ingrediente
			panRallado = new Ingrediente
			harina.setCalorias(25)
			huevo.setCalorias(10)
			panRallado.setCalorias(12)
			nalga.setCalorias(99)
			setNombreDelPlato("Milanesas")
			ingredientes.add(harina)
			ingredientes.add(huevo)
			ingredientes.add(panRallado)
			ingredientes.add(nalga)
			condicionesInadecuadas.add(new Hipertenso)
			condicionesInadecuadas.add(new Diabetico)
			condicionesInadecuadas.add(new Vegano)
			condicionesInadecuadas.add(new Celiaco)
		]

		papasAlHorno = new Receta => [
			harina = new Ingrediente
			harina.setCalorias(9)
			setNombreDelPlato("Pure")
			ingredientes.add(harina)
			condicionesInadecuadas.add(new Hipertenso)
			condicionesInadecuadas.add(new Diabetico)
			condicionesInadecuadas.add(new Vegano)
			condicionesInadecuadas.add(new Celiaco)
		]

	}

	// Punto 1: Indicar si un usuario es valido
	@Test
	def void testValidacionDeUsuario() {
		Assert.assertEquals(true, federico.usuarioValido()) //Validacion mas basica
		Assert.assertEquals(true, usuarioDiabeticoConHipertension.usuarioValido()) //validacion basica + condiciones preexistentes (Diabetico + Hipertenso)
	}

	@Test(expected=typeof(Exception))
	def void testValidacionDeUsuarioInvalido() {
	usuarioFalsoVegano.usuarioValido() //validacion basica + condiciones preexistentes (Diabetico + Hipertenso)
	}

	// Punto 2 : Averiguar el imc de un usuario
	@Test
	def void testImc() {
		Assert.assertEquals(23.48, federico.imc(), 0.1)
		Assert.assertEquals(21.48, marina.imc(), 0.1)
		Assert.assertEquals(18.7, adrian.imc(), 0.1)

	}

	// Averiguar si un usuario sigue una rutina saludable
	@Test
	def void usuarioSigueRutinaSaludable() {
		Assert.assertEquals(true, federico.sigoRutinaSaludable())
	}

	// Punto 3 : Hacer que un usuario agregue una receta
	@Test
	def void usuarioQueAgregaUnaReceta() {
		federico.agregarReceta(ensaladaCaprese)
	}

	// Conocer condiciones preexistentes para la que una receta es invalida
	@Test
	def void condicionesInadecuadasDeUnaReceta() {
		ensaladaCaprese.paraQueCondicionesSoyInadecuada()
	}

	//Punto 4: Saber si un usuario puede ver una receta dada
	@Test
	def void usuarioPuedeVerReceta() {
		federico.puedoVerReceta(ensaladaCaprese)
	}
	
	@Test
	def void usuarioNoPuedeVerReceta() {
		marina.puedoVerReceta(ensaladaCaprese)
	}

	//Saber si un usuario puede modificar una receta dada
	@Test
	def void usuarioPuedeModificarReceta() {
		federico.puedoModificarReceta(papasAlHorno)
	}

	@Test
	def void usuarioAgregaUnaRecetaYVemosSiPuedeModificarla() {
		federico.agregarReceta(ensaladaCaprese)
		Assert.assertEquals(true, federico.puedoModificarReceta(ensaladaCaprese))
	}

	//Modificar una receta dada, respetando la validacion anterior
	@Test
	def void usuarioAgregaUnaRecetaYLuegoLaModifica() {
		federico.agregarReceta(ensaladaCaprese)
		federico.modificarUnaReceta(ensaladaCaprese, papasAlHorno)
	}

	@Test(expected=typeof(Exception))
	def void usuarioAgregaUnaRecetaYLuegoOtroUsuarioNoPuedeModificarla() {
		adrian.agregarReceta(papasAlHorno)
		federico.modificarUnaReceta(papasAlHorno, ensaladaCaprese)
	}

	//Punto 5: Poder construir una receta con subrecetas.
	def void agregarSubrecetaAUnaReceta() {
		ensaladaCaprese.agregarSubReceta(papasAlHorno)
	}
}
