package ar.algo.adriba.tp1

import java.util.List
import java.util.ArrayList

class FiltroDeCalorias extends BusquedaDecorador{
	
	new(Busqueda unaBusqueda) {
		super(unaBusqueda)
	}
	
	
	
	override filtrar(List<Receta> recetas,Persona persona) {
		var List<Receta> recetasFiltradas = new ArrayList <Receta>
		recetasFiltradas = recetas.filter[receta|receta.caloriasMayorA(500)].toList
		decorado.filtrar(recetasFiltradas, persona)
	}	
		
}