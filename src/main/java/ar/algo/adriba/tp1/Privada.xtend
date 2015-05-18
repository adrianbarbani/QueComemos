package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.tipoReceta
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Privada implements tipoReceta {

	Usuario duenioReceta

	new(Usuario unUsuario) {
		duenioReceta = unUsuario
	}

	// ver si se esta usando
	override sosPublica() {
		false
	}

	override sePuedeSugerir() {
		false
	}

	override tePuedeModificar(Receta unaReceta, Usuario usuario) {
		this.esDuenio(usuario)
	}

	override cambiarValores(Usuario usuario, Receta receta, Receta unaRecetaConModificaciones) {
		receta.setearValores(unaRecetaConModificaciones)
	}
	
	override mePuedeVer(Usuario unUsuario, Receta unaReceta) {
		this.esDuenio(unUsuario) || unUsuario.alguienDelGrupoConoce(unaReceta)
		}
	
	def boolean esDuenio(Usuario usuario) {
		duenioReceta.equals(usuario)
	}

}
