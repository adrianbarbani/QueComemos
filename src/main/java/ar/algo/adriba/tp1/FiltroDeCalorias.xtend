package ar.algo.adriba.tp1

import java.util.List

class FiltroDeCalorias implements Filtro {

	override filtrar(List<Receta> recetas, Persona persona) {
		if (persona.tieneSobrepeso()) {
			recetas.filter[receta|receta.caloriasMenorA(500)].toList
		} else {
			recetas.toList
		}

	}
}
