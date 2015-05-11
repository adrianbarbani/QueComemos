package ar.algo.adriba.tp1

import java.util.List

class FiltroDeCalorias implements Filtro {
	
	override filtrar(List<Receta> recetas,Persona persona) {
		recetas.filter[receta|receta.caloriasMayorA(500)].toList
	}
	
		
		
}