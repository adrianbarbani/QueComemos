package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors 
class Ingrediente {
	int calorias
	String nombre
	int cantidad
	
	new (int unasCalorias, String unNombre, int unaCantidad){
		calorias=unasCalorias
		nombre=unNombre
		cantidad=unaCantidad
	}
	
	def boolean sosFruta(){
		nombre.matches("frutas")
	}
	
	def boolean sosCarne(){
		nombre.matches("pollo|carne|chivito|chori")
	}
		
}