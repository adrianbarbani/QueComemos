package ar.algo.adriba.tp1


import java.util.List
import java.util.ArrayList

class FiltroPorGusto extends BusquedaDecorador {
	
	new(Busqueda unaBusqueda) {
		super(unaBusqueda)
	}
	
	
	
	override filtrar(List<Receta> recetas,Persona persona) {
		var List<Receta> recetasFiltradas = new ArrayList <Receta>
		recetasFiltradas = recetas.filter[receta|persona.mePuedeGustar(receta)].toList
		decorado.filtrar(recetasFiltradas, persona)
	}	
}