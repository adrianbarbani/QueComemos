package ar.algo.adriba.tp1

import java.util.Date
import java.time.LocalDateTime

class Fecha extends Date {

	def boolean esValida() {

		this.before(new Date)

	}

}
