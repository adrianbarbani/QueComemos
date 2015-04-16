package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.CondicionPreexistente

class Celiaco extends CondicionPreexistente {
	override validacion (Usuario unUsuario){ //validacion va aca? validacion es el de las preferencias, no iria el de losatisface(Usuario unUsuario)??
		true
	}
	
	override loSatisface (Usuario unUsuario){
		true
	}
		
}