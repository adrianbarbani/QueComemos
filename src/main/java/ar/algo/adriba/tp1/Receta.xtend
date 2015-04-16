package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class Receta {
	
	String nombreDelPlato
	List <Ingrediente> ingredientes
	List <Condimento> condimentos
	String explicacionDeLaPreparacion // es un string largo no se si es el tipo adecuado
	List <CondicionPreexistente> condicionesInadecuadas //condiciones preexistente inadecuado
	int caloriasReceta 
	String dificultad //es una sola palabra, no se usa para otra cosa me parece
	
	Temporada temporada = new Navidad // new navidad es un ejemplo
	
	def boolean esvalida() {
		(this.unIngrediente() && this.rangoCalorias())
	}
	
	def boolean rangoCalorias() {
		(this.caloriasReceta>10)&&(caloriasReceta<5000) //con this. o sin this. 
	}
	
	def boolean unIngrediente() {
		ingredientes.size>0
	}
}