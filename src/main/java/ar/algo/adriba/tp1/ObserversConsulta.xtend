package ar.algo.adriba.tp1

import java.util.List
import java.util.Map

abstract class ObserversConsulta {

	def void send(List<Receta> recetas, Persona persona)

	def maximo(Map<Receta, Integer> map) {
	// TODO: Hacer metodo para sacar el max 
	}
		
	def consultasPor(List<Receta> recetas, Map<Receta, Integer> map) {
		for (Receta receta : recetas) {
			val int valor = map.get(receta)
			map.put(receta, valor + 1)

		}
	}
}
