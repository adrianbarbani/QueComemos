package ar.algo.adriba.appModel

import ar.algo.adriba.tp1.Fecha
import ar.algo.adriba.tp1.Rutina
import ar.algo.adriba.tp1.Sexo
import ar.algo.adriba.tp1.UsuarioBuilder

class UsuariosObjectSet {
		Fecha fechaValida = new Fecha(System.currentTimeMillis() - 24 * 60 * 60 * 1000);
		
		def crearUsuarios(){
	
		new UsuarioBuilder().agregarPeso(52).agregarAltura(1.64).agregarSexo(Sexo.FEMENINO).
			agregarNombre("Javier").agregarFechaNacimiento(fechaValida).agregarRutina(new Rutina(61, true))
			.build("javi")

		new UsuarioBuilder().agregarPeso(52).agregarAltura(1.64).agregarSexo(Sexo.FEMENINO).
			agregarNombre("Marina").agregarFechaNacimiento(fechaValida).agregarRutina(new Rutina(61, true))
			.build("marina")

		new UsuarioBuilder().agregarPeso(52).agregarAltura(1.64).agregarSexo(Sexo.MASCULINO).
			agregarNombre("Juancho").agregarFechaNacimiento(fechaValida).agregarRutina(new Rutina(61, true))
			.build("boton")

		new UsuarioBuilder().agregarPeso(67).agregarAltura(1.91).
			agregarSexo(Sexo.MASCULINO).agregarNombre("Adrian").agregarFechaNacimiento(fechaValida).
			agregarRutina(new Rutina(74, true))
			.build("a")

		new UsuarioBuilder().agregarPeso(80).agregarAltura(1.74).
			agregarSexo(Sexo.MASCULINO).agregarNombre("Federico").agregarFechaNacimiento(fechaValida).
			agregarRutina(new Rutina(82, true))			
			.build("messi")

		new UsuarioBuilder().agregarPeso(1500).agregarAltura(1.44).
			agregarSexo(Sexo.FEMENINO).agregarNombre("Ariel").agregarFechaNacimiento(fechaValida).
			agregarRutina(new Rutina(10, true))		
			.build("pacman")
		
}

	public static val INSTANCE = new UsuariosObjectSet
}