package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Comida {
	
	String nombre
	int cantidad
	
	def boolean sosCarne(){
		nombre.matches("pollo|carne|chivito|chori")
	}
	
	def boolean sosFruta(){
		nombre.matches("frutas")
	}

}