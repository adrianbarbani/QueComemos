package ar.algo.adriba.tp1

import java.util.List
import java.util.ArrayList

class ReglaDeMonitoreo {
	
	List<CondicionACumplir> condiciones = new ArrayList
	List<Accion>acciones = new ArrayList
	
	def evaluar(Busqueda busqueda){
		if (condiciones.forall[condicion|condicion.cumple(busqueda)])
			this.ejecutarAcciones
	}
	
	def ejecutarAcciones() {
		acciones.foreach[accion|accion.execute]
	}
	
	
}