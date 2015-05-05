package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.Receta
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RecetaPrivada extends Receta {
	Usuario duenioReceta

	new(Receta unaReceta, Usuario unUsuario) {
		this.setearValores(unaReceta)
		this.duenioReceta = unUsuario
	}
	
	new() {
		
	}

	
	def SetduenioReceta(Usuario usuario) {
		duenioReceta=usuario
	}
	
	override def boolean sosPublica() {
		false
	}
		

}
