package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.CondicionPreexistente

class Diabetico extends CondicionPreexistente {
	override validacion (Usuario unUsuario){
		super.validacion(unUsuario)				//hace el validacion del tamaño de la preferencia 
		unUsuario.sexoValido() 
		
	}
	
	override loSatisface (Usuario unUsuario){
		this.peso(unUsuario)<70	// falta el tema de la rutina 
	}
	
	def peso(Usuario usuario) {
		usuario.peso
	}
}