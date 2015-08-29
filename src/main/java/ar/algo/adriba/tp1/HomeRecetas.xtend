package ar.algo.adriba.tp1

import org.apache.commons.collections15.Predicate
import org.uqbar.commons.model.CollectionBasedHome
import org.uqbar.commons.utils.Observable

@Observable
class HomeRecetas extends CollectionBasedHome<Receta> {

		
	Comida prepizza = new Comida(0, "Prepizza", 1)
	Comida queso = new Comida(0, "Muzzarella", 200)
	Comida salsaDeTomate = new Comida(0, "Salsa de tomate", 200)
	Comida jamon = new Comida(0, "Jamon", 100)
	Comida oregano = new Comida(100, "Oregano", 0)
	Comida azucar = new Comida(0, "azucar", 200)

	new() {
		this.init
	}

	def void init() {
		new RecetaBuilder().tipoDeReceta(new Publica).nombreDelPlato("Pizza de Jamon y Morrones").
			agregarIngrediente(prepizza).agregarIngrediente(azucar).agregarIngrediente(jamon).agregarIngrediente(queso).
			agregarIngrediente(salsaDeTomate).agregarIngrediente(oregano).setearCalorias(500).setearDificultad("Facil").
			setearTemporadas("Todo el año").setearPreparacion(
				"En la prepizza volcar la salsa de tomate y cocinar por 15 minutos, luego sumar el queso y volver a cocinar. Agregar el jamon y el morron; oregano a gusto.").
			build
			
		new RecetaBuilder().tipoDeReceta(new Publica).nombreDelPlato("Pizza de Jamon y Morrones").
			agregarIngrediente(prepizza).agregarIngrediente(azucar).agregarIngrediente(jamon).agregarIngrediente(queso).
			agregarIngrediente(salsaDeTomate).agregarIngrediente(oregano).setearCalorias(500).setearDificultad("Facil").
			setearTemporadas("Todo el año").setearPreparacion(
				"En la prepizza volcar la salsa de tomate y cocinar por 15 minutos, luego sumar el queso y volver a cocinar. Agregar el jamon y el morron; oregano a gusto.").
			build
		
	}

	// ejemplo celulares home
	override def Predicate<Receta> getCriterio(Receta example) {
		null
	}

	override createExample() {
		new Receta
	}

	override getEntityType() {
		typeof(Receta)
	}

}
