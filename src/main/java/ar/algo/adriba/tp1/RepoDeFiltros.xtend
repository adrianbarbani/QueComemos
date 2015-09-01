package ar.algo.adriba.tp1

import java.util.ArrayList
import java.util.List

class RepoDeFiltros {
	static RepoDeFiltros repositorio = null

	public List<Filtro> todosLosFiltros = new ArrayList<Filtro>

	private new() {
		todosLosFiltros => [
			add(new FiltroCondicionesPreexistentes)
			add(new FiltroDeCalorias)
			add(new FiltroDeIngredientesCaros)
			add(new FiltroPorGusto)
		]
	}

	static public def RepoDeFiltros getInstance() {
		if (repositorio == null) {
			repositorio = new RepoDeFiltros()
		}
      repositorio;
	}
	}