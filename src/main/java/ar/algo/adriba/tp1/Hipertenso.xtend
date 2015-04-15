package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.CondicionPreexistente

class Hipertenso extends CondicionPreexistente {
	
	override loSatisface (Usuario unUsuario){
		this.peso(unUsuario)<70	// falta el tema de la rutina 
	}
	
	def peso(Usuario usuario) {
		usuario.peso
	}

}