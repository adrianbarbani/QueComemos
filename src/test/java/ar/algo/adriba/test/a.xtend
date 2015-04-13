package ar.algo.adriba.test

import org.junit.Test
import ar.algo.adriba.tp1.Usuario
import org.junit.Assert

class a {
	
	Usuario federico
	
	@Test
	def void Test1() {
		federico= new Usuario
		federico.setAltura(1.88)
		federico.setPeso(83)
		Assert.assertEquals (23.48, federico.imc(), 0.1) 	
		
		
	}
	
	
}