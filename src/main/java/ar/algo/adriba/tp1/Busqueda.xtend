package ar.algo.adriba.tp1

import java.util.ArrayList
import java.util.List

class Busqueda {

	List<Filtro> filtros = new ArrayList<Filtro>
	Ordenamiento orden
	Persona persona
	RepositorioRecetas repositorioDeRecetas = RepositorioRecetas.getInstance()
	List<ObserversConsulta> observers = new ArrayList<ObserversConsulta>

	new(List<Filtro> unosFiltros, Persona unaPersona, Ordenamiento unOrden) {
		filtros = unosFiltros
		persona = unaPersona
		orden = unOrden
	}

	new(List<Filtro> unosFiltros, Persona unaPersona) {
		filtros = unosFiltros
		persona = unaPersona
	}

	new(Persona unaPersona) {
		persona = unaPersona
	}

	def List<Receta> recetasQuePuedeVer() {
		repositorioDeRecetas.todasLasRecetas().filter[unaReceta|persona.puedoVerReceta(unaReceta)].toList
	}

	// busqueda posta
	def List<Receta> filtrar() {
		this.loguear()
		this.mostrar(pasarPorFiltros(recetasQuePuedeVer()))
	}

	def void loguear() {

		observers.forEach[observer|observer.send(filtrar(), persona)]

	}

	def List<Receta> pasarPorFiltros(List<Receta> recetas) {
		filtros.fold(recetas, [col, filtro|filtro.filtrar(col, persona)]).toList
	}

	// TODO: aremar un ordenamiento x default
	def List<Receta> mostrar(List<Receta> unasRecetas) {
		if (orden != null) {
			orden.ordenar(unasRecetas)
		} else {
			unasRecetas
		}

	}

}
