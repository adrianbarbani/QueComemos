package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
public class Receta {

	String nombreDelPlato
	List<Ingrediente> ingredientes = new ArrayList<Ingrediente>
	List<Ingrediente> condimentos = new ArrayList<Ingrediente>
	String explicacionDeLaPreparacion // es un string largo no se si es el tipo adecuado
	List<Receta> subRecetas = new ArrayList<Receta>
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
		ingredientes.size > 0
	}

	def boolean rangoCalorias() {
		(this.caloriasTotales > 10) && (this.caloriasTotales < 5000)
	}

	def caloriasTotales() {
		ingredientes.fold(0, [acum, ingrediente|acum + ingrediente.calorias]) + this.caloriasSubRecetas //suma de las calorias de los ingredientes
	}

	def int caloriasSubRecetas() {
		subRecetas.fold(0, [acumulado, subRecetas|acumulado + subRecetas.caloriasReceta]) //suma las calorias de las subrecetas
	}

	//------------------------------------------------------------------------------------------------------
	//Parte 2: Conciciones preexistentes para la que es inadecuada una receta
	def paraQueCondicionesSoyInadecuada(List<CondicionPreexistente> unasCondicionesPreexistentesCompletas) {
		unasCondicionesPreexistentesCompletas.filter[condicion|condicion.sosInadecuada(this)]
	}

	def boolean tenesSalOCaldo() {
		condimentos.exists[condimentos|condimentos.tenes("Sal")] ||
			condimentos.exists[condimentos|condimentos.tenes("Caldo")]
	}

	def boolean tenesDemasiadaAzucar() {
		condimentos.exists[condimentos|condimentos.tenes("Azucar") && condimentos.tenesMasDelLimite(100)]
	}

	def boolean tenesCarne() {
		ingredientes.exists[ingrediente|ingrediente.tenes("pollo||carne||chivito||chori")]
	}

	//------------------------------------------------------------------------------------------------------
	//Parte 3: Recetas privadas y publicas
	def boolean usuarioSosDuenio(Usuario unUsuario) {
		false
	}

	def agregarSubReceta(Receta unaSubreceta) {
		subRecetas.add(unaSubreceta)
	}

	def void setearValores(Receta unaReceta) {
		this => [
			nombreDelPlato = unaReceta.nombreDelPlato
			ingredientes = unaReceta.ingredientes
			condimentos = unaReceta.condimentos
			explicacionDeLaPreparacion = unaReceta.explicacionDeLaPreparacion
			caloriasReceta = unaReceta.caloriasReceta
			dificultad = unaReceta.dificultad
			temporada = unaReceta.temporada
			subRecetas = unaReceta.subRecetas
		]
	}

	def boolean sosPublica() {

		true
	}

}
