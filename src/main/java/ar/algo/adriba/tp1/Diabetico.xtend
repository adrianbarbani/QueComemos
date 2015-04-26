package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.CondicionPreexistente

class Diabetico extends CondicionPreexistente {
	
	override validacion(Usuario unUsuario) {
		(unUsuario.tamañoPreferencias() > 0) //PROBLEMA ACA&& (unUsuario.sexo != null)  
	
	}

	override loSatisface(Usuario unUsuario) {
		unUsuario.getPeso() < 70 || unUsuario.tieneRutinaActiva()
	}

	override sosInadecuada(Receta unaReceta){
		unaReceta.tenesDemasiadaAzucar()
	}
}

 