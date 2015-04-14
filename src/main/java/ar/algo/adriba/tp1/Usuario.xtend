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
	List<String> comidaQueLeDisgusta = new ArrayList <String>
	List<String> preferenciasAlimentarias = new ArrayList <String>
	List<CondicionPreexistente> condicionesPreexistentes = new ArrayList <CondicionPreexistente>

	Rutina rutinaUsuario = new SedentariaConAlgoDeEjercicio //ejemplo una rutina, de 5 posibles
	List <Receta> recetasDelUsuario
	
	
	def imc (){
		this.peso/(this.altura*this.altura) //devuelve el indice de masa corporal
	}
	
	def boolean usuarioValido () {
		this.camposObligatorios() && this.validacionDiabetico() 
	}
	
	def boolean validacionDiabetico() {
		if (this.esDiabetico()){
			this.validacionSexo()
		}else{
			true
		}
	}
	
	def boolean validacionSexo() {
		true //ver  pongo this.sexo != null y me dice que != no es valido para char o string.
	}
	
	def boolean camposObligatorios() {
		this.peso != 0 && this.altura != 0 //nombre + de 4 caracteres no se como se hace, la fecha bue hay que preguntar eso y no se como hacer si rutinaUsuario no apunta a nada. a y preguntar por &&
	}
	
	def boolean esDiabetico(){
		condicionesPreexistentes.contains("Diabetico")
	}
	
}
