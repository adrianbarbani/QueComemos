package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.ObserversConsulta
import java.util.List
import java.util.HashMap
import java.util.Map

class ObserverDeLasMasConsultadas extends ObserversConsulta {

	Map<Receta, Integer> recetasMasConsultadas = new HashMap<Receta, Integer>

	override send(List<Receta> recetas, Persona persona) {

		for (Receta receta : recetas) {

			val valor = recetasMasConsultadas.get(receta)
			recetasMasConsultadas.put(receta, valor + 1)

		}

	}

	def Receta laMasConsultada() {
		// TODO: hacer este metodo que trae la mas consultada del map
	}

}