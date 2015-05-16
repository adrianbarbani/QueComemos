package ar.algo.adriba.tp1

import java.util.List

abstract class Busqueda {

	RepositorioRecetas repositorioDeRecetas = RepositorioRecetas.getInstance()

	def List<Receta> filtrar(List<Receta> recetas, Persona persona)

	def List<Receta> recetasQuePuedeVer(Persona unaPersona) {
		repositorioDeRecetas.todasLasRecetas.filter[unaReceta|unaPersona.puedoVerReceta(unaReceta)].toList
	}

	//este seria el metodo para testear, le pasamos solo la persona y la estructura del decorator obtiene la lista general del repo de recetas y luego acá se filtra segun la persona y en los filtros dps
	def List<Receta> doFiltrar(Persona unaPersona) {
		this.filtrar(recetasQuePuedeVer(unaPersona), unaPersona)
	}

}
