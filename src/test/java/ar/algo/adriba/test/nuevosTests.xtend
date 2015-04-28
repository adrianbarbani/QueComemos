package ar.algo.adriba.test

import ar.algo.adriba.tp1.CondicionPreexistente
import ar.algo.adriba.tp1.Diabetico
import ar.algo.adriba.tp1.Fecha
import ar.algo.adriba.tp1.Hipertenso
import ar.algo.adriba.tp1.Ingrediente
import ar.algo.adriba.tp1.Rutina
import ar.algo.adriba.tp1.Sexo
import ar.algo.adriba.tp1.Usuario
import ar.algo.adriba.tp1.Vegano
import java.util.ArrayList
import java.util.List
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import ar.algo.adriba.tp1.Receta
import ar.algo.adriba.tp1.RecetaPrivada
import ar.algo.adriba.tp1.Celiaco

class nuevosTests {

	Fecha fechaValida
	Fecha fechaInvalida
	List<Ingrediente> unasPreferenciasAlimentarias = new ArrayList<Ingrediente>
	List<Ingrediente> unasPreferenciasAlimentarias2 = new ArrayList<Ingrediente>
	List<CondicionPreexistente> unasCondicionesPreexistentesConHipertension = new ArrayList<CondicionPreexistente>
	List<CondicionPreexistente> unasCondicionesPreexistentesConVeganismo = new ArrayList<CondicionPreexistente>
	List<CondicionPreexistente> condicionesPreexistentes = new ArrayList<CondicionPreexistente>
	List<CondicionPreexistente> condicionesPreexistentes2 = new ArrayList<CondicionPreexistente>
	List<CondicionPreexistente> unasCondicionesPreexistentesCompletas = new ArrayList<CondicionPreexistente>
 	List<CondicionPreexistente> algunaCondicionInadecuada = new ArrayList<CondicionPreexistente>

	Usuario Usuario
	Usuario Usuario2

	Sexo Femenino
	Sexo Masculino

	RecetaPrivada RecetaValida
	RecetaPrivada RecetaInvalida
	Receta RecetaPublica
	Ingrediente carne
	Ingrediente harina
	Ingrediente huevo
	Ingrediente panRallado

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
		unasPreferenciasAlimentarias2.add(new Ingrediente(20, "manzana", 1))

		Usuario = new Usuario(52, 1.64, Masculino, "JuanJose", fechaValida, new Rutina(61, true),
			condicionesPreexistentes, unasPreferenciasAlimentarias2)

		//new (int unasCalorias, String unNombre, int unaCantidad)
		RecetaValida = new RecetaPrivada => [
			carne = new Ingrediente(99, "carne", 1)
			harina = new Ingrediente(25, "harina", 20)
			huevo = new Ingrediente(10, "huevo", 3)
			panRallado = new Ingrediente(12, "pan rallado", 50)
			setNombreDelPlato("Milanesas")
			ingredientes.add(harina)
			ingredientes.add(huevo)
			ingredientes.add(panRallado)
			ingredientes.add(carne)
		]

		RecetaInvalida = new RecetaPrivada => [
			harina = new Ingrediente(9, "papa", 1)
			setNombreDelPlato("Pure")
			ingredientes.add(harina)
		]

