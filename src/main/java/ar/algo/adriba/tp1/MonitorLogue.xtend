package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.Monitor
import java.util.List

class MonitorLogue extends Monitor {
	
	override execute(List<Receta> recetas, Persona persona) {
		if(this.cantidadDeRecetas(recetas)>100){
			this.loguear// no se que es loguear 
		}
	}
	
}