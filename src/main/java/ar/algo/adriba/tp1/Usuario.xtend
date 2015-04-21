package ar.algo.adriba.tp1

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

//DIAGRAMA DE CLASES -- http://yuml.me/edit/bfbcad0e (Final).
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
		this.camposObligatorios() && this.condicionesPreexistentesError && fechaDeNacimiento.esValida 

	}

	def boolean condicionesPreexistentesError (){
		if (this.validacionCondicionesPreexistentes == true){
			true
		}else{
			throw new Exception("ERROR: condiciones Preecistentes no validas")
		}
	}
	
	def boolean validacionCondicionesPreexistentes() {
		condicionesPreexistentes.forall[condicion|condicion.validacion(this)]
	}

	def boolean camposObligatorios() {
		this.validacionPeso/*peso!=0 */ && this.validacionAltura/*altura!=0*/ && this.validacionDeNombre/*nombre.length > 4*/ && this.rutinaUsuario != null
	}
	

	
//===============================================================
// validacion de def camposObligatorios()	
	def validacionAltura() {
		if (altura != 0){
			true
		}else{
			throw new Exception("La altura debe ser distinta de 0")
		}
	}
	
	def boolean validacionPeso() { 
		if (peso != 0){
			true
		}else{
			throw new Exception("El peso de una persona debe ser mayor que 0")
		}
	}
	
	def validacionDeNombre() {
		if (nombre.length > 4){
			true
		}else{
			throw new Exception("El nombre debe tener un minimo de 5 caracteres")
		}
	}
//================================================================
	def tamañoPreferencias() {
		preferenciasAlimentarias.size
	}

	def boolean sexoValido() {
		if (sexo != null){
			true
		}else{
			throw new Exception("Indique un sexo")
		}
	}

	//--------------------------------------------------------------------------------
	//Parte 2
	def double imc() {

		this.peso / (this.altura * this.altura) //devuelve el indice de masa corporal
	}

	def boolean sigoRutinaSaludable() {
		if(this.tengoUnaRutinaSaludable){
			true
		}else{throw new Exception("Mi rutina no es saludable")}
	}
	
	def boolean tengoUnaRutinaSaludable (){
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
		if (this.puedoVerReceta(unaReceta)){
			true
		}else{throw new Exception("Esta Receta no puede ser modificada por este usuario")}
	}

	def void modificarUnaReceta(Receta unaReceta, Receta unaRecetaConModificaciones){
		if (this.puedoModificarReceta(unaReceta)){
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
	

}
