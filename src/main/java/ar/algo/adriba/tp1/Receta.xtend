package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class Receta {

	String nombreDelPlato

	List <Comida> ingredientes
	List <Comida> condimentos
	List <Receta> subRecetas
	String explicacionDeLaPreparacion 
	List <CondicionPreexistente> condicionesInadecuadas //condiciones preexistente inadecuado
	int caloriasReceta 

	
	String dificultad //es una sola palabra, no se usa para otra cosa me parece

	Temporada temporada = new Navidad // new navidad es un ejemplo

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
	
	def paraQueCondicionesSoyInadecuada() //que deberia devolver? strings? o una coleccion de condiciones...
	{
		
	}
	
}
