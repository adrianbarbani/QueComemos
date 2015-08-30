package ar.algo.adriba.tp1

import java.util.ArrayList
import java.util.List
import org.uqbar.commons.utils.Observable

@Observable
public class RepositorioRecetas implements Repositorio {

	public List<Receta> listarTodas = new ArrayList<Receta>

	static RepositorioRecetas repositorio = null
	/*Comida carne = new Comida(0, "Carne", 1)
	Comida harina = new Comida(0, "Harina", 20)
	Comida huevo = new Comida(0, "Huevo", 3)
	Comida panRallado = new Comida(0, "Pan Rallado", 50)
	Comida verdura = new Comida(0, "Verdura", 12)
	Comida queso = new Comida(0, "Muzzarella", 200)
	Comida prepizza = new Comida(0, "Prepizza", 1)
	Comida salsaDeTomate = new Comida(0, "Salsa de tomate", 200)
	Comida sal = new Comida(18, "Sal", 0)
	Comida salsaBlanca = new Comida(0, "Salsa Blanca", 400)
	Comida lomo = new Comida(0, "Lomo", 200)
	Comida garbanzos = new Comida(0, "Garbanzos", 500)
	Comida limon = new Comida(10, "Limon", 0)
	Comida ajo = new Comida(5, "Ajo", 0)

	Comida jamon = new Comida(0, "Jamon", 100)
	Comida oregano = new Comida(100, "Oregano", 0)
	Comida azucar = new Comida(0, "azucar", 200)

	Receta milanesa = new RecetaBuilder().tipoDeReceta(new Publica).nombreDelPlato("Milanesas").
		agregarIngrediente(harina).agregarIngrediente(huevo).setearTemporadas("Todo el año").
		agregarIngrediente(panRallado).agregarIngrediente(carne).setearCalorias(150).setearDificultad("Dificil").build

	Receta milanesaNapolitana = new RecetaBuilder().tipoDeReceta(new Publica).nombreDelPlato("Milanesa napolitana").
		agregarIngrediente(harina).agregarIngrediente(huevo).agregarIngrediente(panRallado).agregarIngrediente(carne).
		agregarIngrediente(queso).agregarIngrediente(salsaDeTomate).setearCalorias(8000).setearTemporadas("Todo el año").
		setearDificultad("Dificil").build

	Receta sopaDeVerdura = new RecetaBuilder().tipoDeReceta(new Publica).nombreDelPlato("Sopa de Verdura").
		agregarIngrediente(verdura).agregarIngrediente(sal).setearCalorias(200).setearTemporadas("Invierno").
		setearDificultad("Dificil").build

	Receta pizza = new RecetaBuilder().tipoDeReceta(new Publica).nombreDelPlato("Pizza de muzzarella").
		agregarIngrediente(prepizza).agregarIngrediente(salsaDeTomate).agregarIngrediente(oregano).
		agregarIngrediente(queso).setearTemporadas("Todo el año").setearDificultad("Facil").setearCalorias(500).build

	Receta pizzaDeVerdura = new RecetaBuilder().tipoDeReceta(new Publica).nombreDelPlato(
		"Pizza de verdura y salsa blanca").agregarIngrediente(prepizza).agregarIngrediente(salsaDeTomate).
		agregarIngrediente(queso).agregarIngrediente(salsaBlanca).agregarIngrediente(verdura).
		setearTemporadas("Todo el año").setearCalorias(560).setearDificultad("Dificil").build

	Receta lomoALaPlancha = new RecetaBuilder().tipoDeReceta(new Publica).nombreDelPlato("Lomo a la Plancha").
		agregarIngrediente(lomo).setearCalorias(300).setearTemporadas("Otoño").setearDificultad("Media").build*/

	private new() {
	}

	static public def RepositorioRecetas getInstance() {
		if (repositorio == null) {
			repositorio = new RepositorioRecetas()
		}
      repositorio;
	}

	def void agregar(Receta unaReceta) {
		listarTodas.add(unaReceta)
	}

	def void quitar(Receta unaReceta) {
		listarTodas.remove(unaReceta)
	}

	override List<Receta> todasLasRecetas() {
		listarTodas.toList
	}

	def void limpiar() {
		listarTodas.clear
	}

}
