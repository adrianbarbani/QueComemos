package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.tipoReceta
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Privada implements tipoReceta {

	Usuario duenioReceta

	new(Usuario unUsuario) {
		duenioReceta = unUsuario
	}
	
	override sosPublica() {
		false
	}

	override sePuedeSugerir() {
		false
	}

}
