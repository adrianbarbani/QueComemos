package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class BusquedaDecorador extends Busqueda {

	Busqueda decorado

	new(Busqueda unaBusqueda) {
		decorado = unaBusqueda
	}

}
