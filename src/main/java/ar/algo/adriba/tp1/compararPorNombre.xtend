package ar.algo.adriba.tp1

import java.util.Comparator

abstract class compararPorNombre extends Ordenamiento implements Comparator<Receta> {
	
	override compare(Receta receta1, Receta receta2) {
		return receta1.nombreDelPlato.compareTo(receta2.nombreDelPlato) 
	}
	
	
}