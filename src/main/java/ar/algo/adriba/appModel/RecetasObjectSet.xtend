package ar.algo.adriba.appModel

import ar.algo.adriba.tp1.Comida
import ar.algo.adriba.tp1.Fecha
import ar.algo.adriba.tp1.Privada
import ar.algo.adriba.tp1.Publica
import ar.algo.adriba.tp1.RecetaBuilder
import ar.algo.adriba.tp1.Rutina
import ar.algo.adriba.tp1.Sexo
import ar.algo.adriba.tp1.Usuario
import ar.algo.adriba.tp1.UsuarioBuilder

class RecetasObjectSet {
			//Recetas
	Comida carne = new Comida(0, "carne", 1)
	Comida harina = new Comida(0, "Harina", 20)
	Comida huevo = new Comida(0, "Huevo", 3)
	Comida aceite = new Comida(0, "Huevo", 3)
	Comida panRallado = new Comida(0, "Pan Rallado", 50)
	Comida verdura = new Comida(0, "Verdura", 12)
	Comida queso = new Comida(0, "Muzzarella", 200)
	Comida prepizza = new Comida(0, "Prepizza", 1)
	Comida salsaDeTomate = new Comida(0, "Salsa de tomate", 200)
	Comida sal = new Comida(18, "Sal", 0)
	Comida salsaBlanca = new Comida(0, "Salsa Blanca", 400)
	Comida lomo = new Comida(0, "Lomo", 200)
	Comida garbanzos = new Comida(0, "Garbanzos", 500)
	Comida limon = new Comida(10, "Limon", 0)
	Comida ajo = new Comida(5, "Ajo", 0)
	Comida jamon = new Comida(0, "Jamon", 100)
	Comida oregano = new Comida(100, "Oregano", 0)
	Comida azucar = new Comida(0, "azucar", 200)
	
	def crearRecetas(Usuario usuario) {
		
	new RecetaBuilder()
			.tipoDeReceta(new Publica)
			.nombreDelPlato("Milanesas")
			.agregarIngrediente(harina)
			.agregarIngrediente(huevo)
			.agregarIngrediente(aceite)
			.setearTemporadas("Todo el año")
			.agregarIngrediente(panRallado)
			.agregarIngrediente(carne)
			.setearCalorias(150)
			.setearDificultad("Dificil")
			.setearPreparacion("Pasar la carne por huevo, harina y pan rallado. Freir con el aceite por 10 minutos")
		.build
		
	new RecetaBuilder()
			.tipoDeReceta(new Publica)
			.nombreDelPlato("Milanesa napolitana")
			.agregarIngrediente(harina)
			.agregarIngrediente(huevo)
			.agregarIngrediente(panRallado)
			.agregarIngrediente(carne)
			.agregarIngrediente(queso)
			.agregarIngrediente(salsaDeTomate)
			.setearCalorias(8000)
			.setearTemporadas("Todo el año")
			.setearDificultad("Dificil")
			.setearPreparacion("Pasar la carne por huevo, harina y pan rallado. Freir con el aceite por 10 minutos. Luego colocarle la salsa de tomate, el queso y  calentar")
			.build

	new RecetaBuilder()
			.tipoDeReceta(new Publica)
			.nombreDelPlato("Sopa de Verdura")
			.agregarIngrediente(verdura)
			.agregarIngrediente(sal)
			.setearCalorias(200)
			.setearTemporadas("Invierno")
			.setearDificultad("Dificil")
			.setearPreparacion("")
			.build

	new RecetaBuilder()
			.tipoDeReceta(new Publica)
			.nombreDelPlato("Pizza de muzzarella")
			.agregarIngrediente(prepizza)
			.agregarIngrediente(salsaDeTomate)
			.agregarIngrediente(oregano)
			.agregarIngrediente(queso)
			.setearTemporadas("Todo el año")
			.setearDificultad("Facil")
			.setearCalorias(500)
			.setearPreparacion("Cocinar la prepizza en el horno. Agregar el queso y volver a cocinar. Agregar oregano a gusto")
			.build

	new RecetaBuilder()
			.tipoDeReceta(new Publica)
			.nombreDelPlato("Pizza de verdura y salsa blanca")
			.agregarIngrediente(prepizza)
			.agregarIngrediente(salsaDeTomate)
			.agregarIngrediente(queso)
			.agregarIngrediente(salsaBlanca)
			.agregarIngrediente(verdura)
			.setearTemporadas("Todo el año")
			.setearCalorias(560)
			.setearDificultad("Dificil")
			.setearPreparacion("Cocinar la prepizza en el horno. Agregar el queso y volver a cocinar. Agregar la salsa blanca y la verdura")
			.build

	new RecetaBuilder()
			.tipoDeReceta(new Publica)
			.nombreDelPlato("Lomo a la Plancha")
			.agregarIngrediente(lomo)
			.setearCalorias(300)
			.setearTemporadas("Otoño")
			.setearDificultad("Media")
			.setearPreparacion("Colocar el lomo en la plancha y cocinar. Esperar a que este listo y darlo vuelta. Seguir cocinando")
			.build

	new RecetaBuilder()
			.tipoDeReceta(new Privada(usuario))
			.nombreDelPlato("Hummus de garbanzo")
			.agregarIngrediente(garbanzos)
			.agregarIngrediente(limon)
			.agregarIngrediente(ajo)
			.setearCalorias(600)
			.setearPreparacion("No tengo ni ganas de hacer una descripcion sobre el hummus de garbanzo porque debe ser horrible")
			.build
	}
	
	
	//------------------------------------------------
	
	Fecha fechaValida = new Fecha(System.currentTimeMillis() - 24 * 60 * 60 * 1000);
		
	def crearUsuario() {
		new UsuarioBuilder().agregarPeso(52).agregarAltura(1.64).agregarSexo(Sexo.FEMENINO).
		agregarNombre("Esteban").agregarFechaNacimiento(fechaValida).agregarRutina(new Rutina(61, true)).build("1234")
	}

	public static val INSTANCE = new RecetasObjectSet
}