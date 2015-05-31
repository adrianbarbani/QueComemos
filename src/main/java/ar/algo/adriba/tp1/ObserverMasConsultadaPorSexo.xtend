package ar.algo.adriba.tp1

import java.util.List
import java.util.Map
import java.util.HashMap

class ObserverMasConsultadaPorSexo extends ObserversConsulta {

	Map<Receta, Integer> recetasMasConsultadasPorMujeres = new HashMap<Receta, Integer>
	Map<Receta, Integer> recetasMasConsultadasPorHombres = new HashMap<Receta, Integer>

	override send(List<Receta> recetas, Persona persona) {
		if (persona.miSexo.equals("Femenino")) {  //nunca dice que las consultas las puede hacer un grupo, dejamos que se hagan individualmente por persona
			super.consultasPor(recetas, recetasMasConsultadasPorMujeres)
		} else {
			super.consultasPor(recetas, recetasMasConsultadasPorHombres)
		}
	}

// TODO: Hacer metodo para sacar el max 
}
