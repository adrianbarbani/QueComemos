package ar.algo.adriba.appModel

import ar.algo.adriba.tp1.RepoDeUsuariosMock
import ar.algo.adriba.tp1.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class LoginAppModel {

	String nombreUsuarioABuscar
	String contrasenia
	Usuario usuarioLogin
	
	def autorizarLogin() {
		RepoDeUsuariosMock.getInstance.compararContraseña(nombreUsuarioABuscar,contrasenia)
		usuarioLogin= RepoDeUsuariosMock.getInstance.obtenerUsuario(nombreUsuarioABuscar)
	}
	
	def clear(){
		nombreUsuarioABuscar = null
		contrasenia = null
	}
}