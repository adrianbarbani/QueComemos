package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import java.util.Date
import java.text.SimpleDateFormat

@Accessors
class Usuario {
	int peso
	double altura
	Sexo sexo
	String nombre	
	Date fechaDeNacimiento
	Date fechaActual
	
	// fecha de nacimiento, no se si no habra alguna clase por defecto que maneje fechas

	List<String> comidaQueLeDisgusta = new ArrayList<String>
	List<String> preferenciasAlimentarias = new ArrayList<String>
	List<CondicionPreexistente> condicionesPreexistentes = new ArrayList<CondicionPreexistente>

	Rutina rutinaUsuario = new SedentariaConAlgoDeEjercicio //ejemplo una rutina, de 5 posibles interface
	List<Receta> recetasDelUsuario = new ArrayList <Receta>
	
	new(){
		sexo = new SexoIndefinido //Vamos con este por default
		}

	def double imc() { 

		this.peso / (this.altura * this.altura) //devuelve el indice de masa corporal
	}



	def boolean usuarioValido() { 
		this.camposObligatorios() && this.validacionCondicionesPreexistentes && this.validacionFecha()//falta lo de la fecha de nacimiento

	}
	
	def boolean validacionCondicionesPreexistentes() {
		condicionesPreexistentes.forall[condicion|condicion.validacion(this)]}

	def boolean validacionFecha() {
		this.fechaDeNacimiento.before(fechaActual) //falta fijar el formato para la fecha y el metodo que te de la fecha actual, encontre unos en internet pero me tiraban error

	}

	def boolean validacionVegano() {
		preferenciasAlimentarias.forall[comida|this.noEsCarnivoro(comida)] // preguntar
	}

	// recive los strings, hacer clase comida?
	def boolean noEsCarnivoro(String comida) {
		comida != 'carne' || comida != 'pollo' || comida != 'chivito' || comida != 'chori'
	}



	def boolean camposObligatorios() {
		// la fecha hay que preguntar y no se como hacer si rutinaUsuario no apunta a nada. 
		peso != 0 && altura != 0 && nombre.length > 4
	}


	
	def tamañoPreferencias() {
		preferenciasAlimentarias.size 
	}

	def boolean sexoValido(){
		sexo.esValido()
	}
	
//--------------------------------------------------------------------------------
	//Parte 2
	
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


}
