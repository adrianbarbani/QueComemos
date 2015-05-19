package ar.algo.adriba.tp1

import java.util.List
import java.util.ArrayList

class FiltroDeCalorias extends BusquedaDecorador {

	new(Busqueda unaBusqueda) {
		super(unaBusqueda)
	}

	override filtrar(List<Receta> recetas, Persona persona) {
		var List<Receta> recetasFiltradas = new ArrayList<Receta>

		if (persona.tieneSobrepeso()) {
			recetasFiltradas = recetas.filter[receta|receta.caloriasMenorA(500)].toList
		} else {
			recetasFiltradas = recetas.toList
		}

		decorado.filtrar(recetasFiltradas, persona)
	}

}
