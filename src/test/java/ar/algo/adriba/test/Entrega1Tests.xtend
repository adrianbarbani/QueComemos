package ar.algo.adriba.test

import ar.algo.adriba.tp1.Celiaco
import ar.algo.adriba.tp1.Comida
import ar.algo.adriba.tp1.CondicionPreexistente
import ar.algo.adriba.tp1.Diabetico
import ar.algo.adriba.tp1.Fecha
import ar.algo.adriba.tp1.Hipertenso
import ar.algo.adriba.tp1.Publica
import ar.algo.adriba.tp1.Receta
import ar.algo.adriba.tp1.Rutina
import ar.algo.adriba.tp1.Sexo
import ar.algo.adriba.tp1.Usuario
import ar.algo.adriba.tp1.Vegano
import java.util.ArrayList
import java.util.List
import org.junit.Assert
import org.junit.Before
import org.junit.Test
/* 
class Entrega1Tests {

	Fecha fechaValida
	Fecha fechaInvalida
	List<String> unasPreferenciasAlimentarias = new ArrayList<String>
	List<String> unasPreferenciasAlimentarias2 = new ArrayList<String>
	List<CondicionPreexistente> unasCondicionesPreexistentesConHipertension = new ArrayList<CondicionPreexistente>
	List<CondicionPreexistente> unasCondicionesPreexistentesConVeganismo = new ArrayList<CondicionPreexistente>
	List<CondicionPreexistente> condicionesPreexistentes = new ArrayList<CondicionPreexistente>
	List<CondicionPreexistente> condicionesPreexistentes2 = new ArrayList<CondicionPreexistente>
	List<CondicionPreexistente> unasCondicionesPreexistentesCompletas = new ArrayList<CondicionPreexistente>
	List<String> comidasQueDisgustan1 = new ArrayList<String>

	Usuario usuario1
	Usuario usuario2

	Sexo Femenino
	Sexo Masculino

	Receta recetaValida
	Receta recetaInvalida
	Receta recetaPublica
	Receta RecetaPrivada
	Comida carne
	Comida harina
	Comida huevo
	Comida panRallado

	@Before
	def void init() {

		// Usamos la fecha de ayer como fecha VALIDA
		fechaValida = new Fecha(System.currentTimeMillis() - 24 * 60 * 60 * 1000);

		// Usamos la fecha de mañana como fecha INVALIDA
		fechaInvalida = new Fecha(System.currentTimeMillis() + 24 * 60 * 60 * 1000);

		Femenino = new Sexo("Femenino")
		Masculino = new Sexo("Masculino")

		unasCondicionesPreexistentesCompletas => [
			add(new Hipertenso)
			add(new Vegano)
			add(new Celiaco)
			add(new Diabetico)
		] // esto lo usamos para ver si la receta tiene condiciones inadecuadas

		unasCondicionesPreexistentesConHipertension.add(new Hipertenso)
		unasCondicionesPreexistentesConVeganismo.add(new Vegano)

		condicionesPreexistentes.add(new Hipertenso)
		unasPreferenciasAlimentarias2.add("manzana")

		usuario1 = new Usuario(52, 1.64, Masculino, "JuanJose", fechaValida, new Rutina(61, true),
			condicionesPreexistentes, unasPreferenciasAlimentarias2, comidasQueDisgustan1)

		carne = new Comida(99, "carne", 1)
		harina = new Comida(25, "harina", 1)
		huevo = new Comida(10, "huevo", 3)
		panRallado = new Comida(12, "pan rallado", 50)

		//new (int unasCalorias, String unNombre, int unaCantidad)
		recetaValida = new Receta => [
			setNombreDelPlato("Milanesas")
			caloriasReceta = 250
			subRecetaseIngredientes.add(harina)
			subRecetaseIngredientes.add(huevo)
			subRecetaseIngredientes.add(panRallado)
			subRecetaseIngredientes.add(carne)
		]

		recetaInvalida = new Receta => [
			tipo = new Publica()
			setNombreDelPlato("Pure")
			subRecetaseIngredientes.add(harina)
		]

		recetaPublica = new Receta => [
			tipo = new Publica()
			caloriasReceta = 40
			setNombreDelPlato("Pure")
			subRecetaseIngredientes.add(harina)
		]

		RecetaPrivada = new Receta => [
			tipo = new Publica
			caloriasReceta = 40
			setNombreDelPlato("Pure")
			subRecetaseIngredientes.add(harina)
		]

	}

	//Punto 1: Validacion de usuario
	@Test(expected=typeof(Exception))
	def void testValidacionDeUsuarioHipertensoNoValido() {
		new Usuario(50, 1.60, Femenino, "Marina", fechaValida, new Rutina(20, true),
			unasCondicionesPreexistentesConHipertension, unasPreferenciasAlimentarias, comidasQueDisgustan1)
	}

	@Test
	def void testValidacionDeUsuarioVeganoValido() {
		new Usuario(52, 1.64, Masculino, "JuanCarlos", fechaValida, new Rutina(30, true),
			unasCondicionesPreexistentesConVeganismo, unasPreferenciasAlimentarias, comidasQueDisgustan1)

	}

	//Punto2: Indice de masa corporal
	@Test
	def void indiceMasaCorporal() {
		usuario1 = new Usuario(52, 1.64, Masculino, "JuanCarlos", fechaValida, new Rutina(40, true),
			unasCondicionesPreexistentesConVeganismo, unasPreferenciasAlimentarias, comidasQueDisgustan1)

		Assert.assertEquals(19.3, usuario1.imc(), 0.5)

	}

	//Punto 2: Averiguar si un usuario sigue una rutina saludable (hago todos los casos)
	@Test
	def void diabeticoSigueRutinaValida() {
		condicionesPreexistentes2.add(new Diabetico)
		unasPreferenciasAlimentarias.add("chori")

		usuario2 = new Usuario(52, 1.64, Masculino, "Adrian", fechaValida, new Rutina(40, true),
			condicionesPreexistentes2, unasPreferenciasAlimentarias, comidasQueDisgustan1)

		Assert.assertTrue(usuario2.sigoRutinaSaludable())

	}

	@Test
	def void diabeticoSigueRutinaInvalidaPeroTienePesoBajo() {
		condicionesPreexistentes2.add(new Diabetico)
		unasPreferenciasAlimentarias.add("pescado")

		usuario2 = new Usuario(52, 1.64, Masculino, "Josecito", fechaValida, new Rutina(35, false),
			condicionesPreexistentes2, unasPreferenciasAlimentarias, comidasQueDisgustan1)

		Assert.assertTrue(usuario2.sigoRutinaSaludable())

	}

	@Test
	def void diabeticoSigueRutinaInvalidayTienePesoAlto() {
		condicionesPreexistentes2.add(new Diabetico)
		unasPreferenciasAlimentarias.add("pescado")

		usuario2 = new Usuario(102, 1.64, Masculino, "Josecito", fechaValida, new Rutina(35, false),
			condicionesPreexistentes2, unasPreferenciasAlimentarias, comidasQueDisgustan1)

		Assert.assertFalse(usuario2.sigoRutinaSaludable())

	}

	@Test
	def void veganoSigueRutinaValida() {
		condicionesPreexistentes2.add(new Vegano)
		unasPreferenciasAlimentarias.add("frutas")

		usuario2 = new Usuario(52, 1.64, Femenino, "Camila", fechaValida, new Rutina(20, true),
			condicionesPreexistentes2, unasPreferenciasAlimentarias, comidasQueDisgustan1)

		Assert.assertTrue(usuario2.sigoRutinaSaludable())

	}

	@Test
	def void veganoSigueRutinaInvalida() {
		condicionesPreexistentes2.add(new Vegano)
		unasPreferenciasAlimentarias.add("fideos")
		usuario2 = new Usuario(52, 1.64, Masculino, "Miguel", fechaValida, new Rutina(61, false),
			condicionesPreexistentes2, unasPreferenciasAlimentarias, comidasQueDisgustan1)

		Assert.assertFalse(usuario2.sigoRutinaSaludable())

	}

	@Test
	def void hipertensoSigueRutinaValida() {
		condicionesPreexistentes.add(new Hipertenso)
		unasPreferenciasAlimentarias.add("manzana")
		usuario1 = new Usuario(52, 1.64, Masculino, "JuanJose", fechaValida, new Rutina(61, true),
			condicionesPreexistentes, unasPreferenciasAlimentarias, comidasQueDisgustan1)

		Assert.assertTrue(usuario1.sigoRutinaSaludable())

	}

	@Test
	def void hipertensoSigueRutinaInvalida() {
		condicionesPreexistentes2.add(new Hipertenso)
		unasPreferenciasAlimentarias.add("manzana")
		usuario2 = new Usuario(52, 1.64, Femenino, "Daiana", fechaValida, new Rutina(20, true),
			condicionesPreexistentes, unasPreferenciasAlimentarias, comidasQueDisgustan1)

		Assert.assertFalse(usuario2.sigoRutinaSaludable())

	}

	//Punto 3: Hacer que un usuario agregue una receta
	@Test
	def void usuarioAgregaRecetaValida() {
		usuario1.agregarReceta(recetaPublica)

	}

	@Test(expected=typeof(Exception))
	def void usuarioAgregaRecetaInvalida() {
		usuario1.agregarReceta(recetaInvalida)
	}

	//Punto 3: Conocer las condiciones preexistentes para la que una receta es inadecuada
	@Test
	def void condicionesPreexistentesDeUnaReceta() {
		Assert.assertTrue(recetaValida.getParaQueCondicionesSoyInadecuada(unasCondicionesPreexistentesCompletas).size > 0)
	}

	//Punto 4: Saber si un usuario puede ver o modificar una receta dada
	@Test
	def void quieroVerOModificarRecetaMiaYPuedo() { //Receta privada mia
		usuario1.agregarReceta(RecetaPrivada)
		Assert.assertTrue(usuario1.puedoVerReceta(RecetaPrivada))
		Assert.assertTrue(usuario1.puedoModificarReceta(RecetaPrivada))
	}

	@Test(expected=typeof(Exception))
	def void quieroVerOModificarRecetaDeOtroYNoPuedo() { //Receta privada de otro

		usuario1.puedoVerReceta(recetaValida)
		usuario1.puedoModificarReceta(recetaValida)
	}

	@Test
	def void quieroVerOModificarRecetaPublica() { //Receta publica

		Assert.assertTrue(usuario1.puedoVerReceta(recetaPublica))
		Assert.assertTrue(usuario1.puedoModificarReceta(recetaPublica))
	}

	//Punto 4: Modificar una receta
	@Test
	def void modificarUnaRecetaMia() { //Modificar receta mia
		usuario1.agregarReceta(RecetaPrivada)
		usuario1.modificarUnaReceta(RecetaPrivada, recetaValida)
	}

	@Test(expected=typeof(Exception))
	def void modificarRecetaDeOtro() { //Modificar receta privada de otro
		usuario1.modificarUnaReceta(recetaValida, recetaInvalida)
	}

	@Test
	def void modificarRecetaPublica() { //Receta publica
			usuario1.modificarUnaReceta(recetaPublica, recetaValida)
	}

	//Punto 5: Poder crear una receta con subrecetas
	@Test
	def void crearRecetaConSubrecetas() {
		recetaValida.agregarSubReceta(recetaPublica)
	}

}
*/