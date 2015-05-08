package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class GrupoDeUsuario extends Persona {
	
	String nombre
	List<String>preferenciasAlimenticiasGrupal = new ArrayList<String>
	List<Usuario>integrantes = new ArrayList<Usuario>
	
	def boolean integranteEsDuenio(Receta receta) {
		integrantes.exists[usuario|usuario.usuarioTiene(receta)]
	}
	

		//****************************ENTREGA 2**************************************
	override puedoVerReceta(Receta receta){ //si algun usuario la puede ver 
		integrantes.exists[usuario|usuario.puedoVerReceta(receta)]
	}
	
	override mePuedeGustar(Receta unaReceta) {
	this.preferenciasAlimenticiasGrupal.exists[comida|unaReceta.tenes(comida)]
	}
	
	override esAptaParaMi(Receta unaReceta) {
	integrantes.forall[integrante|integrante.esAptaParaMi(unaReceta)]
	
	}
	
	def double imcPromedio (){
		this.imcIntegrantes/this.cantidadDeIntegrantes
	}
	
	def int cantidadDeIntegrantes() {
		integrantes.size
	}
	
	def double imcIntegrantes() {
		integrantes.fold(0, [acum, integrante|acum + integrante.imc]) // ver
	}
	
	def boolean tieneSobrePeso(){		
    this.imcPromedio() > 30
	}
	
	override aceptaTusCondiciones(Receta receta) {
		!integrantes.exists[integrante|/*1ra negacion*/!(integrante.aceptaTusCondiciones(receta))] // si existe alguno que no acepte las condiciones va a ser falce se convierte en true por el 1° ! despues el exists da true y se convierte en falce por el segundo !
	}
	
}