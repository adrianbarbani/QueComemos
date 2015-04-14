package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class Usuario {
	int peso
	double altura
	char sexo
	String nombre

	// fecha de nacimiento, no se si no habra alguna clase por defecto que maneje fechas
	List<String> comidaQueLeDisgusta = new ArrayList<String>
	List<String> preferenciasAlimentarias = new ArrayList<String>
	List<CondicionPreexistente> condicionesPreexistentes = new ArrayList<CondicionPreexistente>

	Rutina rutinaUsuario = new SedentariaConAlgoDeEjercicio //ejemplo una rutina, de 5 posibles
	List<Receta> recetasDelUsuario

	def double imc() { // agregue el tipo
		this.peso / (this.altura * this.altura) //devuelve el indice de masa corporal
	}

	def boolean usuarioValido() {
		this.camposObligatorios() && this.validacionDiabetico() && this.validacionVegano()
	}

	def boolean validacionVegano() {
		preferenciasAlimentarias.forall[Comida|noescarnivora(Comida)]
	}

	// esto deberia estar en una clase comida, despues vemos
	def boolean noescarnivora(String Comida) {
		Comida != 'carne' || Comida != 'pollo' || Comida != 'chivito' || Comida != 'chori'
	}

	def boolean validacionDiabetico() {
		if (this.esDiabetico()) {
			this.validacionSexo()
		} else {
			true
		}
	}

	def boolean validacionSexo() { // como no se banca comparar con null un caracter hacemos esto para validar el sexo. valores posibles : f, F, m, M
		this.sexo == 'f' || this.sexo == 'm' || this.sexo == 'F' || this.sexo == 'M'
	}

	def boolean camposObligatorios() {

		// agregué que mida los caracteres del nombre
		// la fecha hay que preguntar y no se como hacer si rutinaUsuario no apunta a nada. a y preguntar por &&
		this.peso != 0 && this.altura != 0 && this.nombre.length > 4
	}

	def boolean esDiabetico() {
		condicionesPreexistentes.contains("Diabetico")
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
