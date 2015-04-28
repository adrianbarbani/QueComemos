package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Ingrediente {
	int calorias
	String nombre
	int cantidad

	new(int unasCalorias, String unNombre, int unaCantidad) {
		calorias = unasCalorias
		nombre = unNombre
		cantidad = unaCantidad
	}

	def boolean tenes(String unaCosa) {
		nombre.matches(unaCosa)
	}

	def boolean tenesMasDeLimite(int limite) {
		cantidad > limite
	}

}
