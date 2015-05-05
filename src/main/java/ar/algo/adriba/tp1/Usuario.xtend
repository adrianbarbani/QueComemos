package ar.algo.adriba.tp1

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

//http://yuml.me/edit/9f1e3245 - nuevo diagrama -- 
@Accessors
class Usuario implements Persona {
	int peso
	double altura
	Sexo sexo
	String nombre
	Fecha fechaDeNacimiento
	List<String> comidaQueLeDisgusta = new ArrayList<String>
	List<Comida> preferenciasAlimentarias = new ArrayList<Comida>
	List<CondicionPreexistente> condicionesPreexistentes = new ArrayList<CondicionPreexistente>
	Rutina rutinaUsuario //ejemplo una rutina, de 5 posibles interface
	List<Receta> recetasDelUsuario = new ArrayList<Receta>

	//------------entrega2---------------
	List<GrupoDeUsuario> grupos = new ArrayList<GrupoDeUsuario> // coleccion de grupos de los que soy miembro.

	//----------- Constructor que valida los datos --------------------------------------------------------------------------------
	new(int unPeso, double unaAltura, Sexo unSexo, String unNombre, Fecha unaFechaDeNacimiento, Rutina unaRutina,
		List<CondicionPreexistente> unasCondicionesPreexistentes, List<Comida> unasPreferenciasAlimentarias) {

		this => [
			peso = unPeso
			altura = unaAltura
			sexo = unSexo
			nombre = unNombre
			fechaDeNacimiento = unaFechaDeNacimiento
			rutinaUsuario = unaRutina
			condicionesPreexistentes = unasCondicionesPreexistentes
			preferenciasAlimentarias = unasPreferenciasAlimentarias
		]

		if (validacionPeso() == false)
			throw new Exception("El peso debe ser distinto de 0")

		if (validacionAltura() == false)
			throw new Exception("La altura debe ser distinta de 0")

		if (validacionRutina() == false)
			throw new Exception("La rutina no fue ingresada")

		if (validacionNombre() == false)
			throw new Exception("El nombre debe tener un minimo de 5 caracteres")

		if (validacionCondicionesPreexistentes() == false)
			throw new Exception("ERROR: condiciones Preexistentes no validas")

	}

	//-------------------------------------------------------------------------------------------
	// parte1 "validar un usuario"
	def boolean validacionCondicionesPreexistentes() {

		// si no tiene condiciones devuelvo true y ya
		if (notengocondiciones()) {
			true
		} else {
			condicionesPreexistentes.forall[condicion|condicion.validacion(this)]
		}
	}

	//===============================================================
	// validacion de Datos Obligatorios
	def boolean validacionPeso() {
		peso != 0
	}

	def boolean validacionAltura() {
		altura != 0
	}

	def boolean validacionNombre() {
		nombre.length > 4
	}

	def boolean validacionRutina() {
		rutinaUsuario != null
	}

	//================================================================
	def int tamañoPreferencias() {
		preferenciasAlimentarias.size
	}

	//--------------------------------------------------------------------------------
	//Parte 2
	def double imc() {
		this.peso / (this.altura * this.altura) //devuelve el indice de masa corporal
	}

	def boolean sigoRutinaSaludable() {
		this.imcenrango() && (this.notengocondiciones() || this.puedosubsanar())
	}

	def boolean imcenrango() {
		this.imc() > 18 && this.imc() < 30
	} //me dice si el imc esta en el rango de 18 a 30

	def boolean notengocondiciones() {
		condicionesPreexistentes.empty
	} //me dice si no tengo condiciones preexistentes (si la coleccion esta vacia)

	def boolean puedosubsanar() {
		condicionesPreexistentes.forall[i|i.loSatisface(this)]
	}

	def boolean tenesUnaRutinaActivaIntensivaConEjercicioAdicional() {
		rutinaUsuario.sosActivaeIntesiva()
	}

	def boolean tieneRutinaActiva() {
		rutinaUsuario.sosActiva()
	}

	//------------------------------------------------------------------------------
	//Parte 3 (Recetas)
	// Primero chequeamos si es valida la receta.
	def agregarReceta(Receta unaReceta) {
		if (unaReceta.esvalida() == true) {
			this.copiar(unaReceta)
		} else {
			throw new Exception("No puede agregar la receta porque es invalida ")
		}
	}

	// Si es valida, la copiamos en una variable local que llama al constructor de recetas privadas.
	def Receta copiar(Receta unaReceta) {
		var Receta miReceta = null
		miReceta = new Receta(unaReceta, this)
		this.agregar(miReceta)
		miReceta
	}

	// Finalmente, agregamos la receta a la coleccion de recetas del usuario.
	def agregar(Receta unaReceta) {
		recetasDelUsuario.add(unaReceta)
	}

	// Un usuario puede ver una receta si es de el, si es publica, o si es de alguien de su/s grupo/s
	def boolean puedoVerReceta(Receta unaReceta) {
		if ((this.usuarioTiene(unaReceta)) || (unaReceta.sosPublica) || (this.alguienDelGrupoConoce(unaReceta))) {
			true
		} else {
			throw new Exception("Esta Receta no puede ser vista por este usuario")
		}
	}

	// Chequea si el usuario tiene una receta en su colección
	def boolean usuarioTiene(Receta receta) { // reemplaza a usuario sos duenio en receta
		recetasDelUsuario.contains(receta)
	}

	// Chequea si alguien de un grupo tiene una receta
	def boolean alguienDelGrupoConoce(Receta receta) {
		grupos.exists[grupo|grupo.integranteEsDuenio(receta)]
	}

	// Un usuario puede modificar la receta si es publica o si es de el
	def boolean puedoModificarReceta(Receta unaReceta) {
		this.usuarioTiene(unaReceta) || unaReceta.sosPublica
	}

	// Un usuario modifica una receta. 
	def void modificarUnaReceta(Receta unaReceta, Receta unaRecetaConModificaciones) {

		//  Primero vemos si la puede modificar		
		if (puedoModificarReceta(unaReceta)) {

			// Si es de el la modifica de una
			if (this.usuarioTiene(unaReceta)) {
				unaReceta.setearValores(unaRecetaConModificaciones)
			} else {

				// Si no es de el, y es publica, primero la copia a su coleccion de recetas y luego la modifica
				this.modificarUnaRecetaPublica(unaReceta, unaRecetaConModificaciones)
			}
		} 	// Y si es de otro usuario no puede modificarla.
		else {
			throw new Exception("No puede modificar la receta porque es de otro usuario")
		}
	}

	def modificarUnaRecetaPublica(Receta unaReceta, Receta unaRecetaConModificaciones) {
		this.modificarUnaReceta(this.agregarReceta(unaReceta), unaRecetaConModificaciones)
	}

	//****************************ENTREGA 2**************************************
	override aceptasSugerencia(Receta receta) {
		true //ver
	}
}
