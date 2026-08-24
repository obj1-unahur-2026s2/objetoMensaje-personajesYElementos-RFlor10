/*
 Es una jugadora
 En todo momento tiene un personaje activo (floki o mario, arranca en mario)
 Puede cambiarlo en cualquier momento las veces que quiera
 Entiende: aparece(unElemento)
     - indica al personaje activo que encuentre ese elemento
*/
object luisa {
    var personajeActivo = mario

    method cambiarPersonaje(nuevoPersonaje) {
        personajeActivo = nuevoPersonaje
    }
    method aparece(unElemento) {
        personajeActivo.encontrar(unElemento)
    }
}

// ------------ PERSONAJES ------------
/*
       Es un personaje guerrero
       Tiene alguna de las dos armas
       Metodo encontrar(elemento)
           - El elemento recibe ataque con valor = potencia del arma
           - El arma registra que fue usada, siempre y cuando este cargada
*/
object floki {
    var armaActual = ballesta

    method cambiarDeArma(armaNueva) {
        armaActual = armaNueva
    }
    method encontrar(elemento) {
        if (armaActual.estaCargada()) {
            elemento.recibirAtaque(armaActual.potencia())
            armaActual.fueUsada()
        }
    }
}

/*
    Es un personaje trabajador
    Se encuentra con un elemento y acumula el valor recolectado, que arranca en 0

   Metodo encontrar(elemento)
        - El elemento le otorga puntos que Mario acumula en el valor recolectado
        - Sabe responder si es feliz cuando:
            tiene al menos 50 de valor recolectado
            o
            ultimo elemento encontrado tiene al menos 10 m de altura
*/
object mario {
    var valorRecoletado = 0
    var ultimoElementoEncontrado = aurora

    method encontrar(elemento) {
        valorRecoletado += elemento.puntoQueOtorga()
        elemento.recibirTrabajo()
        ultimoElementoEncontrado = elemento
    }
    method estaFeliz() = valorRecoletado >= 50 or ultimoElementoEncontrado.altura() >= 10
}

// -------- ARMAS --------
object ballesta {
    var cantidadDeFlechas = 10

    method potencia() = 4

    method fueUsada() {
        self.registrarUso()
    }
    method registrarUso() {
        cantidadDeFlechas = cantidadDeFlechas - 1
    }
    method estaCargada() = cantidadDeFlechas > 0
}

object jabalina {
    var estaCargada = true

    method potencia() = 30

    method registrarUso() {
        cargada = false
    }
    method fueUsada() {
        self.registrarUso()
    }
    method estaCargada() = cargada
}

// ------ OTROS ELEMENTOS ------
object castillo {
    var defensa = 150

    method altura() = 20

    method defensa() = defensa

    method puntoQueOtorga() = 15

    method recibirAtaque(valor) {
        defensa = defensa - valor
        if (defensa < 0) {
            defensa = 0
        }
    }
    method recibirTrabajo() {
        // No hace nada
    }
}

object aurora {
    method altura() = 1

    method puntoQueOtorga() = 5

    method recibirAtaque(valor) {
        // No hace nada
    }
    method recibirTrabajo() {
        // No hace nada
    }
}

object tipa {
    var altura = 8

    method altura() = altura

    method alturaActual() = altura

    method crecer() {
        altura += 1
    }
    method puntoQueOtorga() = 10

    method recibirAtaque(valor) {
        // No hace nada
    }
    method recibirTrabajo() {
        self.crecer()
    }
}