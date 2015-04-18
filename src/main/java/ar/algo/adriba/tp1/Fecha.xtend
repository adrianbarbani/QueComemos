package ar.algo.adriba.tp1

import java.util.Date

class Fecha extends Date {

	new(long l) {
		super(l)
	}
	
	def boolean esValida() {

		this.before(new Date)

	}

}
