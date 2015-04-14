package ar.algo.adriba.test

import org.junit.Test
import ar.algo.adriba.tp1.Usuario
import org.junit.Assert
import org.junit.Before

class TestImc { // le puse un nombre descriptivo
	
	Usuario federico
	Usuario marina
	
	@Before // agregué el método init para los tests y metí todos los constructores y setters ahi
	def void init() {
		
		federico = new Usuario
		federico.setAltura(1.88) 
		federico.setPeso(83)	
		
		marina = new Usuario => [
		setAltura(1.60)
		setPeso(55)
		]
	}
	
	@Test
	def void federicoImc() {
		Assert.assertEquals (23.48, federico.imc(), 0.1) 	
	}
	
	@Test
	def void marinaImc() {
		Assert.assertEquals (21.48, marina.imc(), 0.1) 	
		
	}
	
}