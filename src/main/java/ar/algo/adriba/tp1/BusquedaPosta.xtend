package ar.algo.adriba.tp1

import java.util.List

class BusquedaPosta extends Busqueda {

	Ordenamiento orden
	Persona persona

	new(Persona unaPersona, Ordenamiento unOrden) {

		persona = unaPersona
		orden = unOrden // new CompararPorNombre, new compararPorCalorias

	}


	override filtrar(List<Receta> recetas, Persona persona) {
		orden.ordenar(recetas)
	}

}
