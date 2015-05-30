package ar.algo.adriba.tp1

import java.util.List

class ObserverConsultaVegano extends ObserversConsulta {

int veganosQueConsultaron 
	
	override send(List<Receta> recetas, Persona persona) {
		if (persona.esVegana && this.consultastePorUnaRecetaDificil(recetas)){
			veganosQueConsultaron = veganosQueConsultaron +1 
		}
	}
	
	def consultastePorUnaRecetaDificil(List <Receta> recetas) {
		recetas.exists[receta|receta.tuDificultadEs("dificil")]
	}
	
}