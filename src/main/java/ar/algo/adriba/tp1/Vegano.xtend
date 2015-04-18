package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.CondicionPreexistente

class Vegano extends CondicionPreexistente {
	override validacion (Usuario unUsuario){
		unUsuario.preferenciasAlimentarias.forall[comida|!(comida.sosCarne)]
	}
	
	override loSatisface(Usuario unUsuario){
		unUsuario.leGustaLaFruta
	}
	
	override sosInadecuada(Receta unaReceta){
		unaReceta.tenesCarne()
	}
}