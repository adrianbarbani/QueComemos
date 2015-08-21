package ar.algo.adriba.tp1

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Comida implements Cosas {

	public String nombre
	int cantidad
	int calorias
	List<String> ingredientesCaros = new ArrayList<String>
	 
	
	
	new(int unasCalorias, String unNombre, int unaCantidad) {
		calorias = unasCalorias
		nombre = unNombre
		cantidad = unaCantidad
		ingredientesCaros => [
			add("salmon")
			add("lomo")
			add("alcaparras")
			add("lechon")
		]
	}

	override nombre() {
		nombre
	}

	override unIngrediente() {
		calorias == 0
		
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
	
	override unCondimento() {
		cantidad == 0
	}

 	
}
