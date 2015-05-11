package ar.algo.adriba.tp1

import java.util.Comparator

abstract class compararPorCalorias extends Ordenamiento implements Comparator<Receta> {
	
	override compare(Receta receta1, Receta receta2) {
		return receta1.caloriasReceta.compareTo(receta2.caloriasReceta) 
	}

}