		RecetaPublica = new Receta => [
			harina = new Ingrediente(15, "papa", 1)
			setNombreDelPlato("Pure")
			ingredientes.add(harina)
		]

	}

	//Punto 1: Validacion de usuario
	@Test(expected=typeof(Exception))
	def void testValidacionDeUsuarioHipertensoNoValido() {
		new Usuario(50, 1.60, Femenino, "Marina", fechaValida, new Rutina(20, true),
			unasCondicionesPreexistentesConHipertension, unasPreferenciasAlimentarias)
	}

	@Test
	def void testValidacionDeUsuarioVeganoValido() {
		new Usuario(52, 1.64, Masculino, "JuanCarlos", fechaValida, new Rutina(30, true),
			unasCondicionesPreexistentesConVeganismo, unasPreferenciasAlimentarias)

	}

	//Punto2: Indice de masa corporal
	@Test
	def void indiceMasaCorporal() {
		Usuario = new Usuario(52, 1.64, Masculino, "JuanCarlos", fechaValida, new Rutina(40, true),
			unasCondicionesPreexistentesConVeganismo, unasPreferenciasAlimentarias)

		Assert.assertEquals(19.3, Usuario.imc(), 0.5)

	}

	//Punto 2: Averiguar si un usuario sigue una rutina saludable (hago todos los casos)
	@Test
	def void diabeticoSigueRutinaValida() {
		condicionesPreexistentes2.add(new Diabetico)
		unasPreferenciasAlimentarias.add(new Ingrediente(20, "chori", 1))

		Usuario2 = new Usuario(52, 1.64, Masculino, "Adrian", fechaValida, new Rutina(40, true),
			condicionesPreexistentes2, unasPreferenciasAlimentarias)

		Assert.assertTrue(Usuario2.sigoRutinaSaludable())

	}

	@Test
	def void diabeticoSigueRutinaInvalidaPeroTienePesoBajo() {
		condicionesPreexistentes2.add(new Diabetico)
		unasPreferenciasAlimentarias.add(new Ingrediente(20, "pescado", 1))

		Usuario2 = new Usuario(52, 1.64, Masculino, "Josecito", fechaValida, new Rutina(35, false),
			condicionesPreexistentes2, unasPreferenciasAlimentarias)

		Assert.assertTrue(Usuario2.sigoRutinaSaludable())

	}

	@Test
	def void diabeticoSigueRutinaInvalidayTienePesoAlto() {
		condicionesPreexistentes2.add(new Diabetico)
		unasPreferenciasAlimentarias.add(new Ingrediente(20, "pescado", 1))

		Usuario2 = new Usuario(102, 1.64, Masculino, "Josecito", fechaValida, new Rutina(35, false),
			condicionesPreexistentes2, unasPreferenciasAlimentarias)

		Assert.assertFalse(Usuario2.sigoRutinaSaludable())

	}
	@Test
	def void veganoSigueRutinaValida() {
		condicionesPreexistentes2.add(new Vegano)
		unasPreferenciasAlimentarias.add(new Ingrediente(20, "frutas", 1))

		Usuario2 = new Usuario(52, 1.64, Femenino, "Camila", fechaValida, new Rutina(20, true),
			condicionesPreexistentes2, unasPreferenciasAlimentarias)

		Assert.assertTrue(Usuario2.sigoRutinaSaludable())

	}

	@Test
	def void veganoSigueRutinaInvalida() {
		condicionesPreexistentes2.add(new Vegano)
		unasPreferenciasAlimentarias.add(new Ingrediente(20, "fideos", 1))
		Usuario2 = new Usuario(52, 1.64, Masculino, "Miguel", fechaValida, new Rutina(61, false),
			condicionesPreexistentes2, unasPreferenciasAlimentarias)

		Assert.assertFalse(Usuario2.sigoRutinaSaludable())

	}

	@Test
	def void hipertensoSigueRutinaValida() {
		condicionesPreexistentes.add(new Hipertenso)
		unasPreferenciasAlimentarias.add(new Ingrediente(20, "manzana", 1))
		Usuario = new Usuario(52, 1.64, Masculino, "JuanJose", fechaValida, new Rutina(61, true),
			condicionesPreexistentes, unasPreferenciasAlimentarias)

		Assert.assertTrue(Usuario.sigoRutinaSaludable())

	}

	@Test
	def void hipertensoSigueRutinaInvalida() {
		condicionesPreexistentes2.add(new Hipertenso)
		unasPreferenciasAlimentarias.add(new Ingrediente(20, "manzana", 1))
		Usuario2 = new Usuario(52, 1.64, Femenino, "Daiana", fechaValida, new Rutina(20, true),
			condicionesPreexistentes, unasPreferenciasAlimentarias)

		Assert.assertFalse(Usuario2.sigoRutinaSaludable())

	}

	//Punto 3: Hacer que un usuario agregue una receta
	@Test
	def void usuarioAgregaRecetaValida() {
		Usuario.agregarReceta(RecetaValida)

	}

	@Test(expected=typeof(Exception))
	def void usuarioAgregaRecetaInvalida() {
		Usuario.agregarReceta(RecetaInvalida)
	}

	//Punto 3: Conocer las condiciones preexistentes para la que una receta es inadecuada
	@Test
	def void condicionesPreexistentesDeUnaReceta() {
  	Assert.assertTrue(RecetaValida.paraQueCondicionesSoyInadecuada(unasCondicionesPreexistentesCompletas).size > 0)
  	}

	//Punto 4: Saber si un usuario puede ver o modificar una receta dada
	@Test
	def void quieroVerOModificarRecetaMiaYPuedo() { //Receta privada mia

		RecetaValida.SetduenioReceta(Usuario)

		Assert.assertEquals(true, Usuario.puedoVerReceta(RecetaValida))
		Assert.assertEquals(true, Usuario.puedoModificarReceta(RecetaValida))
	}

	@Test(expected=typeof(Exception))
	def void quieroVerOModificarRecetaDeOtroYNoPuedo() { //Receta privada de otro

		Usuario.puedoVerReceta(RecetaValida)
		Usuario.puedoModificarReceta(RecetaValida)
	}

	@Test
	def void quieroVerOModificarRecetaPublica() { //Receta publica

		Usuario.puedoVerReceta(RecetaPublica)
		Usuario.puedoModificarReceta(RecetaPublica)
	}

	//Punto 4: Modificar una receta
	@Test
	def void modificarUnaRecetaMia() { //Modificar receta mia

		RecetaValida.SetduenioReceta(Usuario)
		Usuario.modificarUnaReceta(RecetaValida, RecetaInvalida)
	}

	@Test(expected=typeof(Exception))
	def void modificarRecetaDeOtro() { //Modificar receta privada de otro

		Usuario.modificarUnaReceta(RecetaValida, RecetaInvalida)
	}

	@Test
	def void modificarRecetaPublica() { //Receta publica

		Usuario.modificarUnaReceta(RecetaPublica, RecetaInvalida)
	}

	//Punto 5: Poder crear una receta con subrecetas
	@Test
	def void crearRecetaConSubrecetas() {
		RecetaValida.agregarSubReceta(RecetaPublica)
	}

}
