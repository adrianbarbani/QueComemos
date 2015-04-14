package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import java.util.Date

@Accessors
class Usuario {
	int peso
	double altura
	Sexo sexo
	String nombre
	Date fechaDeNacimiento
	
	// fecha de nacimiento, no se si no habra alguna clase por defecto que maneje fechas
	List<String> comidaQueLeDisgusta = new ArrayList<String>
	List<String> preferenciasAlimentarias = new ArrayList<String>
	List<CondicionPreexistente> condicionesPreexistentes = new ArrayList<CondicionPreexistente>

	Rutina rutinaUsuario = new SedentariaConAlgoDeEjercicio //ejemplo una rutina, de 5 posibles interface
	List<Receta> recetasDelUsuario
	
	new(String nombre, int peso, double altura, Date fechaDeNacimiento, Rutina rutinaUsuario){
		sexo = new SexoIndefinido //Vamos con este por default
		
	}

	def double imc() { // agregue el tipo

		this.peso / (this.altura * this.altura) //devuelve el indice de masa corporal
	}


	def boolean usuarioValido() { //validar el constructor
		this.camposObligatorios() && this.validacionDiabetico() && this.validacionVegano() && this.validacionHipertenso() // falta lo de la fecha de nacimiento

	}

	def boolean validacionVegano() {
		preferenciasAlimentarias.forall[Comida|noescarnivora(Comida)] // preguntar
	}

	// esto deberia estar en una clase comida, despues vemos
	def boolean noescarnivora(String Comida) {
		Comida != 'carne' || Comida != 'pollo' || Comida != 'chivito' || Comida != 'chori'
	}


	def boolean validacionDiabetico() {
		if (this.esDiabetico()) {
			this.validacionSexo()
			this.tamañoPreferencias() > 0
		} else {
			true
		}
	}


	def boolean validacionSexo() { // hacer una clase genero con una interface y que tenga por defecto un indefinido
		this.sexo == 'f' || this.sexo == 'm' || this.sexo == 'F' || this.sexo == 'M'

	}

	def boolean camposObligatorios() {
		//editar a futuro
		// agregué que mida los caracteres del nombre
		// la fecha hay que preguntar y no se como hacer si rutinaUsuario no apunta a nada. a y preguntar por &&
		this.peso != 0 && this.altura != 0 && this.nombre.length > 4
	}

// seguir con "si el usuario es hipertenso o diabético, debe indicar al menos una preferencia"
	
		def tamañoPreferencias() {
		preferenciasAlimentarias.size 
	}

	def boolean esDiabetico() {
		condicionesPreexistentes.contains("Diabetico")

	}
	
		def boolean validacionHipertenso(){
		if (this.esHipertenso()){
			this.tamañoPreferencias() > 0
		}else{
			true
		}
	}
	
	def boolean esHipertenso() {
		condicionesPreexistentes.contains("Hipertenso")
	}
	


	//Parte 2
	def boolean sigoRutinaSaludable() {
		(this.imcenrango()) && ((this.notengocondiciones()) || this.puedosubsanar())
	} //falta el metodo de subsanar que depende de cada condicion, vemos como hacemos 

	def boolean imcenrango() {
		this.imc() > 18 && this.imc() < 30
	} //me dice si el imc esta en el rango de 18 a 30

	def boolean notengocondiciones() {
		condicionesPreexistentes.empty
	} //me dice si no tengo condiciones preexistentes (si la coleccion esta vacia)

	def boolean puedosubsanar() { // se hace con un forall pero no sé qué estabas queriendo hacer :D
		condicionesPreexistentes.forall[i|i.loSatisface(this)] //  como seria el allSatisfy en xtend + [:i | i.loSatisface(this)] mando a la persona
	}


}
