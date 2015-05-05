package ar.algo.adriba.tp1

import java.util.ArrayList
import java.util.List

class Busqueda {

	List<Filtro> filtros = new ArrayList<Filtro>
	Persona persona
	List<Receta> todasLasRecetasQuePuedeVer = new ArrayList<Receta>

	new(List<Filtro> unosFiltros, Persona unaPersona) {

		filtros = unosFiltros
		persona = unaPersona

	}

	//aca necesitamos el singleton de repositorioRecetas
	def List<Receta> recetasQuePuedeVer(Persona unaPersona) {
		todasLasRecetasQuePuedeVer = listarTodas.filter[unaReceta|unUsuario.puedoVerReceta(unaReceta)].toList
	}

	def List<Receta> filtrar() {
		if (filtros.empty) {
			todasLasRecetasQuePuedeVer
		} else {
			// Hacer el filtrar en cada filtro y TESTEAR
			filtros.fold(todasLasRecetasQuePuedeVer, [col, filtro|filtro.filtrar(col)]).toList

		}
	}
}
