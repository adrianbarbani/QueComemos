package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class GrupoDeUsuario extends Persona {

	List<String> preferenciasAlimenticiasGrupal = new ArrayList<String>
	List<Usuario> integrantes = new ArrayList<Usuario>

	new(String unNombre, List<Usuario> unaListaDeIntegrantes, List<String> unaListaDePreferencias) {
		nombre = unNombre
		integrantes = unaListaDeIntegrantes
		preferenciasAlimenticiasGrupal = unaListaDePreferencias
		sexo = Sexo.DEFAULT
	}

	//****************************ENTREGA 2**************************************
	override puedoVerReceta(Receta receta) {
		integrantes.exists[usuario|usuario.puedoVerReceta(receta)]
	}

	override mePuedeGustar(Receta unaReceta) {
		this.preferenciasAlimenticiasGrupal.exists[comida|unaReceta.tenes(comida)]
	}

	override esAptaParaMi(Receta unaReceta) {
		integrantes.forall[integrante|integrante.esAptaParaMi(unaReceta)]

	}

	def double imcPromedio() {
		this.imcIntegrantes / this.cantidadDeIntegrantes
	}

	def int cantidadDeIntegrantes() {
		integrantes.size
	}

	def double imcIntegrantes() {
		integrantes.fold(0.0, [acum, integrante|acum + integrante.imc]) // ver
	}

	override tieneSobrepeso() {
		this.imcPromedio() > 30
	}

	override esVegana() {
		integrantes.forall[usuario|usuario.esVegana()]
	}

	override marcarTodoComoFavorito() {
		false
	}

	override marcarComoFavorita(Receta receta) {
		throw new Exception("No se puede llegar nunca hasta aca, igual no se puede agregar fav en grupo de usuario")
	}

	override es(String unNombre) {
		nombre.matches(unNombre)
	}
	
	
}
