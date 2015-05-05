package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class GrupoDeUsuario implements Persona {
	
	String nombre
	List<String>preferenciasAlimenticiasGrupal = new ArrayList<String>
	List<Usuario>integrantes = new ArrayList<Usuario>
	
	def boolean integranteEsDuenio(Receta receta) {
		integrantes.exists[usuario|usuario.usuarioTiene(receta)]
	}
	

		//****************************ENTREGA 2**************************************
	override aceptasSugerencia(Receta unaReceta) {
	this.esAptaParaMi(unaReceta) && this.mePuedeGustar(unaReceta)	
	}
	
	override mePuedeGustar(Receta unaReceta) {
	this.preferenciasAlimenticiasGrupal.exists[comida|unaReceta.tenes(comida)]
	}
	
	override esAptaParaMi(Receta unaReceta) {
	integrantes.forall[integrante|integrante.esAptaParaMi(unaReceta)]
	
	}
}