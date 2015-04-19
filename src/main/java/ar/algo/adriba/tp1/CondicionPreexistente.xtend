package ar.algo.adriba.tp1

class CondicionPreexistente {
	def boolean validacion(Usuario unUsuario){
		unUsuario.tamañoPreferencias() > 0
	}
	
	def boolean loSatisface (Usuario unUsuario){
		true
	}
	
	def boolean sosInadecuada(Receta receta) {
		false
	}	
}