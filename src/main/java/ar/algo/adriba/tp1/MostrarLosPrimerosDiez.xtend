package ar.algo.adriba.tp1

import java.util.List
import java.util.ArrayList

class MostrarLosPrimerosDiez extends Ordenamiento {
	val List<Receta> resultado = new ArrayList<Receta>

	override ordenar(List<Receta> recetas) {
		recetas.forEach[unaReceta, i|
			if (i < 10) {
				resultado.add(unaReceta)
			}]
		resultado.toList
	}

}
