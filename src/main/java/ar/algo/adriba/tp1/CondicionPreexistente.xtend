package ar.algo.adriba.tp1

class CondicionPreexistente {
	def boolean validacion(Usuario unUsuario){
		unUsuario.tamañoPreferencias() > 0//por las dudas ver
	}
	
	def boolean loSatisface (Usuario unUsuario){
		true
	}
}