package ar.algo.adriba.tp1


import java.util.List
import java.util.ArrayList

class FiltroCondicionesPreexistentes extends BusquedaDecorador{
	
	
	/* O bien
	  
	  	override filtrar(List<Receta> recetas,Persona persona) {
		recetas.filter[receta|persona.esAptaParaMi(receta)].toList
	}
	
	  
	 */
	
	new(Busqueda unaBusqueda) {
		super(unaBusqueda)
	}
	
	override filtrar(List<Receta> recetas,Persona persona) {
		var List<Receta> recetasFiltradas = new ArrayList <Receta>
		recetasFiltradas = recetas.filter[receta|persona.aceptaTusCondiciones(receta)].toList
		decorado.filtrar(recetasFiltradas, persona)
	}
	
	
	
}