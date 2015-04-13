package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class Usuario {
	int peso
	int altura // en cm
	char sexo
	String nombre

	// fecha de nacimiento, no se si no habra alguna clase por defecto que maneje fechas
	List<String> comidaQueLeDisgusta
	List<String> preferenciasAlimentarias
	List<CondicionPreexistente> condicionesPreexistentes

	Rutina rutinaUsuario = new SedentariaConAlgoDeEjercicio // una rutina, de 5 posibles
	List <Receta> recetasDelUsuario
	
}
