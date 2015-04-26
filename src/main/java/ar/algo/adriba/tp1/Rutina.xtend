package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Rutina {
	
	boolean activa 
	int tiempoDeEjercicio
	
	def boolean sosActivaeIntesiva() {
		this.sosActiva && this.sosIntensiva
	}
	
	def boolean sosIntensiva() {
		tiempoDeEjercicio>30
	}
	
	def boolean sosActiva() {
		activa==true
	}
	
	
}