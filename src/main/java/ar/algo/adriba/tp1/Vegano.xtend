package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.CondicionPreexistente

class Vegano extends CondicionPreexistente {
	override validacion (Usuario unUsuario){
		unUsuario.validacionVegano()
	}
	
	override loSatisface(Usuario unUsuario){
		unUsuario.leGustaLaFruta//le tiene que gustar las frutas
	}
	
	override sosInadecuada(Receta unaReceta){
		unaReceta.tenesCarne()
	}
}