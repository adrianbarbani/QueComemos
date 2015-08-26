package ar.algo.adriba.tp1

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.Dependencies

@Observable
@Accessors
abstract class Persona {

	String nombre
	Sexo sexo
	List<Receta> recetasFavoritas = new ArrayList<Receta>
	boolean marcarTodasLasRecetasConsultadasComoFavoritas

	def boolean aceptasSugerencia(Receta unaReceta) {
		this.esAptaParaMi(unaReceta) && this.mePuedeGustar(unaReceta)
	}

	def boolean mePuedeGustar(Receta unaReceta)

	def boolean esAptaParaMi(Receta unaReceta)

	def boolean puedoVerReceta(Receta receta)

	def boolean tieneSobrepeso()

	def boolean esVegana()

	def void marcarComoFavorita(Receta receta) {
		if (puedoVerReceta(receta)) {
			if (!recetasFavoritas.contains(receta)) {
				recetasFavoritas.add(receta)
			}
		} else {
			throw new Exception("No puede ver esta receta.")
		}
	}

	def boolean es(String unNombre) {
		nombre.matches(unNombre)
	}

	def boolean marcarTodoComoFavorito() {
		marcarTodasLasRecetasConsultadasComoFavoritas
	}

	def void quieroMarcarTodoComoFavorito() {
		marcarTodasLasRecetasConsultadasComoFavoritas = true
	}
	
	def void desmarcarComoFavorita(Receta receta){
		recetasFavoritas.remove(receta)
	}
	
	@Dependencies("recetasFavoritas")
	def int getCantidadDeFavorita(){
		recetasFavoritas.size
	}
	
	def boolean esRecetaFavorita(Receta receta){
		recetasFavoritas.contains(receta)
		}
	
	def String sosDuenioDe(Receta receta)
	
}
