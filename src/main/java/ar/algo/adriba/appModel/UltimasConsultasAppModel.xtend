package ar.algo.adriba.appModel

import ar.algo.adriba.tp1.Busqueda
import ar.algo.adriba.tp1.MostrarLosPrimerosDiez
import ar.algo.adriba.tp1.Receta
import ar.algo.adriba.tp1.RepositorioRecetas
import ar.algo.adriba.tp1.Usuario
import java.util.List

class UltimasConsultasAppModel {
		//Hardcodeo un usuario

	Receta recetaSeleccionada
	List<Receta> resultados = newArrayList
	List<Receta> ultimasConsultadas = newArrayList
	boolean filtrosAplicados = false
	String descripcion
	String nombre
	String dificultadSeleccionada
	String temporadaSeleccionada
	String ingredienteABuscar
	int caloriasDesde
	int caloriasHasta
	Usuario usuario
	
	new(Usuario usuario) {
		this.usuario = usuario
	}

	def void todasLasRecetas() {
		resultados = new Busqueda(usuario, RepositorioRecetas.getInstance, new MostrarLosPrimerosDiez).filtrar
		descripcion = "estas son las mas consultadas"
	}

	def marcarComoFavorita() {
		usuario.marcarComoFavorita(recetaSeleccionada)
	}
	
	def void recetasFavoritas() {
		resultados = usuario.recetasFavoritas
		descripcion = "Estas son tus recetas Favoritas"
	}
	
	def initSearch() {
		this.recetasFavoritas
		if (resultados.empty)
		this.mostrarUltimasRecetasConsultadas
		if (resultados.empty)
		this.todasLasRecetas
	}
	
	def agregarRecetaVista() {
		ultimasConsultadas.add(recetaSeleccionada)
	}
	
	def void mostrarUltimasRecetasConsultadas(){
		resultados = ultimasConsultadas
		descripcion = "Estas Fueron las ultimas recetas que mas consultaste"
	}
	
	def void buscar() {
		resultados= new Busqueda(usuario, RepositorioRecetas.getInstance,filtros).buscarReceta(nombre, dificultadSeleccionada, temporadaSeleccionada, ingredienteABuscar, caloriasDesde, caloriasHasta)
	}
	
	def filtros() {
		if(filtrosAplicados) usuario.filtrosPerfilUsuario else newArrayList
	}
	
	def void clear(){
		nombre=null
		dificultadSeleccionada= null
		temporadaSeleccionada= null
		ingredienteABuscar=null
		caloriasDesde=0
		caloriasHasta=0
	}
}