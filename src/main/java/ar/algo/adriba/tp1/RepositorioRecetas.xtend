package ar.algo.adriba.tp1

import java.util.List
import java.util.ArrayList

public class RepositorioRecetas implements Repositorio {
	
	public List<Receta> listarTodas = new ArrayList<Receta>

	static RepositorioRecetas repositorio = null

	Comida prepizza = new Comida(0, "Prepizza", 1)
	Comida queso = new Comida(0, "Muzzarella", 200)
	Comida salsaDeTomate = new Comida(0, "Salsa de tomate", 200)
	Comida jamon = new Comida(0, "Jamon", 100)
	Comida oregano = new Comida(100, "Oregano", 0)
	Comida azucar = new Comida(0, "azucar", 200)
	
	private new() {
				
	}

	static public def RepositorioRecetas getInstance() {
		if (repositorio == null) {
			repositorio = new RepositorioRecetas()
		}
      repositorio;
	}

	def void agregar(Receta unaReceta) {
		listarTodas.add(unaReceta)
	}

	def void quitar(Receta unaReceta) {
		listarTodas.remove(unaReceta)
	}

	override List<Receta> todasLasRecetas() {
		listarTodas.toList
	}

	def void limpiar() {
		listarTodas.clear
	}
	
}
