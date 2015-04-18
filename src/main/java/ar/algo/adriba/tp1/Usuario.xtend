package ar.algo.adriba.tp1

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Usuario {
	int peso
	double altura
	Sexo sexo
	String nombre
	Fecha fechaDeNacimiento

	List<String> comidaQueLeDisgusta = new ArrayList<String>
	List<Comida> preferenciasAlimentarias = new ArrayList<Comida> //cree la clase comida (cosa que tendria que discutir con ustedes por que hay un par de cosas raras)
	List<CondicionPreexistente> condicionesPreexistentes = new ArrayList<CondicionPreexistente>

	Rutina rutinaUsuario //ejemplo una rutina, de 5 posibles interface
	List<Receta> recetasDelUsuario = new ArrayList<Receta>

	//-------------------------------------------------------------------------------------------
	// parte1 "validar un usuario"
	def boolean usuarioValido() {
		this.camposObligatorios() && this.validacionCondicionesPreexistentes && fechaDeNacimiento.esValida 

	}

	def boolean validacionCondicionesPreexistentes() {
		condicionesPreexistentes.forall[condicion|condicion.validacion(this)]
	}

	def boolean camposObligatorios() {
		peso != 0 && altura != 0 && nombre.length > 4 && this.rutinaUsuario != null
	}

	def tamañoPreferencias() {
		preferenciasAlimentarias.size
	}

	def boolean sexoValido() {
		sexo.esValido()
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
		condicionesPreexistentes.forall[i|i.loSatisface(this)] //ver esto
	}

	def boolean leGustaLaFruta() {
		preferenciasAlimentarias.exists[comida|comida.sosFruta]
	}

	def boolean tenesUnaRutinaActivaIntensivaConEjercicioAdicional() {
		rutinaUsuario.sosActivaIntesivaConEjercicioAdicional()
	}

	def boolean tieneRutinaActiva() {
		rutinaUsuario.sosActiva()
	}

	//------------------------------------------------------------------------------
	//Parte 3 (Recetas)
	def agregarReceta(Receta unaReceta) {
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
		var Receta miReceta = null
		miReceta = new Receta(unaReceta, this)
		this.agregar(miReceta)
		miReceta
	}

	def boolean puedoVerReceta(Receta unaReceta) {
		(unaReceta.usuarioSosDuenio(this)) || (unaReceta.sosPublica())
	}

	def boolean puedoModificarReceta(Receta unaReceta) {
		this.puedoVerReceta(unaReceta)
	}

	def void modificarUnaReceta(Receta unaReceta, Receta unaRecetaConModificaciones){
		if (this.puedoVerReceta(unaReceta)){
			this.EditarReceta(unaReceta, unaRecetaConModificaciones)
		}else{
			throw new Exception("No puede modificar la receta porque es de otro usuario")
		}
	}
	
	def EditarReceta(Receta unaReceta, Receta unaRecetaConModificaciones) {
		if(unaReceta.usuarioSosDuenio(this)){
			unaReceta.setearValores(unaRecetaConModificaciones)
		}else{//si no es publica es privada
			this.modificarUnaReceta(copiar(unaReceta), unaRecetaConModificaciones)
		}
	}
	
	/*def void modificarUnaReceta(Receta unaReceta, Receta unaRecetaConModificaciones) {
		if (unaReceta.usuarioSosDuenio(this)) {
			unaReceta.setearValores(unaRecetaConModificaciones)
		} else if (unaReceta.sosPublica()) {
			this.modificarUnaReceta(copiar(unaReceta), unaRecetaConModificaciones)
		} else {
			throw new Exception("No puede modificar la receta porque es de otro usuario")
		}
	}*/

}
