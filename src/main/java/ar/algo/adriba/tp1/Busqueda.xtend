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

	// este seria el busquedaPosta osea se testea con: busqueda.new(parametros) y busqueda.filtrar()
	def List<Receta> filtrar() {

		var List<Receta> todasLasRecetasQuePuedeVer = new ArrayList<Receta>

		todasLasRecetasQuePuedeVer = this.recetasQuePuedeVer()

		if (!(filtros.empty)) {
			todasLasRecetasQuePuedeVer = this.pasarPorFiltros(todasLasRecetasQuePuedeVer)
		}

		this.mostrar(todasLasRecetasQuePuedeVer)
	}

	def List<Receta> pasarPorFiltros(List<Receta> recetas) {
		filtros.fold(recetas, [col, filtro|filtro.filtrar(col, persona)]).toList
	}

	def List<Receta> mostrar(List<Receta> unasRecetas) {
		if (orden != null) {
			orden.ordenar(unasRecetas)
		} else {
			unasRecetas
		}

	}

}
