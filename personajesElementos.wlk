///-------------
/*
 es jugadora   
 en todo momento tiene un personaje activo (floki o mario, arranca en mario)
 puede cambiaro en cualquier momento las veces que quiera
 entiende: aparece(unelemento)
    - indica al personaje activo que se encuentre a ese elemento
*/
object luisa {
    var personajeActivo = mario

    method cambiarPersonaje(nuevoPersonaje)
     {personajeActivo = nuevoPersonaje}

    method aparece(unElemento)
     {personajeActivo.encontrar(unElemento)}

      
}


///--------PERSONAJES-----
/*
    es un guerrero
    tiene alguna de las dos armas
    metodo encontrar(elemento)
        - elemento recibe ataque con valor = potencia el arma
        - el arma registra que fue usada, siempre y cuando este cargada
*/

object floki{
    var armaActual = ballesta

    method cambiar de arma(armaNueva) { armaActual = armaNueva }

    method encontrar(elemento) {
        if (armaActual.estaCargada){
            elemento.recibirAtaque(armaActual.potencia())
            armaActual.fueUsada()} 

    }
}




/*
   personaje trabajador
    interesa saber su valor recolectado, que arranca en 0
    Metodo encontrar(elemento)
        - el elemnto le otorga puntos que Mario acumula en el valor recolectado
    sabe responder si es feliz , es feliz cuando:
        tiene al menos 50 de valor recolectado
        o
        ultim elemento que se encotro mide al menos 10 metros de altura (arranca en aurora)

*/
object mario {
    var valorRecoletado = 0
    var ultimoElementoEncontrado = aurora


    method encontrar(elemento){
        valorRecoletado += 1 elemento.puntoQueOtorga()//tipo int
        elemento.recibirTrabajo
    }
    method estaFeliz() = valorRecoletado >= 50 or ultimoElementoEncontrado.altura() >=
  
}


//-------- ARMAS----
/*
    arma:
    potencia:

*/

object ballesta {
    var cantidadDeFlechas = 10
    method potencia() = 4
    method registrarUso() { cantidadDeFlechas -= 1}
    method estaCargada() = cantidadDeFlechas > 0 
}


/*
*/
object jabalina {
    var estaCargada = true

    method potencia() = 30
    method registrarUso() { estaCargada = false}
    method estaCargada() = estaCargada //getter
    }

//------OTROS ELEMENTOS---

/*
    altura: 20 m 
    defensa: arranca 150
*/
object castillo {
  
}
/*
    vaca
    altura: 1 m
*/

object aurora {
  
}
/*
    arbol
    altura: incia en 8 m, puede crecer
*/

object tipa {
  
}