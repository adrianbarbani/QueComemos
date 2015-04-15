package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.CondicionPreexistente

class Diabetico extends CondicionPreexistente {
	override validacion (Usuario unUsuario){
		super.validacion(unUsuario)				//hace el validacion del tamaño de la preferencia 
		unUsuario.sexoValido() 
		
	}
	
	//falta el loSatisface con el tema de la rutina
}