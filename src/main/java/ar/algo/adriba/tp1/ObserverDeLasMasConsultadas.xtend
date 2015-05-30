package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.ObserversConsulta
import java.util.List
import java.util.HashMap
import java.util.Map

class ObserverDeLasMasConsultadas extends ObserversConsulta {

	Map<Receta, Integer> recetasMasConsultadas = new HashMap<Receta, Integer>

	override send(List<Receta> recetas, Persona persona) {
		
		super.consultasPor(recetas, recetasMasConsultadas)
	}

	def Receta laMasConsultada() {
		// TODO: hacer este metodo que trae la mas consultada del map
	}

}
