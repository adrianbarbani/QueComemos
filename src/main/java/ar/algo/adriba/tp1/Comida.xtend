package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import java.util.List

@Accessors
class Comida implements Cosas {

	public String nombre
	int cantidad
	int calorias
	List<String> ingredientesCaros = new ArrayList<String> // en el test agregar los strings salmon, lomo, alcaparras y lechon

	new(int unasCalorias, String unNombre, int unaCantidad) {
		calorias = unasCalorias
		nombre = unNombre
		cantidad = unaCantidad
	}

	override nombre() {
		nombre
	}

	override unIngrediente() {
		true
	}

	override tenesDemasiadaAzucar() {
		this.tenes("azucar") && this.tenesMasDelLimite(100)
	}

	override tenesCarne() {
		this.tenes("pollo||carne||chivito||chori")
	}

	override tenesSalOCaldo() {
		this.tenes("sal") || this.tenes("caldo")
	}

	new(String unNombre) {
		nombre = unNombre
	}

	new() {
	}

	override tenes(String unaCosa) {
		nombre.matches(unaCosa)
	}

	def boolean tenesMasDelLimite(int limite) {
		cantidad > limite
	}

	override esCaro() {
		ingredientesCaros.contains(this.nombre)
	}

}
