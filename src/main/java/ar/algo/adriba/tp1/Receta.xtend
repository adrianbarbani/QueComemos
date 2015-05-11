package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
public class Receta implements Cosas {

	String nombreDelPlato
	List<Cosas> subRecetaseIngredientes = new ArrayList<Cosas>
	String explicacionDeLaPreparacion // es un string largo no se si es el tipo adecuado
	Usuario duenioReceta
	int caloriasReceta
	String dificultad
	List<String> temporada
	tipoReceta tipo

	// esto para mi no va, se calcula siempre asique no tendria que tener un atributo
	List<CondicionPreexistente> condicionesParaLasQueNoSoyApta = new ArrayList<CondicionPreexistente>

	//-----------------------------------------------------------------------------------------------------
	// Parte 1: validacion de una receta
	def boolean esvalida() {
		this.unIngrediente() && this.rangoCalorias()
	}

	override unIngrediente() {
		subRecetaseIngredientes.exists[cosas|cosas.unIngrediente()] // te dice si alguna cosa es una comida osea si tiene un ingrediente (creo que esto no funciona)

	//ingredientes.size > 0
	}

	def boolean rangoCalorias() {
		(this.caloriasTotales > 10) && (this.caloriasTotales < 5000)
	}

	override int caloriasTotales() { // se supone que calculo las calorias 
		subRecetaseIngredientes.fold(0, [acum, cosa|acum + cosa.caloriasTotales])
	}

	//------------------------------------------------------------------------------------------------------
	//Parte 2: Conciciones preexistentes para la que es inadecuada una receta
	def List<CondicionPreexistente> paraQueCondicionesSoyInadecuada(
		List<CondicionPreexistente> unasCondicionesPreexistentesCompletas) {
		condicionesParaLasQueNoSoyApta = unasCondicionesPreexistentesCompletas.filter[condicion|
			condicion.sosInadecuada(this)].toList
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

	def caloriasMayorA(int i) {
		caloriasReceta > i
	}

	// donde se usa esto?
	def boolean noEsAptaParaEsta(CondicionPreexistente unaCondicion) {
		true //!condicionesParaLasQueNoSoyApta.contains(unaCondicion) esto tendria que andar  pero no por que bueno las condiciones no son las mismas son dos objetos de = clase, ponerle un string nombre talvez
	}

	def boolean todosLosIngredientesLeGustanA(Persona persona) {
		!subRecetaseIngredientes.exists[cosa|persona.teDisgustaUna(cosa)]
	}

	override nombre() {
		nombreDelPlato
	}
	
	def noTieneIngredientesCaros() {
		!(subRecetaseIngredientes.exists[cosas|cosas.esCaro])
	}
	
	override esCaro() {
		false
	}

}
