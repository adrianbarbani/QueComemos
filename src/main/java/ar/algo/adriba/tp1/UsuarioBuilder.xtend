package ar.algo.adriba.tp1

import java.util.List

class UsuarioBuilder {
	
	Usuario usuario

	new() {
		usuario = new Usuario
	}

	def UsuarioBuilder agregarPeso(int unPeso) {
		usuario.peso = unPeso
		this
	}

	def UsuarioBuilder agregarAltura(double unaAltura) {
		usuario.altura = unaAltura
		this
	}

	def UsuarioBuilder agregarSexo(Sexo unSexo) {
		usuario.sexo = unSexo
		this
	}

	def UsuarioBuilder agregarNombre(String unNombre) {
		usuario.nombre = unNombre
		this
	}

	def UsuarioBuilder agregarFechaNacimiento(Fecha unaFechaDeNacimiento) {
		usuario.fechaDeNacimiento = unaFechaDeNacimiento
		this
	}

	def UsuarioBuilder agregarRutina(Rutina unaRutina) {
		usuario.rutinaUsuario = unaRutina
		this
	}

	def UsuarioBuilder agregarCondicionesPreexistentes(List<CondicionPreexistente> unasCondicionesPreexistentes) {
		usuario.condicionesPreexistentes = unasCondicionesPreexistentes
		this
	}

	def UsuarioBuilder agregarPreferenciasAlimentarias(List<String> unasPreferenciasAlimentarias) {
		usuario.preferenciasAlimentarias = unasPreferenciasAlimentarias
		this
	}

	def UsuarioBuilder agregarComidaQueLeDisgusta(List<String> unasComidasQueLeDisgustan) {
		usuario.comidaQueLeDisgusta = unasComidasQueLeDisgustan
		this
	}

	def Usuario build(String contraseña) {
		usuario.validacionDeDatos()
		usuario.solicitarIncorporacion()
		RepoDeUsuariosMock.getInstance().agregarUsuarioConContraseña(usuario, contraseña)
		usuario
	}

}
