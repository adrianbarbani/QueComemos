package ar.algo.adriba.tp1

import java.util.List
import java.util.ArrayList

class RepositorioUsuarios {
	
	public List<Usuario> todosLosUsuarios = new ArrayList<Usuario>
		
	def void agregar(Usuario unUsuario) {
		todosLosUsuarios.add(unUsuario)
	}

	def void quitar(Usuario unUsuario) {
		todosLosUsuarios.remove(unUsuario)
	}

	def Usuario get(String unNombre){ //la consigna dice "devuelve un usuario por su nombre" nosotros manejamos nombres con strings
		todosLosUsuarios.findFirst[usuario| usuario.esTuNombre(unNombre)]
	}
	
	def update(Usuario unUsuario){
		
	}
	
	def listar(Usuario unUsuario){
		todosLosUsuarios.filter[esTuNombre(unUsuario.nombre)]
	}
	
	def listar(CondicionPreexistente unaCondicion){
		todosLosUsuarios.filter[tenesCondicionPreexistente(unaCondicion)]
	}
}