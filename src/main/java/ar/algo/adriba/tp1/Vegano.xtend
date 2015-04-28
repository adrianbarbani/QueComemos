package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.CondicionPreexistente

class Vegano extends CondicionPreexistente {
	override validacion(Usuario unUsuario) {
		unUsuario.preferenciasAlimentarias.forall[comida|!(comida.tenes("pollo||carne||chivito||chori"))]
	}

	override loSatisface(Usuario unUsuario) {
		unUsuario.preferenciasAlimentarias.exists[comida|comida.tenes("frutas")]
	}

	override sosInadecuada(Receta unaReceta) {
		unaReceta.tenesCarne()
	}
}
