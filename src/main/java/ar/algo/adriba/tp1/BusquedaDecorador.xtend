package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
abstract class BusquedaDecorador implements Busqueda {

	Busqueda decorado

	new(Busqueda unaBusqueda) {
		decorado = unaBusqueda
	}

	override recetasQuePuedeVer(Persona unaPersona) {
		decorado.recetasQuePuedeVer(unaPersona)
	}

	override List<Receta> llenarTodasLasRecetas (){
		decorado.llenarTodasLasRecetas
	}
}
