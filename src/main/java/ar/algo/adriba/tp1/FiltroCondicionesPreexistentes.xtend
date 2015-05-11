package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.Filtro
import java.util.List

class FiltroCondicionesPreexistentes implements Filtro {
	
	
	/* O bien
	  
	  	override filtrar(List<Receta> recetas,Persona persona) {
		recetas.filter[receta|persona.esAptaParaMi(receta)].toList
	}
	
	  
	 */
	override filtrar(List<Receta> recetas,Persona persona) {
		recetas.filter[receta|persona.aceptaTusCondiciones(receta)].toList
	}
	
	
	
}