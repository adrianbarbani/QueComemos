package ar.algo.adriba.tp1

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

//DIAGRAMA DE CLASES (viejo) -- http://yuml.me/edit/bfbcad0e (Final).
//http://yuml.me/edit/7755799e - nuevo diagrama
@Accessors
class Usuario {
	int peso
	double altura

	//Sexo sexo

	Sexo sexo

	String nombre
	Fecha fechaDeNacimiento

	List<String> comidaQueLeDisgusta = new ArrayList<String>
	List<Ingrediente> preferenciasAlimentarias = new ArrayList<Ingrediente> //cree la clase comida (cosa que tendria que discutir con ustedes por que hay un par de cosas raras)
	List<CondicionPreexistente> condicionesPreexistentes = new ArrayList<CondicionPreexistente>	

	Rutina rutinaUsuario //ejemplo una rutina, de 5 posibles interface
	List<Receta> recetasDelUsuario = new ArrayList<Receta>
	
	//----------- Constructor que valida los datos --------------------------------------------------------------------------------
	new(int unPeso, double unaAltura, Sexo unSexo, String unNombre, Fecha unaFechaDeNacimiento, Rutina unaRutina,
		List<CondicionPreexistente> unasCondicionesPreexistentes, List<Ingrediente> unasPreferenciasAlimentarias) {

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

	// creo el constructor vacio solo para que no se rompan todos los tests, hay que sacarlo despues!
	new() {
		super()
	}

	//-------------------------------------------------------------------------------------------
	// parte1 "validar un usuario"

	def boolean validacionCondicionesPreexistentes() {
		// si no tiene condiciones devuelvo true y ya
		if (condicionesPreexistentes.size == 0) {
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
		if (this.tengoUnaRutinaSaludable) {
			true
		} else {
			throw new Exception("Mi rutina no es saludable")
		}
	}

	def boolean tengoUnaRutinaSaludable() {
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

	
	def boolean leGustaLaFruta() {
		preferenciasAlimentarias.exists[comida|comida.sosFruta]
	}

	def boolean tenesUnaRutinaActivaIntensivaConEjercicioAdicional() {
		rutinaUsuario.sosActivaeIntesiva()
	}

	def boolean tieneRutinaActiva() {
		rutinaUsuario.sosActiva()
	}

	//------------------------------------------------------------------------------
	//Parte 3 (Recetas)
	def agregarReceta(RecetaPrivada unaReceta) {
		if (unaReceta.esvalida() == true) {
			this.copiar(unaReceta)
		} else {
			throw new Exception("No puede agregar la receta porque es invalida ")
		}
	}

	def agregar(Receta unaReceta) {
		recetasDelUsuario.add(unaReceta)
	}

	def Receta copiar(Receta unaReceta) {
		var RecetaPrivada miReceta = null
		miReceta = new RecetaPrivada(unaReceta, this)
		this.agregar(miReceta)
		miReceta
	}

	def boolean puedoVerReceta(Receta unaReceta) {
		(unaReceta.usuarioSosDuenio(this)) || (unaReceta == Receta)
	}

	def boolean puedoModificarReceta(Receta unaReceta) {//a
		if (this.puedoVerReceta(unaReceta)) {
			true
		} else {
			throw new Exception("Esta Receta no puede ser modificada por este usuario")
		}
	}

	def void modificarUnaReceta(Receta unaReceta, Receta unaRecetaConModificaciones) {//Metodo principal
		if (this.puedoModificarReceta(unaReceta)) {
			this.EditarReceta(unaReceta, unaRecetaConModificaciones)
		} else {
			throw new Exception("No puede modificar la receta porque es de otro usuario")
		}
	}

	def EditarReceta(Receta unaReceta, Receta unaRecetaConModificaciones) {
		if (unaReceta.sosPublica==false) {
			unaReceta.setearValores(unaRecetaConModificaciones)
		} else { 
			copiar(unaReceta).setearValores(unaRecetaConModificaciones)		
	}}
	
	def boolean sexoValido() {
		sexo!=null
	}

	
}
