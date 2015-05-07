package ar.algo.adriba.tp1

import java.awt.List
import java.util.ArrayList


class FiltroDeCalorias implements Filtro {
	
	override filtrar(java.util.List<Receta> recetas) {
		recetas.filter[receta|receta.caloriasMayorA(500)].toList
	}
	
		
		
}