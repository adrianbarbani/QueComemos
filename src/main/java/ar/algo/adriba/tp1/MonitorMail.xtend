package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.Monitor
import java.util.ArrayList
import java.util.List

class MonitorMail extends Monitor {
	
	List<Persona>destinatariosDeMails = new ArrayList<Persona>
		
	override execute(List<Receta> recetas, Persona persona) {
		if (destinatariosDeMails.contains(persona)){
			this.enviarMail(this.cantidadDeRecetas(recetas))// tambien tendria que enviar los parametros de busqueda que no se como se hace
		}
	}
	
}