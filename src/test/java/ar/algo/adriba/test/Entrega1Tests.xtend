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
	Usuario usuario2
	Fecha fechaValida
	Fecha fechaInvalida

	
	carne chorizo
	carne pollo
	carne nalga

	Receta receta1
	Receta receta2

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

		usuario2 = new Usuario => [
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

			receta1 = new Receta => [
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

		receta2 = new Receta => [
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
	def void test1() {
		Assert.assertEquals(true, federico.usuarioValido()) //Validacion mas basica
		Assert.assertEquals(true, usuario2.usuarioValido()) //validacion basica + condiciones preexistentes (Diabetico + Hipertenso)
	}

	// Punto 2 : Averiguar el imc de un usuario
	@Test
	def void test2() {
		Assert.assertEquals(23.48, federico.imc(), 0.1)
		Assert.assertEquals(21.48, marina.imc(), 0.1)
		Assert.assertEquals(18.7, adrian.imc(), 0.1)

	}

	// Averiguar si un usuario sigue una rutina saludable
	@Test
	def void test3() {
		Assert.assertEquals(true, federico.sigoRutinaSaludable())
	}

	// Punto 3 : Hacer que un usuario agregue una receta
	@Test
	def void test4() {
		federico.agregarReceta(receta1)
	}

	// Conocer condiciones preexistentes para la que una receta es invalida
	@Test
	def void test5() {
		receta1.paraQueCondicionesSoyInadecuada()
	}

	//Punto 4: Saber si un usuario puede ver una receta dada
	@Test
	def void test6() {
		federico.puedoVerReceta(receta1)
	}

	//Saber si un usuario puede modificar una receta dada
	@Test
	def void test7() {
		federico.puedoModificarReceta(receta2)
	}

	@Test
	def void test8() {
		federico.agregarReceta(receta1)
		Assert.assertEquals(true, federico.puedoModificarReceta(receta1))
	}

	//Modificar una receta dada, respetando la validacion anterior
	@Test
	def void test9() {
		federico.agregarReceta(receta1)
		federico.modificarUnaReceta(receta1, receta2)
	}

	@Test(expected=typeof(Exception))
	def void test10() {
		adrian.agregarReceta(receta2)
		federico.modificarUnaReceta(receta2, receta1)
	}

	//Punto 5: Poder construir una receta con subrecetas.
	def void test11() {
		receta1.agregarSubReceta(receta2)
	}
}
