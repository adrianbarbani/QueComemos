package ar.algo.adriba.test

import org.junit.Test
import ar.algo.adriba.tp1.Usuario
import org.junit.Assert

class a { // si saben cambiar el nombre de la clase haganlo por que no me acuerdo
	
	Usuario federico
	
	@Test
	def void Test1() {
		federico= new Usuario
		federico.setAltura(1.88) //cambie la altura de int a double
		federico.setPeso(83)
		Assert.assertEquals (23.48, federico.imc(), 0.1) 	
		
		
	}
	
	
}