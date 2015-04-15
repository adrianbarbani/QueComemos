package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.CondicionPreexistente

class Vegano extends CondicionPreexistente {
	override validacion (Usuario unUsuario){
		unUsuario.validacionVegano()
	}
	
	override loSatisface(Usuario unUsuario){
		true //le tiene que gustar las frutas
	}
}