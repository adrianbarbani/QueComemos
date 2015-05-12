package ar.algo.adriba.tp1

import java.util.ArrayList
import java.util.List

class MostrarResultadosPares extends Ordenamiento {

	int i
	List<Receta> resultado = new ArrayList <Receta>
	
	def boolean esPar(int num) {
	(num % 2) == 0

	}

	override ordenar(List<Receta> recetas) {
		
		i = 0

		for (Receta unaReceta : recetas) {

			if (this.esPar(i)) {
				resultado.add(unaReceta)
			}
			
		i++
		}
		
	resultado
	}
}
