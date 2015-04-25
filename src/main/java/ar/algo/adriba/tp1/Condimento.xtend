package ar.algo.adriba.tp1

class Condimento {
	
	String nombre
	int cantidad
	
	
	def boolean sosSaloCaldo() {
		nombre == "Sal" || nombre == "Caldo"
	}
	
	def boolean sosAzucarYtenesMasDe100gr() {
		if(nombre == "Azucar"){
			cantidad>100
		}else{false}
	}
	

	
}