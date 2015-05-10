package ar.algo.adriba.tp1

import java.util.ArrayList
import java.util.List

class Busqueda {

	List<Filtro> filtros = new ArrayList<Filtro>
	Persona persona
	List<Receta> todasLasRecetasQuePuedeVer = new ArrayList<Receta>
	RepositorioRecetas singleton = RepositorioRecetas.getInstance() // esto se supone que es el singleton???

	new(List<Filtro> unosFiltros, Persona unaPersona) {

		filtros = unosFiltros
		persona = unaPersona

	}

	
	//aca necesitamos el singleton de repositorioRecetas
	def List<Receta> recetasQuePuedeVer(Persona unaPersona) {
		
		this.llenarTodasLasRecetas.filter[unaReceta|unaPersona.puedoVerReceta(unaReceta)].toList // estoy tirando cualquiera ?
	}

	def List<Receta> llenarTodasLasRecetas (){
			todasLasRecetasQuePuedeVer=singleton.todasLasRecetas // estoy tirando cualquiera?
	}
	
	def List<Receta> filtrar() {
		if (filtros.empty) {
			todasLasRecetasQuePuedeVer
		} else {
			// Hacer el filtrar en cada filtro y TESTEAR
			filtros.fold(todasLasRecetasQuePuedeVer, [col, filtro|filtro.filtrar(col,persona)]).toList

		}
	}
}