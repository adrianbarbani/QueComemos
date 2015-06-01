package ar.algo.adriba.tp1

import java.util.List

class ObserverConsultaVegano extends ObserversConsulta {

	int veganosQueConsultaron

	override send(List<Receta> recetas, Persona persona) {
		if (persona.esVegana && this.consultastePorUnaRecetaDificil(recetas)) {
			veganosQueConsultaron = veganosQueConsultaron + 1
		}

	// mejor no imprimir cosas en el codigo
	//System.out.println(veganosQueConsultaron + " veganos consultaron recetas dificiles") 
	}

	def boolean consultastePorUnaRecetaDificil(List<Receta> recetas) {
		recetas.exists[receta|receta.tuDificultadEs("Dificil")]
	}

	def int cantidadDeVeganosQueConsultaronRecetasDificiles() {

		veganosQueConsultaron

	}

}
