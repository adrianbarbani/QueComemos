package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class Receta {

	String nombreDelPlato 
	List<Ingrediente> ingredientes = new ArrayList<Ingrediente>
	List<Condimento> condimentos = new ArrayList<Condimento>
	String explicacionDeLaPreparacion // es un string largo no se si es el tipo adecuado
	List<CondicionPreexistente> condicionesInadecuadas = new ArrayList <CondicionPreexistente> /*la idea es que esta coleccion cuando se inicie tenga todas las condiciones posibles y despues
	 * filtrarlas y que cada condicion sepa si es inadecuada para la receta o no */ 
	int caloriasReceta
	String dificultad //es una sola palabra, no se usa para otra cosa me parece
	TodoElAnio temporada = new Verano // new verano es un ejemplo

	new(){
		this.paraQueCondicionesSoyInadecuada() // se supone que este metodo se hace para filtrar la coleccion antes tendria que meter todas las condiciones posibles en la collection
	}
	//-----------------------------------------------------------------------------------------------------
	// Parte 1: validacion de una receta
	def boolean esvalida() {
		(this.unIngrediente() && this.rangoCalorias())
	}

	def boolean unIngrediente()
	{
		ingredientes.size>0
	}
	
	def boolean rangoCalorias() {
		(this.caloriasTotales > 10) && (this.caloriasTotales < 5000)
	}

	def caloriasTotales() {
		ingredientes.fold(0, [acum, ingrediente|acum + ingrediente.calorias]) //suma de las calorias de los ingredientes
	}

	
	//------------------------------------------------------------------------------------------------------
	//Parte 2: Conciciones preexistentes para la que es inadecuada una receta
	
	def paraQueCondicionesSoyInadecuada(){
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
		false
	}
	
}
