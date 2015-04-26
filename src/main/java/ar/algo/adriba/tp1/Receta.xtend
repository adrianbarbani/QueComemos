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
	List<Receta> subRecetas = new ArrayList<Receta> 
	Usuario duenioReceta
	int caloriasReceta 
	String dificultad 
	Temporada temporada   
	
	
	
	new() {
		condicionesInadecuadas.add(new Diabetico) // agrego todas las condiciones posibles
		condicionesInadecuadas.add(new Hipertenso)
		condicionesInadecuadas.add(new Celiaco)
		condicionesInadecuadas.add(new Vegano)
		this.paraQueCondicionesSoyInadecuada() // las filtro
	}

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
	def paraQueCondicionesSoyInadecuada() {
		condicionesInadecuadas.filter[condicion|condicion.sosInadecuada(this)] 
	}

	def boolean contenesSaloCaldo() {
		condimentos.exists[condimentos|condimentos.sosSaloCaldo]
	}

	def boolean tenesDemasiadaAzucar() {
		condimentos.exists[condimentos|condimentos.sosAzucarYtenesMasDe100gr]
	}

	def boolean tenesCarne() {
		ingredientes.exists[comida|comida.sosCarne]
	}

	
	def boolean usuarioSosDuenio(Usuario unUsuario) {
		false
	}
	
	def agregarSubReceta(Receta unaSubreceta){
		subRecetas.add(unaSubreceta)
	}	
	

}
