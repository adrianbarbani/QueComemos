package ar.algo.adriba.test

import ar.algo.adriba.tp1.Busqueda
import ar.algo.adriba.tp1.Celiaco
import ar.algo.adriba.tp1.Comida
import ar.algo.adriba.tp1.CondicionPreexistente
import ar.algo.adriba.tp1.Diabetico
import ar.algo.adriba.tp1.Fecha
import ar.algo.adriba.tp1.Filtro
import ar.algo.adriba.tp1.FiltroDeCalorias
import ar.algo.adriba.tp1.GrupoDeUsuario
import ar.algo.adriba.tp1.Hipertenso
import ar.algo.adriba.tp1.MostrarLosPrimerosDiez
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
class Entrega2Tests {

	Fecha fechaValida
	Fecha fechaInvalida
	List<String> unasPreferenciasAlimentarias = new ArrayList<String>
	List<CondicionPreexistente> condicionesPreexistentes = new ArrayList<CondicionPreexistente>
	List<CondicionPreexistente> unasCondicionesPreexistentesCompletas = new ArrayList<CondicionPreexistente>
	List<String> preferenciasAlimenticiasGrupal1 = new ArrayList<String>
	List<String> preferenciasAlimenticiasGrupal2 = new ArrayList<String>
	List<String> comidasQueDisgustan1 = new ArrayList<String>
	List<String> comidasQueDisgustan2 = new ArrayList<String>
	List<Usuario> integrantes1 = new ArrayList<Usuario>
	List<Usuario> integrantes2 = new ArrayList<Usuario>

	Usuario Usuario
	Usuario Usuario2
	Usuario Usuario3
	Usuario Usuario4
	Usuario Usuario5
	Usuario Usuario6

	GrupoDeUsuario Grupo1
	GrupoDeUsuario Grupo2

	Sexo Femenino
	Sexo Masculino

	Receta RecetaValida

	Comida carne
	Comida harina
	Comida huevo
	Comida panRallado

	List<Filtro> filtroVacio = new ArrayList<Filtro>
	MostrarLosPrimerosDiez ordenamientoVacio

	Busqueda busqueda1

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

		carne = new Comida(99, "carne", 1)
		harina = new Comida(25, "harina", 20)
		huevo = new Comida(10, "huevo", 3)
		panRallado = new Comida(12, "pan rallado", 50)

		condicionesPreexistentes.add(new Diabetico)
		unasPreferenciasAlimentarias.add("huevo")
		comidasQueDisgustan1.add("verdura")
		comidasQueDisgustan2.add("carne")

		Usuario = new Usuario(52, 1.64, Femenino, "Marina", fechaValida, new Rutina(61, true),
			condicionesPreexistentes, unasPreferenciasAlimentarias, comidasQueDisgustan1)

		Usuario2 = new Usuario(67, 1.91, Masculino, "Adrian", fechaValida, new Rutina(74, true),
			condicionesPreexistentes, unasPreferenciasAlimentarias, comidasQueDisgustan1)

		Usuario3 = new Usuario(80, 1.74, Masculino, "Federico", fechaValida, new Rutina(82, true),
			condicionesPreexistentes, unasPreferenciasAlimentarias, comidasQueDisgustan1)

		Usuario4 = new Usuario(60, 1.77, Femenino, "Daiana", fechaValida, new Rutina(61, false),
			unasCondicionesPreexistentesCompletas, unasPreferenciasAlimentarias, comidasQueDisgustan2)

		Usuario5 = new Usuario(65, 1.64, Masculino, "Lionel", fechaValida, new Rutina(40, true),
			unasCondicionesPreexistentesCompletas, unasPreferenciasAlimentarias, comidasQueDisgustan2)

		Usuario6 = new Usuario(80, 1.77, Masculino, "Ezequiel", fechaValida, new Rutina(80, true),
			unasCondicionesPreexistentesCompletas, unasPreferenciasAlimentarias, comidasQueDisgustan2)

		preferenciasAlimenticiasGrupal1.add("carne")
		preferenciasAlimenticiasGrupal2.add("carne")

		integrantes1.add(Usuario)
		integrantes1.add(Usuario2)
		integrantes1.add(Usuario3)

		integrantes2.add(Usuario4)
		integrantes2.add(Usuario5)
		integrantes2.add(Usuario6)

		Grupo1 = new GrupoDeUsuario("Los de algo 2", integrantes1, preferenciasAlimenticiasGrupal1)
		Grupo2 = new GrupoDeUsuario("Los Borbotones", integrantes2, preferenciasAlimenticiasGrupal2)

		RecetaValida = new Receta => [
			tipo = new Publica
			setNombreDelPlato("Milanesas")
			subRecetaseIngredientes.add(harina)
			subRecetaseIngredientes.add(huevo)
			subRecetaseIngredientes.add(panRallado)
			subRecetaseIngredientes.add(carne)
		]

		ordenamientoVacio = new MostrarLosPrimerosDiez
		filtroVacio.add(new FiltroDeCalorias)

	}

	//Punto 1: Averiguar si una receta se puede sugerir a un usuario
	@Test
	def void test1() {
		Assert.assertTrue(RecetaValida.sePuedeSugerirA(Usuario))

	}

	@Test (expected=typeof(Exception))
	def void test2() {
		RecetaValida.sePuedeSugerirA(Usuario4)

	}

	//Punto 1: Averiguar si una receta se puede sugerir a un grupo
	@Test
	def void test3() {
		Assert.assertTrue(RecetaValida.sePuedeSugerirA(Grupo1))
	}

	
	@Test (expected=typeof(Exception))
	def void test4() {
		RecetaValida.sePuedeSugerirA(Grupo2)
	}

	//Punto 2: Conocer todas las recetas a las que un usuario tiene acceso
	@Test
	def void test5() {
		busqueda1 = new Busqueda(filtroVacio, Usuario, ordenamientoVacio)
		Assert.assertEquals(1, busqueda1.recetasQuePuedeVer(Usuario).size)
	}

	//Punto 3:	Agregar receta a favoritos
	@Test
	def void test6() {
		Assert.assertEquals(0, Usuario.recetasFavoritas.size)
		Usuario.marcarComoFavorita(RecetaValida)
		Assert.assertEquals(1, Usuario.recetasFavoritas.size)
	}
} */
