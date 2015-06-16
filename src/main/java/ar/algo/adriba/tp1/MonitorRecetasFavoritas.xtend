package ar.algo.adriba.tp1

import java.util.List

class MonitorRecetasFavoritas extends Monitor {
	
	override execute(List<Receta> recetas, Persona persona) {
		if(persona.marcarTodoComoFavorito){
			recetas.forEach[receta|persona.marcarComoFavorita(receta)]
		}
	}
	
	
}