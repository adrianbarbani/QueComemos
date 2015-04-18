package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
public class Receta {

	String nombreDelPlato
	List<Ingrediente> ingredientes = new ArrayList<Ingrediente>
	List<Condimento> condimentos = new ArrayList<Condimento>
	String explicacionDeLaPreparacion // es un string largo no se si es el tipo adecuado
	List<CondicionPreexistente> condicionesInadecuadas = new ArrayList<CondicionPreexistente>

	/*la idea es que esta coleccion cuando se inicie tenga todas las condiciones posibles y despues
	 * filtrarlas y que cada condicion sepa si es inadecuada para la receta o no */
	 
	Usuario duenioReceta
	int caloriasReceta 
	String dificultad //es una sola palabra, no se usa para otra cosa me parece
	TodoElAnio temporada = new Verano // new verano es un ejemplo
	List<Receta> subRecetas = new ArrayList<Receta>


	// Para cuando el usuario se copia la receta
	new(Receta unaReceta, Usuario unUsuario) {
		this.setearValores(unaReceta)
		this.duenioReceta = unUsuario
	}

	// este metodo podria no estar en un constructor me parece, despues veo
	new() {
		this.paraQueCondicionesSoyInadecuada() // se supone que este metodo se hace para filtrar la coleccion antes tendria que meter todas las condiciones posibles en la collection
	}

	//-----------------------------------------------------------------------------------------------------
	// Parte 1: validacion de una receta
	def boolean esvalida() {
		(this.unIngrediente() && this.rangoCalorias())
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
	def paraQueCondicionesSoyInadecuada() {
		condicionesInadecuadas.filter[condicion|condicion.sosInadecuada(this)] // supuestamente esto tendria que 
	}

	def boolean contenesSaloCaldo() {
		condimentos.exists[condimentos|condimentos.sosSaloCaldo]
	}

	def boolean contenesMasDe100DeAzucar() {
		condimentos.exists[condimentos|condimentos.sosAzucarYtenesMasDe100gr]
	}

	def boolean tenesCarne() {
		ingredientes.exists[comida|comida.sosCarne]
	}

	def boolean sosPublica() {
		(duenioReceta == null)
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

	def boolean usuarioSosDuenio(Usuario unUsuario) {
		unUsuario == duenioReceta
	}//a

}
