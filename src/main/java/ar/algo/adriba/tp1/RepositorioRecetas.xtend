package ar.algo.adriba.tp1

import java.util.List
import java.util.ArrayList

public class RepositorioRecetas {
	List<Receta>listarTodas = new ArrayList

	static RepositorioRecetas repositorio = null  
	
	private new() {
	}
	     
    static def RepositorioRecetas getInstance() {
      if(repositorio == null) {
         repositorio = new RepositorioRecetas()
      }
      repositorio
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
