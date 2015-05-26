package ar.algo.adriba.tp1

import queComemos.entrega3.repositorio.BusquedaRecetas
import java.util.List
import queComemos.entrega3.dominio.Dificultad
import queComemos.entrega3.repositorio.RepoRecetas
import com.eclipsesource.json.JsonObject

class InterfazDeConsulta {

	def BusquedaRecetas armarBusqueda(String nombre, Dificultad dificultad, List<String> palabrasClave) {

		val busqueda = new BusquedaRecetas => [
			setNombre(nombre)
			setDificultad(dificultad)
		]

		palabrasClave.forEach[palabra|busqueda.agregarPalabraClave(palabra)]

		busqueda
	}

	def void hacerBusqueda(BusquedaRecetas unaBusqueda) {

		val repositorioRecetas = new RepoRecetas

		repositorioRecetas.getRecetas(unaBusqueda) // armar este parser

	}

	def void /*List<Receta>*/ parserJson(String unStringdeJson) {

		val JsonObject jsonObject = JsonObject.readFrom(unStringdeJson)

		

			/*

		for (List<Receta> receta: jsonObject) {
			
			val List<String> ingredientes = receta.getIngredientes()
			val String nombre = receta.getNombre()
			val int calorias = receta.getTotalCalorias()
			val int tiempo = receta.getTiempoPreparacion()
			val Dificultad dificultad = receta.getDificultadReceta()
			val String autor = receta.getAutor()
			val anioReceta = receta.getAnioReceta()
				*/		
			// luego de parsear cada valor tendriamos que crear una receta con esos valores y añadirla a la lista de resultado
			}

	}

