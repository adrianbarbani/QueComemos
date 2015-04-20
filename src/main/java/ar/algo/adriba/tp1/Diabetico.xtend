package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.CondicionPreexistente

class Diabetico extends CondicionPreexistente {
	
	override validacion(Usuario unUsuario) {
		super.validacion(unUsuario) && unUsuario.sexo != null //hace el validacion del tamaño de la preferencia 

	//agregue el &&, va?
	}

	override loSatisface(Usuario unUsuario) {
		this.peso(unUsuario) < 70 || unUsuario.tieneRutinaActiva()
	}

	def peso(Usuario usuario) {
		usuario.peso
	}
	
	override sosInadecuada(Receta unaReceta){
		unaReceta.contenesMasDe100DeAzucar()
	}
}
