package ar.algo.adriba.tp1

abstract class Persona {

	def boolean aceptasSugerencia(Receta unaReceta) {
		this.esAptaParaMi(unaReceta) && this.mePuedeGustar(unaReceta)
	}

	def boolean mePuedeGustar(Receta unaReceta)

	def boolean esAptaParaMi(Receta unaReceta)

	def boolean puedoVerReceta(Receta receta)
	
	def boolean tieneSobrepeso()
	
	def String miSexo()
	
	def boolean esVegana()
	
	

}
