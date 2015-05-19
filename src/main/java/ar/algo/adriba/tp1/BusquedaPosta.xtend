package ar.algo.adriba.tp1

import java.util.List

class BusquedaPosta extends Busqueda {

	Ordenamiento orden
	Persona persona

	new(Persona unaPersona, Ordenamiento unOrden) {

		persona = unaPersona
		orden = unOrden // new CompararPorNombre, new compararPorCalorias // armarlo como otro decorator

	}

	new(Persona unaPersona) {

		persona = unaPersona

	}

	override filtrar(List<Receta> recetas, Persona persona) {
		if (orden != null) {
			orden.ordenar(recetas)
		} else {
			recetas
		}
	}

}
