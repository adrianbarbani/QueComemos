package ar.algo.adriba.tp1

import java.util.List

abstract class Monitor {
	
	def void execute (List<Receta> recetas, Persona persona)
	
	def cantidadDeRecetas(List<Receta> recetas) {
		recetas.size
	}
}