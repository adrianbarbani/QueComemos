package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
public class Receta implements Cosas {

	String nombreDelPlato
	List<Cosas>subRecetaseIngredientes = new ArrayList <Cosas>
	//List<Ingrediente> ingredientes = new ArrayList<Ingrediente>
	//List<Ingrediente> condimentos = new ArrayList<Ingrediente>
	String explicacionDeLaPreparacion // es un string largo no se si es el tipo adecuado
	//List<Receta> subRecetas = new ArrayList<Receta>
	Usuario duenioReceta
	int caloriasReceta
	String dificultad
	List<String> temporada

	//-----------------------------------------------------------------------------------------------------
	// Parte 1: validacion de una receta
	def boolean esvalida() {
		this.unIngrediente() && this.rangoCalorias()
	}

	def boolean unIngrediente() {
		subRecetaseIngredientes.exists[cosas|cosas == Comida] // te dice si alguna cosa es una comida osea si tiene un ingrediente (creo que esto no funciona)
		//ingredientes.size > 0
	}

	def boolean rangoCalorias() {
		(this.caloriasTotales > 10) && (this.caloriasTotales < 5000)
	}

	override int caloriasTotales() {// se supone que calculo las calorias 
		subRecetaseIngredientes.fold(0, [acum,cosa|acum + cosa.caloriasTotales])
		//ingredientes.fold(0, [acum, ingrediente|acum + ingrediente.calorias]) + this.caloriasSubRecetas //suma de las calorias de los ingredientes
	}

	/*def int caloriasSubRecetas() { // no tendria que aparecer mas esto se tendria que poder hacer todo en el metodo de arriba
		subRecetas.fold(0, [acumulado, subRecetas|acumulado + subRecetas.caloriasReceta]) //suma las calorias de las subrecetas
	}*/

	//------------------------------------------------------------------------------------------------------
	//Parte 2: Conciciones preexistentes para la que es inadecuada una receta
 	def paraQueCondicionesSoyInadecuada(List<CondicionPreexistente> unasCondicionesPreexistentesCompletas) {
		unasCondicionesPreexistentesCompletas.filter[condicion|condicion.sosInadecuada(this)]
	}

	override tenesSalOCaldo(){
		subRecetaseIngredientes.exists[cosas|cosas.tenesSalOCaldo]
	}
	
	override tenesDemasiadaAzucar(){
		subRecetaseIngredientes.exists[cosas|cosas.tenesDemasiadaAzucar]
	}

	override tenesCarne(){
		subRecetaseIngredientes.exists[cosas|cosas.tenesCarne]
	}

	//------------------------------------------------------------------------------------------------------

	def agregarSubReceta(Receta unaSubreceta) {
		subRecetaseIngredientes.add(unaSubreceta)
	}

	def void setearValores(Receta unaReceta) {
		this => [
			nombreDelPlato = unaReceta.nombreDelPlato
			subRecetaseIngredientes = unaReceta.subRecetaseIngredientes
			//ingredientes = unaReceta.ingredientes
			//condimentos = unaReceta.condimentos
			explicacionDeLaPreparacion = unaReceta.explicacionDeLaPreparacion
			caloriasReceta = unaReceta.caloriasReceta
			dificultad = unaReceta.dificultad
			temporada = unaReceta.temporada
			//subRecetas = unaReceta.subRecetas
		]
	}

	def boolean sosPublica() {

		true
	}
	
	//*********************ENTREGA 2***********************************************
	
	def boolean sePuedeSugerirA (Persona unaPersona){
		unaPersona.aceptasSugerencia(this)
	} 
	
}
