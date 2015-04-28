package ar.algo.adriba.tp1

class Comida {
	
	public String nombre
	
	new(String unNombre) {
		nombre = unNombre
	}
	
	new(){}
	
	def boolean tenes(String unaCosa) {
		nombre.matches(unaCosa)
	}
	
}