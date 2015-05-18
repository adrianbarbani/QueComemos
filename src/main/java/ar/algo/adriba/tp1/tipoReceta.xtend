package ar.algo.adriba.tp1

// acá separamos las Publicas de las Privadas
interface tipoReceta {

	def boolean sePuedeSugerir()

	def boolean tePuedeModificar(Receta unaReceta, Usuario usuario)

	def void cambiarValores(Usuario usuario, Receta receta, Receta unaRecetaConModificaciones)
	
	def boolean mePuedeVer(Usuario usuario, Receta unaReceta)

}
