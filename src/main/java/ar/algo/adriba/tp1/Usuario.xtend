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
	
// parte 1
	def boolean usuarioValido () {
		this.camposObligatorios() && this.validacionDiabetico() && this.validacionHipertenso() && this.validacionVegano() // falta lo de la fecha de nacimiento
	}
	
	
	
	def boolean validacionDiabetico() {
		if (this.esDiabetico()){
			this.validacionSexo()
			this.tamañoPreferencias() > 0
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
		condicionesPreexistentes.contains(Diabetico)// quiero saber si contenia un objeto de la clase Diabetico
	}
// seguir con "si el usuario es hipertenso o diabético, debe indicar al menos una preferencia"
	
		def tamañoPreferencias() {
		preferenciasAlimentarias.size 
	}
	
		def boolean validacionHipertenso(){
		if (this.esHipertenso()){
			this.tamañoPreferencias() > 0
		}else{
			true
		}
	}
	
	def boolean esHipertenso() {
		condicionesPreexistentes.contains(Hipertenso)
	}
	

	 
	//Parte 2
	
  	def boolean sigoRutinaSaludable (){
		(this.imcenrango())&& ((this.notengocondiciones()) || this.puedosubsanar())} //falta el metodo de subsanar que depende de cada condicion, vemos como hacemos 

	def boolean imcenrango(){
		this.imc()>18 && this.imc()<30} //me dice si el imc esta en el rango de 18 a 30
		
	def boolean notengocondiciones(){
		condicionesPreexistentes.empty} //me dice si no tengo condiciones preexistentes (si la coleccion esta vacia)
		
	def boolean puedosubsanar(){ //VER
		condicionesPreexistentes .AllSatisfy //??? como seria el allSatisfy en xtend + [:i | i.loSatisface(this)] mando a la persona ---- se me ocurre hacer un exist negado 
		}
	
}
