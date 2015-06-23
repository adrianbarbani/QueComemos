package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
abstract class Persona {
	
	String nombre
	Sexo sexo
	List<Receta> recetasFavoritas
	
	def boolean aceptasSugerencia(Receta unaReceta) {
		this.esAptaParaMi(unaReceta) && this.mePuedeGustar(unaReceta)
	}

	def boolean mePuedeGustar(Receta unaReceta)

	def boolean esAptaParaMi(Receta unaReceta)

	def boolean puedoVerReceta(Receta receta)
	
	def boolean tieneSobrepeso()
	
	def boolean esVegana()
	
	def boolean marcarTodoComoFavorito()
	
	def void marcarComoFavorita(Receta receta)
	
	def boolean es(String unNombre)
	
	// def String getNombre()
	
	// def Sexo getSexo()

}
