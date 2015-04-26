package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.Receta
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RecetaPrivada extends Receta {
	Usuario duenioReceta

	new(RecetaPrivada unaReceta, Usuario unUsuario) {
		this.setearValores(unaReceta)
		this.duenioReceta = unUsuario
	}

	def void setearValores(Receta unaReceta) {
		this => [
		nombreDelPlato = unaReceta.nombreDelPlato
		ingredientes = unaReceta.ingredientes
		condimentos = unaReceta.condimentos
		explicacionDeLaPreparacion = unaReceta.explicacionDeLaPreparacion
		caloriasReceta = unaReceta.caloriasReceta 
		dificultad = unaReceta.dificultad
		temporada = unaReceta.temporada
		subRecetas = unaReceta.subRecetas
		]
	}
	
	override boolean usuarioSosDuenio(Usuario unUsuario) {
		unUsuario == duenioReceta
		}
		
}
