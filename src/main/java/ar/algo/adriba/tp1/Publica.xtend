package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.tipoReceta

class Publica implements tipoReceta {

	override sosPublica() {
		true
	}

	override sePuedeSugerir() {
		true
	}

	override tePuedeModificar(Receta unaReceta, Usuario usuario) {
		true
	}

	override cambiarValores(Usuario usuario, Receta receta, Receta unaRecetaConModificaciones) {
		val Receta nuevaReceta = usuario.agregarReceta(receta)
		usuario.modificarUnaReceta(nuevaReceta, unaRecetaConModificaciones)
	}
	
	override mePuedeVer(Usuario usuario, Receta unaReceta) {
		true
	}

}
