package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
public class Receta implements Cosas {

	String nombreDelPlato
	List<Cosas> subRecetaseIngredientes = new ArrayList<Cosas> 
	String explicacionDeLaPreparacion
	Usuario duenioReceta
	int caloriasReceta
	String dificultad
	List<String> temporada
	tipoReceta tipo

	//-----------------------------------------------------------------------------------------------------
	// Parte 1: validacion de una receta
	def boolean esvalida() {
		this.unIngrediente() && this.rangoCalorias()
	}

	override unIngrediente() {
		subRecetaseIngredientes.exists[cosas|cosas.unIngrediente()]
	}

	def boolean rangoCalorias() {
		(this.caloriasReceta > 10) && (this.caloriasReceta < 5000)
	}

	//------------------------------------------------------------------------------------------------------
	//Parte 2: Conciciones preexistentes para la que es inadecuada una receta
	def List<CondicionPreexistente> paraQueCondicionesSoyInadecuada(
		List<CondicionPreexistente> unasCondicionesPreexistentesCompletas) {
		unasCondicionesPreexistentesCompletas.filter[condicion|condicion.sosInadecuada(this)].toList
	}

	override tenesSalOCaldo() {
		subRecetaseIngredientes.exists[cosas|cosas.tenesSalOCaldo]
	}

	override tenesDemasiadaAzucar() {
		subRecetaseIngredientes.exists[cosas|cosas.tenesDemasiadaAzucar]
	}

	override tenesCarne() {
		subRecetaseIngredientes.exists[cosas|cosas.tenesCarne]
	}

	override tenes(String unaCosa) {
		subRecetaseIngredientes.exists[cosas|cosas.tenes(unaCosa)]
	}

	//------------------------------------------------------------------------------------------------------
	def agregarSubReceta(Receta unaSubreceta) {
		subRecetaseIngredientes.add(unaSubreceta)
	}

	def void setearValores(Receta unaReceta) {
		this => [
			nombreDelPlato = unaReceta.nombreDelPlato
			subRecetaseIngredientes = unaReceta.subRecetaseIngredientes
			explicacionDeLaPreparacion = unaReceta.explicacionDeLaPreparacion
			caloriasReceta = unaReceta.caloriasReceta
			dificultad = unaReceta.dificultad
			temporada = unaReceta.temporada
		]
	}

	// Constructor para recetas PRIVADAS
	new(Receta unaReceta, Usuario unUsuario) {
		this.setearValores(unaReceta)
		this.tipo = new Privada(unUsuario)

	}

	new() {
	}

	def boolean sosPublica() {
		tipo.sosPublica()
	}

	def boolean laPuedeModificar(Usuario usuario) {
		tipo.tePuedeModificar(this, usuario)
	}

	def modificarValores(Usuario usuario, Receta receta, Receta unaRecetaConModificaciones) {
		tipo.cambiarValores(usuario, receta, unaRecetaConModificaciones)
	}

	def boolean tePuedeVer(Usuario unUsuario) {
		tipo.mePuedeVer(unUsuario, this)
	}

	//*********************ENTREGA 2***********************************************
	def boolean sePuedeSugerirA(Persona unaPersona) {
		unaPersona.aceptasSugerencia(this)
	}

	def boolean caloriasMenorA(int i) {
		caloriasReceta < i
	}

	override nombre() {
		nombreDelPlato
	}

	def boolean noTieneIngredientesCaros() {
		!(subRecetaseIngredientes.exists[cosas|cosas.esCaro])
	}

	override esCaro() {
		false
	}

}
