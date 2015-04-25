package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors 
class Ingrediente {
	int calorias
	String nombre
	int cantidad
	
	def boolean sosFruta(){
		nombre.matches("frutas")
	}
	
	def boolean sosCarne(){
		nombre.matches("pollo|carne|chivito|chori")
	}
		
}