package ar.algo.adriba.tp1

import java.util.ArrayList
import java.util.List

class Busqueda {

	List<Filtro> filtros = new ArrayList<Filtro>
	Ordenamiento orden
	Persona persona
	RepositorioRecetas repositorioDeRecetas = RepositorioRecetas.getInstance()
	List<ObserversConsulta> observers = new ArrayList<ObserversConsulta>
	MonitorDeConsultas monitor = new MonitorDeConsultas // forma alternativa

	new(List<Filtro> unosFiltros, Persona unaPersona, Ordenamiento unOrden) {
		filtros = unosFiltros
		persona = unaPersona
		orden = unOrden
	}

	new(List<Filtro> unosFiltros, Persona unaPersona) {
		filtros = unosFiltros
		persona = unaPersona
		orden = new DefaultOrden
	}

	new(Persona unaPersona) {
		persona = unaPersona
		filtros = new ArrayList<Filtro>
		orden = new DefaultOrden
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

		observers.forEach[observer|observer.send(pasarPorFiltros(recetasQuePuedeVer()), persona)] // habia un loop infinito :P

	}

	def List<Receta> pasarPorFiltros(List<Receta> recetas) {
		filtros.fold(recetas, [col, filtro|filtro.filtrar(col, persona)]).toList
	}

	def List<Receta> mostrar(List<Receta> unasRecetas) {
		orden.ordenar(unasRecetas)

	}

	//------Forma alternativa
	def List<Receta> filtrarAlternativo() {
		monitor.observer(pasarPorFiltros(recetasQuePuedeVer()), persona) // rescatando otro loop infinito
		this.mostrar(pasarPorFiltros(recetasQuePuedeVer()))
	}

}
