package ar.algo.adriba.tp1

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Busqueda {

	List<Filtro> filtros = new ArrayList<Filtro>
	Ordenamiento orden = new DefaultOrden
	Persona persona
	Repositorio repositorioDeRecetas = RepositorioRecetas.getInstance()
	List<ObserversConsulta> observers = new ArrayList<ObserversConsulta>
	List<Monitor> acciones = new ArrayList<Monitor>

	new(List<Filtro> unosFiltros, Persona unaPersona, Ordenamiento unOrden, Repositorio unRepo) {
		filtros = unosFiltros
		persona = unaPersona
		orden = unOrden
		repositorioDeRecetas = unRepo
		this.agregarObservers()
	}

	new(List<Filtro> unosFiltros, Persona unaPersona, Ordenamiento unOrden) {
		filtros = unosFiltros
		persona = unaPersona
		orden = unOrden
		this.agregarObservers()
	}

	new(List<Filtro> unosFiltros, Persona unaPersona) {
		filtros = unosFiltros
		persona = unaPersona
		this.agregarObservers()
	}

	new(Persona unaPersona) {
		persona = unaPersona
		this.agregarObservers()
	}

	new(Persona unaPersona, Repositorio unRepo) {
		persona = unaPersona
		repositorioDeRecetas = unRepo
		this.agregarObservers()//asd
	}
	
	new(Persona unaPersona, Repositorio unRepo, Ordenamiento unOrden) {
		orden= unOrden
		persona = unaPersona
		repositorioDeRecetas = unRepo
		this.agregarObservers()
	}
	new(Persona unaPersona, Repositorio unRepo, List<Filtro> unosFiltros) {
		filtros= unosFiltros
		persona = unaPersona
		repositorioDeRecetas = unRepo
		this.agregarObservers()
	}
	
	

	def void agregarObservers() {
		observers => [
			add(ObserverDeLasMasConsultadas.getInstance())
			add(ObserverDeHora.getInstance())
			add(ObserverConsultaVegano.getInstance())
			add(ObserverMasConsultadaPorSexo.getInstance())
		]

	}

	def List<Receta> recetasQuePuedeVer() {
		repositorioDeRecetas.todasLasRecetas().filter[unaReceta|persona.puedoVerReceta(unaReceta)].toList
	}

	// busqueda posta
	def List<Receta> filtrar() {
		this.loguear()
		this.ejecutarAcciones()
		this.mostrar(pasarPorFiltros(recetasQuePuedeVer()))
	}

	def void ejecutarAcciones() {
		acciones.forEach[accion|accion.execute((pasarPorFiltros(recetasQuePuedeVer())), persona, filtros)]
	}

	def void loguear() {
		observers.forEach[observer|observer.send(pasarPorFiltros(recetasQuePuedeVer()), persona)]
	}

	def List<Receta> pasarPorFiltros(List<Receta> recetas) {
		filtros.fold(recetas, [col, filtro|filtro.filtrar(col, persona)]).toList
	}

	def List<Receta> mostrar(List<Receta> unasRecetas) {
		orden.ordenar(unasRecetas)

	}
	
	def buscarReceta(String nombre, String dificultad, String temporada, String ingrediente, int caloriaDesde, int caloriaHasta) {
		pasarPorFiltros(this.recetasQuePuedeVer.filter[receta|
			this.match(nombre, receta.nombre) && this.match(dificultad, receta.dificultad) && this.match(temporada, receta.temporada) && this.contiene(ingrediente,receta) && 
			this.tieneMasCalorias(caloriaDesde, receta) && this.tieneMenosCalorias(caloriaHasta, receta)
		].toList)//ver lo de los filtros
	}
	
	def tieneMenosCalorias(int i, Receta receta) {
		if (i==0){
			true
		}else{
			i>receta.caloriasReceta
		}
	}
	
	def boolean tieneMasCalorias(int i, Receta receta) {
		if (i==0){
			true
		}else{
			i<receta.caloriasReceta
		}
	}
					
	def contiene(String ingrediente, Receta receta) {
		if(ingrediente == null){
			return true
		}else{
		receta.tenes(ingrediente)
		
		}
	}

	def match(Object expectedValue, Object realValue) {
		if (expectedValue == null) {
			return true
		}
		if (realValue == null) {
			return false
		}
		realValue.toString().toLowerCase().contains(expectedValue.toString().toLowerCase())
	}
}


