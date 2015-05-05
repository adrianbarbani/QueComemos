package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.Receta
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RecetaPrivada extends Receta {
	
	//  ya está en receta
	// Usuario duenioReceta

/* Pasé esto a receta, ahora la interfaz tipoReceta delega en receta lo que tiene que hacer si es publica o privada
 
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
 */		

}
