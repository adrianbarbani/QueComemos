package ar.algo.adriba.tp1

import java.util.List
import java.util.HashMap
import java.util.Map

class MonitorDeConsultas {

	int veganosQueConsultaron
	Map<Receta, Integer> recetasMasConsultadasPorMujeres = new HashMap<Receta, Integer>
	Map<Receta, Integer> recetasMasConsultadasPorHombres = new HashMap<Receta, Integer>
	Map<Receta, Integer> recetasMasConsultadas = new HashMap<Receta, Integer>
	public Map<Hora, Integer> cantidadDeConsultasPorHora = new HashMap<Hora, Integer>


	def consultasPor(List<Receta> recetas, Map<Receta, Integer> map) {
		for (Receta receta : recetas) {
			val int valor = map.get(receta)
			map.put(receta, valor + 1)

		}
	}

	def observer(List<Receta> recetas, Persona persona){
		this.consultaVegano(recetas,persona)
		this.consultaDeHora(recetas,persona)
		this.consultaPorSexo(recetas,persona)
		this.masConsultada(recetas,persona)
	}
	
	
	//Monitor 1---------------------------
	def consultaVegano(List<Receta> recetas, Persona persona) {
		if (persona.esVegana && this.consultastePorUnaRecetaDificil(recetas)) {
			veganosQueConsultaron = veganosQueConsultaron + 1
		}

		System.out.println(veganosQueConsultaron + " veganos consultaron recetas dificiles")
	}

	def boolean consultastePorUnaRecetaDificil(List<Receta> recetas) {
		recetas.exists[receta|receta.tuDificultadEs("Dificil")]
	}

	//Monitor 2-------------------------
	def consultaDeHora(List<Receta> recetas, Persona persona) {
		val Hora hour = null // aca va la de hora de ahora
		val int cantidad = cantidadDeConsultasPorHora.get(hour)
		cantidadDeConsultasPorHora.put(hour, cantidad + 1);
	}

	//Monitor 3-------------------------
	def consultaPorSexo(List<Receta> recetas, Persona persona) {
		if (persona.miSexo.equals("Femenino")) { //nunca dice que las consultas las puede hacer un grupo, dejamos que se hagan individualmente por persona
			this.consultasPor(recetas, recetasMasConsultadasPorMujeres)
		} else {
			this.consultasPor(recetas, recetasMasConsultadasPorHombres)
		}
	}

	//Monitor 4----------------------------
	def masConsultada(List<Receta> recetas, Persona persona) {

		this.consultasPor(recetas, recetasMasConsultadas)
	}

	def Receta laMasConsultada() {
		// TODO: hacer este metodo que trae la mas consultada del map
	}

}
