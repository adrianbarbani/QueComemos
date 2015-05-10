package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Ingrediente extends Comida{
	
	int calorias
	int cantidad
	
	
	new(int unasCalorias, String unNombre, int unaCantidad) {
		calorias = unasCalorias
		nombre = unNombre
		cantidad = unaCantidad
	}

	

}
