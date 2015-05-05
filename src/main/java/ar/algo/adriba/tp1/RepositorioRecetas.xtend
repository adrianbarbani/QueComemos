package ar.algo.adriba.tp1

import java.util.List
import java.util.ArrayList
// HACER UN SINGLETON!
class RepositorioRecetas {
	List<Receta>listarTodas = new ArrayList
	
	def void agregar (Receta unaReceta){
		listarTodas.add(unaReceta)
	}
	
	def void quitar(Receta unaReceta){
		listarTodas.remove(unaReceta)
	}
	

}