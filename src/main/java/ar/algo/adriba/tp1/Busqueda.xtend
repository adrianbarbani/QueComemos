package ar.algo.adriba.tp1

import java.util.ArrayList
import java.util.List

class Busqueda {

	List<Filtro> filtros = new ArrayList<Filtro>
	Ordenamiento orden
	Persona persona
	RepositorioRecetas repositorioDeRecetas = RepositorioRecetas.getInstance()

	new(List<Filtro> unosFiltros, Persona unaPersona, Ordenamiento unOrden) {
		filtros = unosFiltros
		persona = unaPersona
		orden = unOrden // new CompararPorNombre, new compararPorCalorias
	}

	def List<Receta> recetasQuePuedeVer(Persona unaPersona) {
		repositorioDeRecetas.todasLasRecetas.filter[unaReceta|unaPersona.puedoVerReceta(unaReceta)].toList // estoy tirando cualquiera ?
	}

	// este seria el busquedaPosta osea se testea con: busqueda.new(parametros) y busqueda.filtrar()
	def List<Receta> filtrar() {

		var List<Receta> todasLasRecetasQuePuedeVer = new ArrayList<Receta>
		todasLasRecetasQuePuedeVer = recetasQuePuedeVer(persona)

		if (!(filtros.empty)) {
			todasLasRecetasQuePuedeVer = pasarPorFiltros(todasLasRecetasQuePuedeVer)
		}
		this.mostrar(todasLasRecetasQuePuedeVer)
	}

	def pasarPorFiltros(List<Receta> recetas) {
		filtros.fold(recetas, [col, filtro|filtro.filtrar(col, persona)]).toList
	}

	def List<Receta> mostrar(List<Receta> unasRecetas) {
		orden.ordenar(unasRecetas)
	}

}
