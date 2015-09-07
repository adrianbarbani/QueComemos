package ar.algo.adriba.test
/* 
import ar.algo.adriba.tp1.Celiaco
import ar.algo.adriba.tp1.Comida
import ar.algo.adriba.tp1.CompararPorCalorias
import ar.algo.adriba.tp1.CompararPorNombre
import ar.algo.adriba.tp1.CondicionPreexistente
import ar.algo.adriba.tp1.Diabetico
import ar.algo.adriba.tp1.Fecha
import ar.algo.adriba.tp1.Filtro
import ar.algo.adriba.tp1.FiltroCondicionesPreexistentes
import ar.algo.adriba.tp1.FiltroDeCalorias
import ar.algo.adriba.tp1.FiltroDeIngredientesCaros
import ar.algo.adriba.tp1.FiltroPorGusto
import ar.algo.adriba.tp1.GrupoDeUsuario
import ar.algo.adriba.tp1.Hipertenso
import ar.algo.adriba.tp1.MostrarLosPrimerosDiez
import ar.algo.adriba.tp1.MostrarResultadosPares
import ar.algo.adriba.tp1.Ordenamiento
import ar.algo.adriba.tp1.Privada
import ar.algo.adriba.tp1.Publica
import ar.algo.adriba.tp1.Receta
import ar.algo.adriba.tp1.RepositorioRecetas
import ar.algo.adriba.tp1.RepositorioUsuarios
import ar.algo.adriba.tp1.Rutina
import ar.algo.adriba.tp1.Sexo
import ar.algo.adriba.tp1.Usuario
import ar.algo.adriba.tp1.Vegano
import java.util.ArrayList
import java.util.List
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import queComemos.entrega3.dominio.Dificultad
import ar.algo.adriba.tp1.RepositorioExterno
import ar.algo.adriba.tp1.ObserverConsultaVegano
import ar.algo.adriba.tp1.ObserverDeHora
import ar.algo.adriba.tp1.ObserverDeLasMasConsultadas
import ar.algo.adriba.tp1.ObserverMasConsultadaPorSexo
import ar.algo.adriba.tp1.ObserversConsulta
import ar.algo.adriba.tp1.Busqueda
import ar.algo.adriba.tp1.Repositorio

class Entrega3Tests {

	Fecha fechaValida
	Fecha fechaInvalida

	List<CondicionPreexistente> unasCondicionesPreexistentesCompletas = new ArrayList<CondicionPreexistente>

	List<Usuario> integrantesVeganoEHipertenso = new ArrayList<Usuario>
	List<Usuario> integrantesDiabeticoEHipertenso = new ArrayList<Usuario>
	List<Usuario> integrantesGordoYDiabetico = new ArrayList<Usuario>

	//List<ObserversConsulta> observers = new ArrayList<ObserversConsulta>
	Sexo Femenino
	Sexo Masculino

	Receta milanesa
	Receta milanesaNapolitana
	Receta pizza
	Receta sopaDeVerdura
	Receta pizzaDeVerdura
	Receta lomoALaPlancha
	Receta hummus

	Comida garbanzos
	Comida limon
	Comida ajo
	Comida lomo
	Comida carne
	Comida harina
	Comida huevo
	Comida panRallado
	Comida verdura
	Comida queso
	Comida prepizza
	Comida salsaDeTomate
	Comida sal
	Comida salsaBlanca

	List<String> comidasQueDisgustanConCarne = new ArrayList<String>
	List<String> comidasQueDisgustanConQueso = new ArrayList<String>

	List<String> unasPreferenciasConQuesoYVerdura = new ArrayList<String>
	List<String> unasPreferenciasConCarneQuesoYVerdura = new ArrayList<String>
	List<String> unasPreferenciasConFrutayVerdura = new ArrayList<String>
	List<String> unasPreferenciasConCarneYQueso = new ArrayList<String>
	List<String> unasPreferenciasConCarne = new ArrayList<String>
	List<String> unasPreferenciasVacias = new ArrayList<String>

	List<CondicionPreexistente> unasCondicionesConVeganismo = new ArrayList<CondicionPreexistente>
	List<CondicionPreexistente> unasCondicionesConHipertension = new ArrayList<CondicionPreexistente>
	List<CondicionPreexistente> unasCondicionesConHipertensionYVeganismo = new ArrayList<CondicionPreexistente>
	List<CondicionPreexistente> unasCondicionesConDiabetes = new ArrayList<CondicionPreexistente>
	List<CondicionPreexistente> unasCondicionesVacias = new ArrayList<CondicionPreexistente>

	Usuario usuarioSinCondiciones
	Usuario usuarioVegano
	Usuario usuarioVeganoSegundo
	Usuario usuarioConSobrePesoYDiabetesQueLeGustaLaCarne
	Usuario usuarioHipertensoQueNoLeGustaElQueso
	Usuario usuarioDiabeticoQueNoLeGustaLaCarne

	GrupoDeUsuario grupoQueLeGustaQuesoYVerdura
	GrupoDeUsuario grupoQueLeGustaFrutaYVerdura
	GrupoDeUsuario grupoQueLeGustaCarneYQueso
	GrupoDeUsuario grupoQueLeGustaCarneQuesoYVerdura

	RepositorioRecetas stubRepositorioDeRecetas = RepositorioRecetas.getInstance()
	RepositorioUsuarios stubRepositorioDeUsuarios = RepositorioUsuarios.getInstance()

	List<Filtro> filtroPorGusto = new ArrayList<Filtro>
	List<Filtro> filtroDeCalorias = new ArrayList<Filtro>
	List<Filtro> filtroDeCaloriasYGusto = new ArrayList<Filtro>
	List<Filtro> filtroDeIngredientesCaros = new ArrayList<Filtro>
	List<Filtro> filtroDeIngredientesCarosYCalorias = new ArrayList<Filtro>
	List<Filtro> filtroCondicionesPreexistentes = new ArrayList<Filtro>

	Busqueda busquedaVegana
	Busqueda busquedaVeganaSegunda
	Busqueda busquedaNoVegana
	Busqueda busquedaMasculina
	Busqueda busquedaMasculinaSegunda
	Busqueda busquedaFemenina
	Busqueda busquedaFemeninaSegunda

	Ordenamiento mostrarLosPrimerosDiez
	Ordenamiento mostrarResultadosPares
	Ordenamiento compararPorCalorias
	Ordenamiento compararPorNombre

	ObserverConsultaVegano observerConsultaVegano
	ObserversConsulta observerDeHora
	ObserversConsulta observerMasConsultadaPorSexo
	ObserversConsulta observerDeLasMasConsultadas

	@Before
	def void init() {

		stubRepositorioDeRecetas.limpiar()

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

		carne = new Comida(99, "carne", 1)
		harina = new Comida(25, "harina", 20)
		huevo = new Comida(10, "huevo", 3)
		panRallado = new Comida(12, "pan rallado", 50)
		verdura = new Comida(6, "verdura", 12)
		queso = new Comida(250, "queso", 800)
		prepizza = new Comida(200, "prepizza", 50)
		salsaDeTomate = new Comida(20, "salsa de tomate", 50)
		sal = new Comida(0, "sal", 0)
		salsaBlanca = new Comida(50, "salsa blanca", 400)
		lomo = new Comida(30, "lomo", 200)
		garbanzos = new Comida(30, "garbanzos", 500)
		limon = new Comida(1, "limon", 10)
		ajo = new Comida(1, "ajo", 10)

		unasPreferenciasConCarne.add("carne")
		unasPreferenciasConCarneQuesoYVerdura.add("carne")
		unasPreferenciasConCarneQuesoYVerdura.add("queso")
		unasPreferenciasConCarneQuesoYVerdura.add("verdura")
		unasPreferenciasConQuesoYVerdura.add("queso")
		unasPreferenciasConQuesoYVerdura.add("verdura")
		unasPreferenciasConFrutayVerdura.add("fruta")
		unasPreferenciasConFrutayVerdura.add("verdura")
		unasPreferenciasConCarneYQueso.add("queso")
		unasPreferenciasConCarneYQueso.add("carne")

		comidasQueDisgustanConQueso.add("queso")
		comidasQueDisgustanConCarne.add("carne")

		unasCondicionesConVeganismo.add(new Vegano)
		unasCondicionesConHipertension.add(new Hipertenso)
		unasCondicionesConHipertensionYVeganismo.add(new Hipertenso)
		unasCondicionesConHipertensionYVeganismo.add(new Vegano)
		unasCondicionesConDiabetes.add(new Diabetico)

		usuarioSinCondiciones = new Usuario(52, 1.64, Femenino, "Esteban", fechaValida, new Rutina(61, true),
			unasCondicionesVacias, unasPreferenciasVacias, unasPreferenciasVacias)

		usuarioVegano = new Usuario(52, 1.64, Femenino, "Marina", fechaValida, new Rutina(61, true),
			unasCondicionesConVeganismo, unasPreferenciasConFrutayVerdura, comidasQueDisgustanConCarne)

		usuarioVeganoSegundo = new Usuario(52, 1.64, Masculino, "Carlos", fechaValida, new Rutina(61, true),
			unasCondicionesConVeganismo, unasPreferenciasConFrutayVerdura, comidasQueDisgustanConCarne)

		usuarioHipertensoQueNoLeGustaElQueso = new Usuario(67, 1.91, Masculino, "Adrian", fechaValida,
			new Rutina(74, true), unasCondicionesConHipertension, unasPreferenciasConCarneYQueso,
			comidasQueDisgustanConQueso)

		usuarioDiabeticoQueNoLeGustaLaCarne = new Usuario(80, 1.74, Masculino, "Federico", fechaValida,
			new Rutina(82, true), unasCondicionesConDiabetes, unasPreferenciasConQuesoYVerdura,
			comidasQueDisgustanConCarne)

		usuarioConSobrePesoYDiabetesQueLeGustaLaCarne = new Usuario(1500, 1.44, Femenino, "Esteban", fechaValida,
			new Rutina(10, true), unasCondicionesConDiabetes, unasPreferenciasConCarne, comidasQueDisgustanConQueso)

		milanesa = new Receta => [
			tipo = new Publica
			setNombreDelPlato("Milanesas")
			subRecetaseIngredientes.add(harina)
			subRecetaseIngredientes.add(huevo)
			subRecetaseIngredientes.add(panRallado)
			subRecetaseIngredientes.add(carne)
			caloriasReceta = 150
			dificultad = ("Dificil")
		]

		milanesaNapolitana = new Receta => [
			tipo = new Publica
			setNombreDelPlato("Milanesa napolitana")
			subRecetaseIngredientes.add(harina)
			subRecetaseIngredientes.add(huevo)
			subRecetaseIngredientes.add(panRallado)
			subRecetaseIngredientes.add(carne)
			subRecetaseIngredientes.add(queso)
			subRecetaseIngredientes.add(salsaDeTomate)
			caloriasReceta = 8000
		]

		sopaDeVerdura = new Receta => [
			tipo = new Publica
			setNombreDelPlato("Sopa de Verdura")
			subRecetaseIngredientes.add(verdura)
			subRecetaseIngredientes.add(sal)
			caloriasReceta = 200
			dificultad = ("Dificil")
		]

		pizza = new Receta => [
			tipo = new Publica
			setNombreDelPlato("Pizza de muzzarella")
			subRecetaseIngredientes.add(prepizza)
			subRecetaseIngredientes.add(salsaDeTomate)
			subRecetaseIngredientes.add(queso)
			caloriasReceta = 500
		]

		pizzaDeVerdura = new Receta => [
			tipo = new Publica
			setNombreDelPlato("Pizza de verdura y salsa blanca")
			subRecetaseIngredientes.add(prepizza)
			subRecetaseIngredientes.add(salsaDeTomate)
			subRecetaseIngredientes.add(queso)
			subRecetaseIngredientes.add(salsaBlanca)
			subRecetaseIngredientes.add(verdura)
			caloriasReceta = 560
		]

		lomoALaPlancha = new Receta => [
			tipo = new Publica
			setNombreDelPlato("Lomo a la Plancha")
			subRecetaseIngredientes.add(lomo)
			caloriasReceta = 300
		]

		hummus = new Receta => [
			tipo = new Privada(usuarioVegano, hummus)
			setNombreDelPlato("Hummus de garbanzo")
			subRecetaseIngredientes.add(garbanzos)
			subRecetaseIngredientes.add(limon)
			subRecetaseIngredientes.add(ajo)
			caloriasReceta = 600
		]

		integrantesVeganoEHipertenso.add(usuarioVegano)
		integrantesVeganoEHipertenso.add(usuarioHipertensoQueNoLeGustaElQueso)
		integrantesDiabeticoEHipertenso.add(usuarioDiabeticoQueNoLeGustaLaCarne)
		integrantesDiabeticoEHipertenso.add(usuarioHipertensoQueNoLeGustaElQueso)
		integrantesGordoYDiabetico.add(usuarioConSobrePesoYDiabetesQueLeGustaLaCarne)
		integrantesGordoYDiabetico.add(usuarioDiabeticoQueNoLeGustaLaCarne)

		grupoQueLeGustaQuesoYVerdura = new GrupoDeUsuario("Los de algo 2", integrantesVeganoEHipertenso,
			unasPreferenciasConQuesoYVerdura)
		grupoQueLeGustaFrutaYVerdura = new GrupoDeUsuario("Los Borbotones", integrantesDiabeticoEHipertenso,
			unasPreferenciasConFrutayVerdura)
		grupoQueLeGustaCarneYQueso = new GrupoDeUsuario("Los del club", integrantesDiabeticoEHipertenso,
			unasPreferenciasConCarneYQueso)
		grupoQueLeGustaCarneQuesoYVerdura = new GrupoDeUsuario("Los del club", integrantesGordoYDiabetico,
			unasPreferenciasConCarneQuesoYVerdura)

		filtroPorGusto.add(new FiltroPorGusto)

		filtroDeCalorias.add(new FiltroDeCalorias)

		filtroDeCaloriasYGusto.add(new FiltroPorGusto)

		filtroDeCaloriasYGusto.add(new FiltroDeCalorias)

		filtroDeIngredientesCaros.add(new FiltroDeIngredientesCaros)

		filtroDeIngredientesCarosYCalorias.add(new FiltroDeIngredientesCaros)

		filtroDeIngredientesCarosYCalorias.add(new FiltroDeCalorias)

		filtroCondicionesPreexistentes.add(new FiltroCondicionesPreexistentes)

		mostrarLosPrimerosDiez = new MostrarLosPrimerosDiez
		mostrarResultadosPares = new MostrarResultadosPares
		compararPorCalorias = new CompararPorCalorias
		compararPorNombre = new CompararPorNombre


		observerConsultaVegano = ObserverConsultaVegano.getInstance()
		observerDeHora = ObserverDeHora.getInstance()
		observerMasConsultadaPorSexo = ObserverMasConsultadaPorSexo.getInstance()
		observerDeLasMasConsultadas = ObserverDeLasMasConsultadas.getInstance()

	}

	//Punto 1: Repositorio De Usuarios-------------------------------	
	//Hago el limpiartodo() al principio de cada test porque no arranca de cero en cada uno, si en el test 1 agregue un usuario al repo, en el test 2 ya aparece como agregado
	@Test
	def void agregoYQuitoUsuariosDelRepositorio() {
		stubRepositorioDeUsuarios.limpiarTodo()
		stubRepositorioDeUsuarios.limpiarPendientes()

		Assert.assertEquals(0, stubRepositorioDeUsuarios.todosLosUsuarios.size)
		stubRepositorioDeUsuarios.agregar(usuarioSinCondiciones)
		stubRepositorioDeUsuarios.agregar(usuarioVegano)
		Assert.assertEquals(2, stubRepositorioDeUsuarios.todosLosUsuarios.size)
		stubRepositorioDeUsuarios.quitar(usuarioSinCondiciones)
		Assert.assertEquals(1, stubRepositorioDeUsuarios.todosLosUsuarios.size)
	}

	@Test
	def void actualizoUnUsuario() {
		stubRepositorioDeUsuarios.limpiarTodo()
		stubRepositorioDeUsuarios.limpiarPendientes()

		stubRepositorioDeUsuarios.agregar(usuarioSinCondiciones)
		Assert.assertEquals(1, stubRepositorioDeUsuarios.todosLosUsuarios.size)

		//Creo un usuario que se llame igual y le cambio el peso
		val Usuario nuevoUsuario = new Usuario(40, 1.64, Femenino, "Esteban", fechaValida, new Rutina(61, true),
			unasCondicionesVacias, unasPreferenciasVacias, unasPreferenciasVacias)

		stubRepositorioDeUsuarios.update(nuevoUsuario)
		Assert.assertTrue(stubRepositorioDeUsuarios.get("Esteban").equals(usuarioSinCondiciones))
		Assert.assertTrue(stubRepositorioDeUsuarios.get("Esteban").peso.equals(40))

	}

	@Test
	def void todosLosUsuariosEnListaPendienteAceptoUnoYDisminuye() {
		stubRepositorioDeUsuarios.limpiarTodo()

		//Hay 6 usuarios creados en el @Before pendientes de aceptar solicitud
		Assert.assertEquals(6, stubRepositorioDeUsuarios.usuariosPendientes.size)
		stubRepositorioDeUsuarios.aceptarIncorporacion(usuarioVegano)
		Assert.assertEquals(5, stubRepositorioDeUsuarios.usuariosPendientes.size)
	}

	@Test(expected=typeof(Exception))
	def void noAceptoIncorporacionDeUsuarioMuestraMotivoDeRechazo() {
		stubRepositorioDeUsuarios.limpiarTodo()

		stubRepositorioDeUsuarios.rechazarIncorporacion(usuarioVegano)

	}

	@Test
	def void buscoUsuarioPorNombre() {
		stubRepositorioDeUsuarios.limpiarTodo()

		stubRepositorioDeUsuarios.agregar(usuarioSinCondiciones)
		stubRepositorioDeUsuarios.agregar(usuarioVegano)

		//El Usuario vegano se llama 'Marina'
		Assert.assertTrue(stubRepositorioDeUsuarios.get("Marina").equals(usuarioVegano))
	}

	@Test
	def void buscoVariosUsuariosPorElMismoNombre() {
		stubRepositorioDeUsuarios.limpiarTodo()

		stubRepositorioDeUsuarios.agregar(usuarioSinCondiciones)
		stubRepositorioDeUsuarios.agregar(usuarioConSobrePesoYDiabetesQueLeGustaLaCarne)

		//Los dos usuarios se llaman 'Esteban'
		Assert.assertTrue(stubRepositorioDeUsuarios.listar(usuarioSinCondiciones).contains(usuarioSinCondiciones))
		Assert.assertTrue(
			stubRepositorioDeUsuarios.listar(usuarioSinCondiciones).contains(
				usuarioConSobrePesoYDiabetesQueLeGustaLaCarne))
	}

	@Test
	def void buscoVariosUsuariosPorCondicionPreexistente() {
		stubRepositorioDeUsuarios.limpiarTodo()

		stubRepositorioDeUsuarios.agregar(usuarioVegano)
		stubRepositorioDeUsuarios.agregar(usuarioConSobrePesoYDiabetesQueLeGustaLaCarne)

		Assert.assertTrue(stubRepositorioDeUsuarios.listar(new Vegano).contains(usuarioVegano))
		Assert.assertTrue(
			stubRepositorioDeUsuarios.listar(new Diabetico).contains(usuarioConSobrePesoYDiabetesQueLeGustaLaCarne))
	}

	//Punto 2:json parser y repo externo ------------------------------------------------
	@Test
	def void testRepoExternoRecetas() {
		val Repositorio repoExterno = new RepositorioExterno("ensalada caesar", Dificultad.FACIL, new ArrayList<String>)
		val Busqueda busqueda = new Busqueda(filtroCondicionesPreexistentes, usuarioSinCondiciones, new Ordenamiento,
			repoExterno)
		Assert.assertTrue(busqueda.filtrar().exists[receta|receta.nombreDelPlato.matches("ensalada caesar")])
	}

	//Punto 3: Observers---------------------------------------------
	@Test
	def void observerRecetasMasConsultadas() {
		busquedaVegana = new Busqueda(usuarioVegano)
		busquedaVegana.filtrar()

		busquedaVeganaSegunda = new Busqueda(filtroDeCalorias, usuarioVeganoSegundo)
		busquedaVeganaSegunda.filtrar()

	}

	@Test
	def void observerVeganosConsultanRecetasDificiles() {

		busquedaVegana = new Busqueda(usuarioVegano)
		busquedaVegana.filtrar()

		busquedaVeganaSegunda = new Busqueda(filtroPorGusto, usuarioVeganoSegundo)
		busquedaVeganaSegunda.filtrar()

		busquedaNoVegana = new Busqueda(usuarioDiabeticoQueNoLeGustaLaCarne)
		busquedaNoVegana.filtrar()

		Assert.assertEquals(4, observerConsultaVegano.cantidadDeVeganosQueConsultaronRecetasDificiles())
	}

	@Test
	def void observerRecetasMasConsultadasEnBaseAlSexo() {

		//Masculinos
		busquedaMasculina = new Busqueda(filtroCondicionesPreexistentes, usuarioVeganoSegundo)

		busquedaMasculina.filtrar()

		busquedaMasculinaSegunda = new Busqueda(filtroDeCalorias, usuarioDiabeticoQueNoLeGustaLaCarne)

		busquedaMasculinaSegunda.filtrar()

		//Femeninos
		busquedaFemenina = new Busqueda(filtroPorGusto, usuarioConSobrePesoYDiabetesQueLeGustaLaCarne)

		busquedaFemenina.filtrar()

		busquedaFemeninaSegunda = new Busqueda(filtroDeCalorias, usuarioSinCondiciones)

		busquedaFemeninaSegunda.filtrar()

	
	}

	@Test
	def void observerDeLaHora() {
	}

}*/
