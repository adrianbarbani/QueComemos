package ar.algo.adriba.tp1

import java.util.List

class MostrarResultadosPares extends Ordenamiento {

	int i

	def boolean esPar(int num) {
	(num % 2) == 0

	}

	override ordenar(List<Receta> recetas) {
		
		i = 0

		for (Receta unaReceta : recetas) {

			if (!(this.esPar(i))) {
				recetas.remove(unaReceta)
			}
			
		i++
		}
		
	recetas.toList
	}
}
