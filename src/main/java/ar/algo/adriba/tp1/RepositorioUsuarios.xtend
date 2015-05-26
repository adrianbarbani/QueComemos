package ar.algo.adriba.tp1

import java.util.List
import java.util.ArrayList

class RepositorioUsuarios {
	
	public List<Usuario> todosLosUsuarios = new ArrayList<Usuario>
	public List<Usuario> usuariosPendientes = new ArrayList<Usuario>

	static RepositorioUsuarios repositorio = null

	private new() {
	}

	static public def RepositorioUsuarios getInstance() {
		if (repositorio == null) {
			repositorio = new RepositorioUsuarios()
		}
      repositorio;
	}
	
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
		todosLosUsuarios.remove(unUsuario)
		todosLosUsuarios.add(unUsuario)	
	}
	
	def List<Usuario> listar(Usuario unUsuario){
		todosLosUsuarios.filter[usuario | usuario.esTuNombre(unUsuario.nombre)]
	}
	
	def List<Usuario> listar(CondicionPreexistente unaCondicion){
		todosLosUsuarios.filter[usuario | usuario.tenesCondicionPreexistente(unaCondicion)]
	}
	
	def solicitarIncorporacion(Usuario unUsuario) {
		usuariosPendientes.add(unUsuario)
	}
	
	def aceptarIncorporacion(Usuario unUsuario) {
		usuariosPendientes.remove(unUsuario)
		this.agregar(unUsuario)
	}
	
	def rechazarIncorporacion(Usuario unUsuario) {
		usuariosPendientes.remove(unUsuario)
		throw new Exception ("Motivo de rechazo: ...")
	}
	
	def void limpiarTodo() {
		todosLosUsuarios.clear
				
	}
	
	def void limpiarPendientes(){
		usuariosPendientes.clear
	}
	
}