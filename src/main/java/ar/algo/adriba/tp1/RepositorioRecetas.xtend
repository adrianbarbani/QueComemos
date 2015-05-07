package ar.algo.adriba.tp1

import java.util.List
import java.util.ArrayList
// HACER UN SINGLETON!
public class RepositorioRecetas {
	List<Receta>listarTodas = new ArrayList
	
	private static RepositorioRecetas repositorio = null //puede que este tirando a cualquiera 
	
	      // Exists only to defeat instantiation.
  
    def static RepositorioRecetas getInstance() {
      if(repositorio == null) {
         repositorio = new RepositorioRecetas()
      }
      return repositorio;
   }
	
	
	def void agregar (Receta unaReceta){
		listarTodas.add(unaReceta)
	}
	
	def void quitar(Receta unaReceta){
		listarTodas.remove(unaReceta)
	}
	
	def List<Receta> todasLasRecetas() {
		listarTodas
	}
	

}