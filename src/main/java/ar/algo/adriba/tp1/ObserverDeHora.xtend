package ar.algo.adriba.tp1

import java.util.List
import java.util.Map
import java.util.HashMap
import org.joda.time.DateTime // usamos JODA-TIME :)

class ObserverDeHora extends ObserversConsulta {

	public Map<Integer, Integer> cantidadDeConsultasPorHora = new HashMap<Integer, Integer>

	override send(List<Receta> recetas, Persona persona) {
		
		val DateTime dt = new DateTime();
		val int hour = dt.getHourOfDay()  
		val int cantidad = cantidadDeConsultasPorHora.get(hour)
		cantidadDeConsultasPorHora.put(hour,cantidad+1);
		
	}
	
	def int cantidadDeConsultasALaHora(int unaHora){
		
		cantidadDeConsultasPorHora.get(unaHora)
		
	}

}
