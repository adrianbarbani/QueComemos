package ar.algo.adriba.test

import ar.algo.adriba.tp1.carne
import ar.algo.adriba.tp1.Diabetico
import ar.algo.adriba.tp1.Femenino
import ar.algo.adriba.tp1.Fruta
import ar.algo.adriba.tp1.Masculino
import ar.algo.adriba.tp1.SedentariaConAlgoDeEjercicio
import ar.algo.adriba.tp1.SedentarioConNadaDeEjercicio
import ar.algo.adriba.tp1.Usuario
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import ar.algo.adriba.tp1.Hipertenso
import ar.algo.adriba.tp1.Vegano
import ar.algo.adriba.tp1.ActivaConEjercicioAdicional
import ar.algo.adriba.tp1.ActivaSinEjercicioAdicional

class TestImc { // le puse un nombre descriptivo

	Usuario federico
	Usuario marina
	Usuario adrian
	Usuario usuario1
	Usuario usuario2
	Usuario usuario3
	Usuario usuario4
	Usuario usuario5
	Usuario usuario6
	Usuario usuario1b

	Fruta fruta
	Fruta manzana
	carne chorizo
	carne pollo

	@Before // agregué el método init para los tests y metí todos los constructores y setters ahi
	def void init() {

		federico = new Usuario => [
			setSexo = new Masculino
			setNombre("Federico")
			setAltura(1.88)
			setPeso(83)
			rutinaUsuario = new SedentarioConNadaDeEjercicio
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

		usuario1 = new Usuario => [
			fruta = new Fruta
			setSexo = new Masculino
			setNombre("UsuarioUno")
			setAltura(1.76)
			setPeso(79)
			rutinaUsuario = new ActivaSinEjercicioAdicional
			condicionesPreexistentes.add(new Diabetico)
			preferenciasAlimentarias.add(fruta)
		]
		
		usuario1b = new Usuario => [
			fruta = new Fruta
			setSexo = new Masculino
			setNombre("UsuarioUno")
			setAltura(1.76)
			setPeso(65)
			rutinaUsuario = new SedentarioConNadaDeEjercicio
			condicionesPreexistentes.add(new Diabetico)
			preferenciasAlimentarias.add(fruta)
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
		]

		usuario3 = new Usuario => [
			chorizo = new carne
			setSexo = new Femenino
			setNombre("UsuarioTres")
			setAltura(1.55)
			setPeso(90)
			rutinaUsuario = new SedentarioConNadaDeEjercicio
			condicionesPreexistentes.add(new Vegano)
			preferenciasAlimentarias.add(chorizo)
		]

		usuario4 = new Usuario => [
			manzana = new Fruta
			setSexo = new Masculino
			setNombre("UsuarioCuatro")
			setAltura(1.81)
			setPeso(83)
			rutinaUsuario = new SedentariaConAlgoDeEjercicio
			condicionesPreexistentes.add(new Vegano)
			preferenciasAlimentarias.add(manzana)
		]
		
		
		usuario5 = new Usuario => [
			
			setSexo = new Femenino
			setNombre("UsuarioCinco")
			setAltura(1.76)
			setPeso(80)
			rutinaUsuario = new ActivaConEjercicioAdicional
			condicionesPreexistentes.add(new Hipertenso)
			
			]
			
		usuario6 = new Usuario => [
			
			setSexo = new Masculino
			setNombre("UsuarioSeis")
			setAltura(1.82)
			setPeso(2)
			rutinaUsuario = new ActivaSinEjercicioAdicional
			condicionesPreexistentes.add(new Hipertenso)
			
			]
	}

	//-------------------Tests de entrega 0------------------
	@Test
	def void federicoImc() {
		Assert.assertEquals(23.48, federico.imc(), 0.1)
	}

	@Test
	def void marinaImc() {
		Assert.assertEquals(21.48, marina.imc(), 0.1)

	}

	@Test
	def void adrianImc() {
		Assert.assertEquals(18.7, adrian.imc(), 0.1)
	}

	//-------------------------------------------------------
	@Test
	def void test1() { //validacion mas basica (nombre, sexo, fecha y rutina valida)
		Assert.assertEquals(true, federico.usuarioValido())
	}

	@Test
	def void test2() { //validacion basica + condiciones preexistentes (SOLO Diabetico)
		Assert.assertEquals(true, usuario1.usuarioValido())
	}

	@Test
	def void test3() { //validacion basica + condiciones preexistentes (Diabetico + Hipertenso)
		Assert.assertEquals(true, usuario2.usuarioValido())
	}

	@Test
	def void test4VeganoConCarne() { //validacion basica + condiciones preexistentes (SOLO Vegano) 
		Assert.assertEquals(false, usuario3.usuarioValido())
	}

	@Test
	def void test4VeganoSinCarne() { //validacion basica + condiciones preexistentes (SOLO Vegano) 
		Assert.assertEquals(true, usuario4.usuarioValido())
	}

	@Test
	def void test5() {
		Assert.assertEquals(true, federico.sigoRutinaSaludable())

	}

	@Test
	def void test6VeganoConCarne() {
		Assert.assertEquals (false, usuario3.sigoRutinaSaludable())
	
	}
	@Test
	def void test6VeganoSinCarne() {
		Assert.assertEquals(true, usuario4.sigoRutinaSaludable())
	}
	
	@Test
	def void test7HipertensoBien() {
		Assert.assertEquals(true, usuario5.sigoRutinaSaludable())
	}
	
	@Test
	def void test8HipertensoMal() {
		Assert.assertEquals(false, usuario6.sigoRutinaSaludable())
	}
	
	@Test
	def void test9Diabetico() {
		Assert.assertEquals(true, usuario1b.sigoRutinaSaludable())
	}
	
	@Test
	def void test10Diabetico() {
		Assert.assertEquals(true, usuario1.sigoRutinaSaludable())
	}
}
