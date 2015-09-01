package ar.algo.adriba.tp1

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class RepoDificultades {
	static RepoDificultades repositorio = null

	
	List<String> todasLasDificultades = new ArrayList<String>

	
	def getTodasLasDificultades(){
		todasLasDificultades	
	}
	
	public new() {
		todasLasDificultades => [
			add("Dificil")
			add("Facil")
			add("Intermedia")
		]
	}

	static public def RepoDificultades getInstance() {
		if (repositorio == null) {
			repositorio = new RepoDificultades()
		}
      repositorio;
	}}