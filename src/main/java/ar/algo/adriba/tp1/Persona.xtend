package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
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
	
	def boolean marcarTodoComoFavorito()
	
	def void marcarComoFavorita(Receta receta)
	
	def boolean es(String unNombre)
	
	def String getNombre()
	

}
