package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.Filtro
import java.util.List

class FiltroPorGusto implements Filtro {
	
	override filtrar(List<Receta> recetas, Persona persona) {
		recetas.filter[receta|persona.mePuedeGustar(receta)].toList
	}
	
}