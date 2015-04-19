package ar.algo.adriba.tp1

import java.util.ArrayList
import java.util.Date
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Usuario {
	int peso
	double altura
	Sexo sexo
	String nombre	
	Date fechaDeNacimiento
	Date fechaActual
	//http://yuml.me/edit/e4bc0498 diagrama de clases
	// fecha de nacimiento, no se si no habra alguna clase por defecto que maneje fechas

	List<String> comidaQueLeDisgusta = new ArrayList<String>
	List<Comida> preferenciasAlimentarias = new ArrayList<Comida> //cree la clase comida (cosa que tendria que discutir con ustedes por que hay un par de cosas raras)
	List<CondicionPreexistente> condicionesPreexistentes = new ArrayList<CondicionPreexistente>

	Rutina rutinaUsuario //ejemplo una rutina, de 5 posibles interface
	List<Receta> recetasDelUsuario = new ArrayList <Receta>
	
	new(){
		sexo = new SexoIndefinido //Vamos con este por default
		rutinaUsuario = new RutinaIndeterminada
		}

//-------------------------------------------------------------------------------------------
	// parte1 "validar un usuario"

	def boolean usuarioValido() { 
		this.camposObligatorios() && this.validacionCondicionesPreexistentes //&& this.validacionFecha() 

	}
	
	def rutinaEsValida() { // valido la rutina
		rutinaUsuario.rutinaValida()
	}
	
	def boolean validacionCondicionesPreexistentes() {
		condicionesPreexistentes.forall[condicion|condicion.validacion(this)]}

	def boolean validacionFecha() {
		fechaDeNacimiento.before(fechaActual) //falta fijar el formato para la fecha y el metodo que te de la fecha actual, encontre unos en internet pero me tiraban error

	}

	def boolean validacionVegano() {
		preferenciasAlimentarias.forall[comida|this.noEsCarnivoro(comida)] // preguntar
	}
	
	def boolean noEsCarnivoro(Comida comida) { // ver este metodo por el tema comida lo cambie de esta forma para el punto donde pide "saber si los veganos, si le gusta las frutas"
		(comida.sosCarne == false)
	}

	// recive los strings, hacer clase comida?
	



	def boolean camposObligatorios() { 
		peso != 0 && altura != 0 && nombre.length > 4 && this.rutinaEsValida()
	}


	
	def tamañoPreferencias() {
		preferenciasAlimentarias.size 
	}

	def boolean sexoValido(){
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
		condicionesPreexistentes.forall[i|i.loSatisface(this)]  //ver esto
	}

	def boolean leGustaLaFruta(){
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

	def agregarReceta(Receta unaReceta){
		if (unaReceta.esvalida()==true)
			{
				recetasDelUsuario.add(unaReceta)
			}
		else {
			throw new Exception("No puede agregar la receta porque es invalida ")
		}
			}
	
	def boolean puedoVerReceta(Receta unaReceta){
		(this.esMiReceta(unaReceta)) || (unaReceta.sosPublica())
	}
	
	def boolean puedoModificarReceta(Receta unaReceta){
		(this.esMiReceta(unaReceta)) || (unaReceta.sosPublica())
	}
	
	def boolean esMiReceta(Receta receta) {
		recetasDelUsuario.contains(receta)
	}
	
	
	}
	

	

