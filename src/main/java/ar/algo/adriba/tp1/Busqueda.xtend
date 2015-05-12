package ar.algo.adriba.tp1

import java.util.List

interface Busqueda {
	def List<Receta> filtrar(List<Receta> recetas, Persona persona)

	def List<Receta> recetasQuePuedeVer(Persona unaPersona)
	
	def List<Receta> llenarTodasLasRecetas ()
	
}
