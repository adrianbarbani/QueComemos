package ar.algo.adriba.tp1

import java.util.List
import java.util.Map
import java.util.HashMap

class ObserverMasConsultadaPorSexo extends ObserversConsulta {

	Map<Receta, Integer> recetasMasConsultadasPorMujeres = new HashMap<Receta, Integer>
	Map<Receta, Integer> recetasMasConsultadasPorHombres = new HashMap<Receta, Integer>

	override send(List<Receta> recetas, Persona persona) {
		if (persona.miSexo == "mujer") { // TODO: hacer el metodo persona.miSexo (no se como se comporta para los grupos de usuarios) y cambiar == por equals antes de que se muera algo
			this.consultasPor(recetas, recetasMasConsultadasPorMujeres)
		} else {
			this.consultasPor(recetas, recetasMasConsultadasPorHombres)
		}
	}

	def consultasPor(List<Receta> recetas, Map<Receta, Integer> map) {
		for (Receta receta : recetas) {
			val int valor = map.get(receta)
			map.put(receta, valor + 1)

		}
	}
// TODO: Hacer metodo para sacar el max 
}
