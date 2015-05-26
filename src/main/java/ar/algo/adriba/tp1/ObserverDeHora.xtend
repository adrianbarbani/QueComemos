package ar.algo.adriba.tp1

import java.util.List
import java.util.Map
import java.util.HashMap

class ObserverDeHora extends ObserversConsulta {

	public Map<Hora, Integer> cantidadDeConsultasPorHora = new HashMap<Hora, Integer>

	override send(List<Receta> recetas, Persona persona) {
		
		val Hora hour = null // aca va la de hora de ahora
		val int cantidad = cantidadDeConsultasPorHora.get(hour)
		cantidadDeConsultasPorHora.put(hour,cantidad+1);
		
	}

}
