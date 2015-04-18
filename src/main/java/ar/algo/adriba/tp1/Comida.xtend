package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Comida {
	
	String nombre
	int cantidad
	
	def boolean sosCarne(){
		false
	}
	
	def boolean sosFruta(){
		false
	}

}