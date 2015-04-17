package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.CondicionPreexistente

class Hipertenso extends CondicionPreexistente {

	override validacion(Usuario unUsuario) {
		super.validacion(unUsuario)
	}

	override loSatisface(Usuario unUsuario) {
	
	unUsuario.tenesUnaRutinaActivaIntensivaConEjercicioAdicional()
	}
	
	
}
