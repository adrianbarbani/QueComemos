package ar.algo.adriba.appModel

import ar.algo.adriba.tp1.Receta
import ar.algo.adriba.tp1.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class CopiarRecetaAppModel {

	Receta receta
	String nombreDeCopia
	Usuario usuario

	new(Receta unaReceta, Usuario unUsuario) {
		receta = unaReceta
		usuario = unUsuario
	}

	def copiarReceta() {
		receta.crearCopia(usuario, nombreDeCopia)
	}
}
