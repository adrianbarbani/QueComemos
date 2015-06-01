package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.CondicionPreexistente

class Celiaco extends CondicionPreexistente {
	
	String nombre
	new(){
		nombre=("Celiaco")
	}
	
	override validacion (Usuario unUsuario){ 
		true
	}
	
	override loSatisface (Usuario unUsuario){
		true
	}
	
	override sosInadecuada(Receta unaReceta){
		false
}


}