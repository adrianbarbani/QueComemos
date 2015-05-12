package ar.algo.adriba.tp1

import java.util.ArrayList
import java.util.List

class BusquedaPosta implements Busqueda{

	
	Ordenamiento orden
	Persona persona
	List<Receta> todasLasRecetasQuePuedeVer = new ArrayList<Receta>
	RepositorioRecetas singleton = RepositorioRecetas.getInstance() // esto se supone que es el singleton???

	new(Persona unaPersona, Ordenamiento unOrden) {

		
		persona = unaPersona
		orden = unOrden // new CompararPorNombre, new compararPorCalorias

	}

	
	//aca necesitamos el singleton de repositorioRecetas
	override List<Receta> recetasQuePuedeVer(Persona unaPersona) {
		this.llenarTodasLasRecetas.filter[unaReceta|unaPersona.puedoVerReceta(unaReceta)].toList // estoy tirando cualquiera ?
	}

	override List<Receta> llenarTodasLasRecetas (){
			todasLasRecetasQuePuedeVer=singleton.todasLasRecetas // estoy tirando cualquiera?
	}
	

	
	override filtrar(List<Receta> recetas, Persona persona) {
		orden.ordenar(recetas)
	}
	
	//armar metodo busquedaposta
	
}
