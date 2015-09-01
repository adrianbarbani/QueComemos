package ar.algo.adriba.tp1

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class RepoDeTemporadas {
	static RepoDeTemporadas repositorio = null

	List<String> todasLasTemporadas = new ArrayList<String>

	

	public new() {
		todasLasTemporadas => [
			add("Todo el año")
			add("Otoño")
			add("Invierno")
			add("Verano")
			add("Primavera")
		]
	}

	static public def RepoDeTemporadas getInstance() {
		if (repositorio == null) {
			repositorio = new RepoDeTemporadas()
		}
      repositorio;
	}
}
