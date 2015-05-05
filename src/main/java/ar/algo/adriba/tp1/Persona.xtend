package ar.algo.adriba.tp1

interface Persona {
	
	def boolean aceptasSugerencia(Receta unaReceta)
	// esta podria ser una super clase y aca definir el metodo como
	// this.esAptaParaMi(unaReceta) && this.mePuedeGustar(unaReceta)	
	
	def boolean mePuedeGustar(Receta unaReceta)
	def boolean esAptaParaMi(Receta unaReceta) 
	
}