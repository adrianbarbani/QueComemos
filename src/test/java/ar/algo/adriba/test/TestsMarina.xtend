package ar.algo.adriba.test

/* 
import ar.algo.adriba.tp1.Busqueda
import ar.algo.adriba.tp1.Celiaco
import ar.algo.adriba.tp1.Comida
import ar.algo.adriba.tp1.CompararPorCalorias
import ar.algo.adriba.tp1.CompararPorNombre
import ar.algo.adriba.tp1.CondicionPreexistente
import ar.algo.adriba.tp1.Diabetico
import ar.algo.adriba.tp1.Fecha
import ar.algo.adriba.tp1.Filtro
import ar.algo.adriba.tp1.FiltroDeCalorias
import ar.algo.adriba.tp1.FiltroDeIngredientesCaros
import ar.algo.adriba.tp1.FiltroPorGusto
import ar.algo.adriba.tp1.GrupoDeUsuario
import ar.algo.adriba.tp1.Hipertenso
import ar.algo.adriba.tp1.MostrarLosPrimerosDiez
import ar.algo.adriba.tp1.MostrarResultadosPares
import ar.algo.adriba.tp1.Ordenamiento
import ar.algo.adriba.tp1.Publica
import ar.algo.adriba.tp1.Receta
import ar.algo.adriba.tp1.RepositorioRecetas
import ar.algo.adriba.tp1.Rutina
import ar.algo.adriba.tp1.Sexo
import ar.algo.adriba.tp1.Usuario
import ar.algo.adriba.tp1.Vegano
import java.util.ArrayList
import java.util.List
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import ar.algo.adriba.tp1.Privada
import ar.algo.adriba.tp1.FiltroCondicionesPreexistentes

class TestsMarina {

	Fecha fechaValida
	Fecha fechaInvalida

	List<CondicionPreexistente> unasCondicionesPreexistentesCompletas = new ArrayList<CondicionPreexistente>

	List<Usuario> integrantesVeganoEHipertenso = new ArrayList<Usuario>
	List<Usuario> integrantesDiabeticoEHipertenso = new ArrayList<Usuario>
	List<Usuario> integrantesGordoYDiabetico = new ArrayList<Usuario>

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
	Usuario usuarioConSobrePesoYDiabetesQueLeGustaLaCarne
	Usuario usuarioHipertensoQueNoLeGustaElQueso
	Usuario usuarioDiabeticoQueNoLeGustaLaCarne

	GrupoDeUsuario grupoQueLeGustaQuesoYVerdura
	GrupoDeUsuario grupoQueLeGustaFrutaYVerdura
	GrupoDeUsuario grupoQueLeGustaCarneYQueso
	GrupoDeUsuario grupoQueLeGustaCarneQuesoYVerdura

	RepositorioRecetas stubRepositorioDeRecetas = RepositorioRecetas.getInstance()

	List<Filtro> filtroPorGusto = new ArrayList<Filtro>
	List<Filtro> filtroDeCalorias = new ArrayList<Filtro>
	List<Filtro> filtroDeCaloriasYGusto = new ArrayList<Filtro>
	List<Filtro> filtroDeIngredientesCaros = new ArrayList<Filtro>
	List<Filtro> filtroDeIngredientesCarosYCalorias = new ArrayList<Filtro>
	List<Filtro> filtroCondicionesPreexistentes = new ArrayList<Filtro>

	Ordenamiento mostrarLosPrimerosDiez
	Ordenamiento mostrarResultadosPares
	Ordenamiento compararPorCalorias
	Ordenamiento compararPorNombre

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

		usuarioHipertensoQueNoLeGustaElQueso = new Usuario(67, 1.91, Masculino, "Adrian", fechaValida,
			new Rutina(74, true), unasCondicionesConHipertension, unasPreferenciasConCarneYQueso,
			comidasQueDisgustanConQueso)

		usuarioDiabeticoQueNoLeGustaLaCarne = new Usuario(80, 1.74, Masculino, "Federico", fechaValida,
			new Rutina(82, true), unasCondicionesConDiabetes, unasPreferenciasConQuesoYVerdura,
			comidasQueDisgustanConCarne)

		usuarioConSobrePesoYDiabetesQueLeGustaLaCarne = new Usuario(1500, 1.44, Masculino, "Juan Pedro", fechaValida,
			new Rutina(10, true), unasCondicionesConDiabetes, unasPreferenciasConCarne, comidasQueDisgustanConQueso)

			milanesa = new Receta => [
			tipo = new Publica
			setNombreDelPlato("Milanesas")
			subRecetaseIngredientes.add(harina)
			subRecetaseIngredientes.add(huevo)
			subRecetaseIngredientes.add(panRallado)
			subRecetaseIngredientes.add(carne)
			caloriasReceta = 5000
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
			caloriasReceta = 400
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
			caloriasReceta = 450
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

	}

	//Punto 1: Averiguar si una receta se puede sugerir a un usuario
	@Test
	def void milanesaNoSePuedeSugerirAlVeganoPorquetieneCarne() {
		Assert.assertFalse(milanesa.sePuedeSugerirA(usuarioVegano))

	}

	@Test
	def void sopaDeVerduraSiSePuedeSugerirAlVegano() {
		Assert.assertTrue(sopaDeVerdura.sePuedeSugerirA(usuarioVegano))

	}

	@Test
	def void sopaDeVerduraNoSePuedeSugerirAlHipertensoPorqueTieneSal() {
		Assert.assertFalse(sopaDeVerdura.sePuedeSugerirA(usuarioHipertensoQueNoLeGustaElQueso))

	}

	@Test
	def void piizaNoSePuedeSugerirAlusuarioHipertensoQueNoLeGustaElQuesoPorqueTieneQueso() {
		Assert.assertFalse(pizza.sePuedeSugerirA(usuarioHipertensoQueNoLeGustaElQueso))

	}

	//Punto 1: Averiguar si una receta se puede sugerir a un grupo
	@Test
	def void pizzaSePuedeSugerirAgrupoQueLeGustaQuesoYVerduraPorqueTieneQueso() {
		Assert.assertTrue(pizza.sePuedeSugerirA(grupoQueLeGustaQuesoYVerdura))
	}

	def void milanesaNoSePuedeSugerirAGrupoQueLeGustaQuesoYVerduraPorqueNoTieneNadaQueLesGuste() {
		Assert.assertFalse(milanesa.sePuedeSugerirA(grupoQueLeGustaQuesoYVerdura))
	}

	def void sopaDeVerduraNoSePuedeSugerirAGrupoQueLeGustaFrutaYVerduraPorqueTienenUnHipertenso() {
		Assert.assertFalse(sopaDeVerdura.sePuedeSugerirA(grupoQueLeGustaFrutaYVerdura))
	}

	def void milanesaNapolitanaSePuedeSugerirAgrupoQueLeGustaCarneYQuesoPorqueLesGustaEso() {
		Assert.assertTrue(milanesaNapolitana.sePuedeSugerirA(grupoQueLeGustaCarneYQueso))
	}

	//Punto 2: Conocer todas las recetas a las que un usuario tiene acceso, acá se me rompe todo con la receta privada de "hummus"
	
	@Test
	def void usuarioVeganoPuedeVerRecetasPublicasYSuRecetaPrivada() {
		usuarioVegano.agregar(hummus)
		Assert.assertTrue(new Busqueda(usuarioVegano).filtrar().contains(milanesa))
		Assert.assertTrue(new Busqueda(usuarioVegano).filtrar().contains(milanesaNapolitana))
		Assert.assertTrue(new Busqueda(usuarioVegano).filtrar().contains(sopaDeVerdura))
		Assert.assertTrue(new Busqueda(usuarioVegano).filtrar().contains(pizza))
		Assert.assertTrue(new Busqueda(usuarioVegano).filtrar().contains(pizzaDeVerdura))
		Assert.assertTrue(new Busqueda(usuarioVegano).filtrar().contains(lomoALaPlancha))
		Assert.assertTrue(new Busqueda(usuarioVegano).filtrar().contains(hummus))
	}
	
	@Test
	def void otroUsuarioPuedeVerSoloLasPublicasPorqueNoTienePrivadas() {
	Assert.assertTrue(new Busqueda(usuarioHipertensoQueNoLeGustaElQueso).filtrar().contains(milanesa))
	Assert.assertTrue(new Busqueda(usuarioHipertensoQueNoLeGustaElQueso).filtrar().contains(milanesaNapolitana))
	Assert.assertTrue(new Busqueda(usuarioHipertensoQueNoLeGustaElQueso).filtrar().contains(sopaDeVerdura))
	Assert.assertTrue(new Busqueda(usuarioHipertensoQueNoLeGustaElQueso).filtrar().contains(pizza))
	Assert.assertTrue(new Busqueda(usuarioHipertensoQueNoLeGustaElQueso).filtrar().contains(lomoALaPlancha))
	Assert.assertFalse(new Busqueda(usuarioHipertensoQueNoLeGustaElQueso).filtrar().contains(hummus))
	} 
	
	//Punto 3:	Agregar receta a favoritos
	@Test
	def void unVeganoMarcaLaSopaComoFavorita() {
		usuarioVegano.marcarComoFavorita(sopaDeVerdura)
		Assert.assertTrue(usuarioVegano.recetasFavoritas.contains(sopaDeVerdura))
	}

	//Punto 4: Resolver los filtros y el manejo de resultados mediante Strategies
	@Test
	def void busquedaPorGustoParaElVegano() {
		Assert.assertTrue(new Busqueda(filtroPorGusto, usuarioVegano).filtrar().contains(sopaDeVerdura))
		Assert.assertFalse(new Busqueda(filtroPorGusto, usuarioVegano).filtrar().contains(milanesa))
	}

	@Test
	def void busquedaConFiltroDeCaloriasYUnUsuarioConSobrePesoDejaAfueraLaMilaNapolitana() {
		Assert.assertFalse(new Busqueda(filtroDeCalorias, usuarioConSobrePesoYDiabetesQueLeGustaLaCarne).filtrar().contains(milanesaNapolitana))
	}

	@Test
	def void busquedaConFiltroDeCaloriasYGustoParaUnUsuarioConSobrePesoDejaAfueraLaMilaNapolitanaYLaPizzaDeVerdura() {
		Assert.assertFalse(new Busqueda(filtroDeCaloriasYGusto, usuarioConSobrePesoYDiabetesQueLeGustaLaCarne).filtrar().contains(milanesaNapolitana))
		Assert.assertFalse(new Busqueda(filtroDeCaloriasYGusto, usuarioConSobrePesoYDiabetesQueLeGustaLaCarne).filtrar().contains(pizzaDeVerdura))
	}

	@Test
	def void busquedaConFiltroDeCondicionesPreexistentesParaUnUsuarioSinCondicionesYOrdenamosRecetasPorNombre(){
		Assert.assertTrue(new Busqueda(filtroCondicionesPreexistentes, usuarioSinCondiciones, compararPorNombre).filtrar().size == 6)	
		Assert.assertTrue(new Busqueda(filtroCondicionesPreexistentes, usuarioSinCondiciones, compararPorNombre).filtrar().get(0).equals(lomoALaPlancha))	
		Assert.assertTrue(new Busqueda(filtroCondicionesPreexistentes, usuarioSinCondiciones, compararPorNombre).filtrar().get(5).equals(sopaDeVerdura))		
	}

	@Test
	def void busquedaConFiltroDeCondicionesPreexistentesParaUnUsuarioSinCondicionesYOrdenamosRecetasPorCalorias(){
		Assert.assertTrue(new Busqueda(filtroCondicionesPreexistentes, usuarioSinCondiciones, compararPorCalorias).filtrar().get(0).equals(sopaDeVerdura))	
		Assert.assertTrue(new Busqueda(filtroCondicionesPreexistentes, usuarioSinCondiciones, compararPorCalorias).filtrar().get(5).equals(milanesaNapolitana))		
	}
	
	@Test
	def void busquedaConFiltroDeCondicionesPreexistentesParaUnUsuarioSinCondicionesYMostramosResultadosPares(){
		Assert.assertTrue(new Busqueda(filtroCondicionesPreexistentes, usuarioSinCondiciones, mostrarResultadosPares).filtrar().size == 3)		
	}
	
	@Test
	def void busquedaConFiltroDeCondicionesPreexistentesParaUnUsuarioSinCondicionesYMostramosLosPrimerosDiezResultados(){
		Assert.assertTrue(new Busqueda(filtroCondicionesPreexistentes, usuarioSinCondiciones, mostrarLosPrimerosDiez).filtrar().size <= 10)		
	}
	
	@Test
	def void busquedaConfiltroDeIngredientesCarosYCaloriasParaUnGrupoConSobrePeso() {
		Assert.assertFalse(
			new Busqueda(filtroDeIngredientesCarosYCalorias, grupoQueLeGustaCarneQuesoYVerdura).filtrar().contains(milanesaNapolitana))
		Assert.assertFalse(
			new Busqueda(filtroDeIngredientesCarosYCalorias, grupoQueLeGustaCarneQuesoYVerdura).filtrar().contains(lomoALaPlancha))
		Assert.assertTrue(
			new Busqueda(filtroDeIngredientesCarosYCalorias, grupoQueLeGustaCarneQuesoYVerdura).filtrar().contains(sopaDeVerdura))
	}

 
}*/
