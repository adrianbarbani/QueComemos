package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.MessageSender
import java.util.Map
import java.util.HashMap
import java.util.HashSet
import java.util.Set

class StubMailSender implements MessageSender {
	Map<String, Set<String>> mailsEnviados
	
	new() {
		mailsEnviados = new HashMap<String, Set<String>>
	}
	
	override send(Mail mail) {
		simularEnvioMail(mail.to, mail.message)
		//println("SimulaciÃ³n envÃ­o de mail | From: " + mail.from + " | To: " + mail.to + " | Message: " + mail.message)
	}
	
	def simularEnvioMail(String to, String message) {
		var mensajes = mailsPara(to)
		mensajes.add(message)
		mailsEnviados.put(to, mensajes)
	}
	
	def Set<String> mailsPara(String to) {
		var Set<String> mensajes = mailsEnviados.get(to)
		if (mensajes == null) {
			mensajes = new HashSet<String>
		}
		mensajes
	}
	
}