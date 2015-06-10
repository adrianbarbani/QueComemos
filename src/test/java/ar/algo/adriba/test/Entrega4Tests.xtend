package ar.algo.adriba.test

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
import ar.algo.adriba.tp1.UsuarioBuilder
import ar.algo.adriba.tp1.RecetaBuilder

class Entrega4Tests {
	
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
		
		
		
		//------------------Builders de usuarios---------------
		
		
		usuarioSinCondiciones = new UsuarioBuilder()
			.agregarPeso(52)
			.agregarAltura(1.64)
			.agregarSexo(Femenino)
			.agregarNombre("Esteban")
			.agregarFechaNacimiento(fechaValida)
			.agregarRutina(new Rutina(61, true))
			.agregarCondicionesPreexistentes(unasCondicionesVacias)
			.agregarPreferenciasAlimentarias(unasPreferenciasVacias)
			.agregarComidaQueLeDisgusta(unasPreferenciasVacias)
			.build()
		
		usuarioVegano = new UsuarioBuilder()
			.agregarPeso(52)
			.agregarAltura(1.64)
			.agregarSexo(Femenino)
			.agregarNombre("Marina")
			.agregarFechaNacimiento(fechaValida)
			.agregarRutina(new Rutina(61, true))
			.agregarCondicionesPreexistentes(unasCondicionesConVeganismo)
			.agregarPreferenciasAlimentarias(unasPreferenciasConFrutayVerdura)
			.agregarComidaQueLeDisgusta(comidasQueDisgustanConCarne)
			.build()
		
		usuarioVeganoSegundo = new UsuarioBuilder()
			.agregarPeso(52)
			.agregarAltura(1.64)
			.agregarSexo(Masculino)
			.agregarNombre("Carlos")
			.agregarFechaNacimiento(fechaValida)
			.agregarRutina(new Rutina(61, true))
			.agregarCondicionesPreexistentes(unasCondicionesConVeganismo)
			.agregarPreferenciasAlimentarias(unasPreferenciasConFrutayVerdura)
			.agregarComidaQueLeDisgusta(comidasQueDisgustanConCarne)
			.build()
		

		usuarioHipertensoQueNoLeGustaElQueso = new UsuarioBuilder()
			.agregarPeso(67)
			.agregarAltura(1.91)
			.agregarSexo(Masculino)
			.agregarNombre("Adrian")
			.agregarFechaNacimiento(fechaValida)
			.agregarRutina(new Rutina(74, true))
			.agregarCondicionesPreexistentes(unasCondicionesConHipertension)
			.agregarPreferenciasAlimentarias(unasPreferenciasConCarneYQueso)
			.agregarComidaQueLeDisgusta(comidasQueDisgustanConQueso)
			.build()
		
		usuarioDiabeticoQueNoLeGustaLaCarne = new UsuarioBuilder()
			.agregarPeso(80)
			.agregarAltura(1.74)
			.agregarSexo(Masculino)
			.agregarNombre("Federico")
			.agregarFechaNacimiento(fechaValida)
			.agregarRutina(new Rutina(82, true))
			.agregarCondicionesPreexistentes(unasCondicionesConDiabetes)
			.agregarPreferenciasAlimentarias(unasPreferenciasConQuesoYVerdura)
			.agregarComidaQueLeDisgusta(comidasQueDisgustanConCarne)
			.build()
		

		usuarioConSobrePesoYDiabetesQueLeGustaLaCarne = new UsuarioBuilder()
			.agregarPeso(1500)
			.agregarAltura(1.44)
			.agregarSexo(Femenino)
			.agregarNombre("Esteban")
			.agregarFechaNacimiento(fechaValida)
			.agregarRutina(new Rutina(10, true))
			.agregarCondicionesPreexistentes(unasCondicionesConDiabetes)
			.agregarPreferenciasAlimentarias(unasPreferenciasConCarne)
			.agregarComidaQueLeDisgusta(comidasQueDisgustanConQueso)
			.build()

		
		//----------------Builder de recetas----------------
		
		milanesa = new RecetaBuilder()
			.tipoDeReceta(new Publica)
			.nombreDelPlato("Milanesas")
			.agregarIngrediente(harina)
			.agregarIngrediente(huevo)
			.agregarIngrediente(panRallado)
			.agregarIngrediente(carne)
			.setearCalorias(150)
			.setearDificultad("Dificil")
			.build
		
		milanesaNapolitana = new RecetaBuilder()
			.tipoDeReceta(new Publica)
			.nombreDelPlato("Milanesa napolitana")
			.agregarIngrediente(harina)
			.agregarIngrediente(huevo)
			.agregarIngrediente(panRallado)
			.agregarIngrediente(carne)
			.agregarIngrediente(queso)
			.agregarIngrediente(salsaDeTomate)
			.setearCalorias(8000)
			.build

	
		sopaDeVerdura = new RecetaBuilder()
			.tipoDeReceta(new Publica)
			.nombreDelPlato("Sopa de Verdura")
			.agregarIngrediente(verdura)
			.agregarIngrediente(sal)
			.setearCalorias(200)
			.setearDificultad("Dificil")
			.build
		

		pizza = new RecetaBuilder()
			.tipoDeReceta(new Publica)
			.nombreDelPlato("Pizza de muzzarella")
			.agregarIngrediente(prepizza)
			.agregarIngrediente(salsaDeTomate)
			.agregarIngrediente(queso)
			.setearCalorias(500)
			.build
		
		pizzaDeVerdura = new RecetaBuilder()
			.tipoDeReceta(new Publica)
			.nombreDelPlato("Pizza de verdura y salsa blanca")
			.agregarIngrediente(prepizza)
			.agregarIngrediente(salsaDeTomate)
			.agregarIngrediente(queso)
			.agregarIngrediente(salsaBlanca)
			.agregarIngrediente(verdura)
			.setearCalorias(560)
			.build
		
		lomoALaPlancha = new RecetaBuilder()
			.tipoDeReceta(new Publica)
			.nombreDelPlato("Lomo a la Plancha")
			.agregarIngrediente(lomo)
			.setearCalorias(300)
			.build
		

		hummus = new RecetaBuilder()
			.tipoDeReceta(new Privada(usuarioVegano, hummus))
			.nombreDelPlato("Hummus de garbanzo")
			.agregarIngrediente(garbanzos)
			.agregarIngrediente(limon)
			.agregarIngrediente(ajo)
			.setearCalorias(600)
			.build
		

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

	//observers.add(observerConsultaVegano)
	//observers.add(observerDeHora)
	//observers.add(observerMasConsultadaPorSexo)
	//observers.add(observerDeLasMasConsultadas)
	}

}