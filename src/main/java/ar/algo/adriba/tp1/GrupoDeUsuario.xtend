package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class GrupoDeUsuario implements Persona {
	
	String nombre
	List<Comida>preferenciasAlimenticiasGrupal = new ArrayList<Comida>
	List<Usuario>integrantes = new ArrayList<Usuario>
	
	def boolean integranteEsDuenio(Receta receta) {
		integrantes.exists[usuario|usuario.usuarioSosDuenio(receta)]
	}
	
	override aceptasSugerencia(Receta receta){
		true//ver en recetas metodo para que condiciones soy inadecuada
	}
	
	
	
	
}