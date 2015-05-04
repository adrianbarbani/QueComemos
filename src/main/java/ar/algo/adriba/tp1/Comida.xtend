package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Comida implements Cosas {
	
	public String nombre
	int cantidad
	int calorias
	
	new(int unasCalorias, String unNombre, int unaCantidad) {
		calorias = unasCalorias
		nombre = unNombre
		cantidad = unaCantidad
	}
	
	
	override caloriasTotales(){
		calorias 
	}
	
	override tenesDemasiadaAzucar(){
		this.tenes("azucar") && this.tenesMasDelLimite(100)
	}
	
	override tenesCarne(){
		this.tenes("pollo||carne||chivito||chori")	
	}
	
	override tenesSalOCaldo(){
		this.tenes("sal") || this.tenes("caldo")
	}
	
	new(String unNombre) {
		nombre = unNombre
	}
	
	new(){}
	
	def boolean tenes(String unaCosa) {
		nombre.matches(unaCosa)
	}
	
	def boolean tenesMasDelLimite(int limite) {
		cantidad > limite
	}
	
}