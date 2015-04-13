package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class Receta {
	
	String nombreDelPlato
	List <Ingrediente> ingredientes
	List <Condimento> condimentos
	String explicacionDeLaPreparacion // es un string largo no se si es el tipo adecuado
	//condiciones preexistente inadecuado
	int caloriasReceta 
	
	Temporada temporada = new Navidad // new navidad es un ejemplo
	
		
}