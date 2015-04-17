package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class Receta {

	String nombreDelPlato
	List<Ingrediente> ingredientes = new ArrayList<Ingrediente>
	List<Condimento> condimentos
	String explicacionDeLaPreparacion // es un string largo no se si es el tipo adecuado
	List<CondicionPreexistente> condicionesInadecuadas //condiciones preexistente inadecuado
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

	
}
