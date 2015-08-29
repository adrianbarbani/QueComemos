package ar.algo.adriba.tp1

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepoDeCondiciones  {

	static RepoDeCondiciones repositorio = null

	public List<CondicionPreexistente> todasLasCondiciones = new ArrayList<CondicionPreexistente>

	private new() {
		todasLasCondiciones => [
			add(new Hipertenso)
			add(new Vegano)
			add(new Celiaco)
			add(new Diabetico)
		]
	}

	static public def RepoDeCondiciones getInstance() {
		if (repositorio == null) {
			repositorio = new RepoDeCondiciones()
		}
      repositorio;
	}

}
