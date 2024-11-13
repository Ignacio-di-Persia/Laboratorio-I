Funcion menuPrincipal <- menuPrin
	
	Escribir "          PONE A PRUEBA TU RAPIDEZ VISUAL           "
	Escribir "¡Ahora intenta adivinar en qué cubo está la pelota! "
    Escribir "                                                    "
    Escribir "     /^^^^\\          /^^^^\\          /^^^^\\      "
    Escribir "    /      \\        /      \\        /      \\     "
    Escribir "   /        \\      /        \\      /        \\    "
    Escribir "  /          \\    /          \\    /          \\   "
    Escribir " /            \\  /            \\  /            \\  "
    Escribir "/______________\\/______________\\/______________\\ "
	
FinFuncion


Funcion posicionPelota <- InicializarJuego
    posicionPelota <- Aleatorio(1, 3)
Fin Funcion

// mezcla los vasos y simula el movimiento de la pelota
Funcion posicionPelota <- MezclarVasos(posicionInicial, ronda, puntosTotales)
    Definir i, intercambio Como Entero
    posicionPelota <- posicionInicial
	
    Para i <- 1 Hasta 5 * ronda Hacer  // mezcla más veces a medida que la ronda aumenta
        Borrar Pantalla
        Escribir "Vasos y pelota (Ronda ", ronda, " - Puntos Totales: ", puntosTotales, "):"
        Escribir "        1                2                3         "
        Escribir "		"
		
        intercambio <- Aleatorio(1, 2)
        Si intercambio = 1 Entonces
            Si posicionPelota = 1 Entonces
                posicionPelota <- 2
            Sino
                Si posicionPelota = 2 Entonces
                    posicionPelota <- 1
                Sino
                    posicionPelota <- 2
                FinSi
            FinSi
        Sino
            Si posicionPelota = 1 Entonces
                posicionPelota <- 3
            Sino
                posicionPelota <- 1
            FinSi
        FinSi
        
        // posición actual
        Si posicionPelota = 1 Entonces
            Escribir "     /^^^^\\          /^^^^\\          /^^^^\\      "
            Escribir "    /      \\        /      \\        /      \\     "
            Escribir "   /        \\      /        \\      /        \\    "
            Escribir "  /          \\    /          \\    /          \\   "
            Escribir " /     __     \\  /            \\  /            \\  "
            Escribir "/_____(__)_____\\/______________\\/______________\\ "
        Sino Si posicionPelota = 2 Entonces
				Escribir "     /^^^^\\          /^^^^\\          /^^^^\\      "
				Escribir "    /      \\        /      \\        /      \\     "
				Escribir "   /        \\      /        \\      /        \\    "
				Escribir "  /          \\    /          \\    /          \\   "
				Escribir " /            \\  /     __     \\  /            \\  "
				Escribir "/______________\\/_____(__)_____\\/______________\\ "
			Sino
				Escribir "     /^^^^\\          /^^^^\\          /^^^^\\      "
				Escribir "    /      \\        /      \\        /      \\     "
				Escribir "   /        \\      /        \\      /        \\    "
				Escribir "  /          \\    /          \\    /          \\   "
				Escribir " /            \\  /            \\  /     __     \\  "
				Escribir "/______________\\/______________\\/_____(__)_____\\ "
			FinSi
		FinSi
		
		
		Esperar (1000 / ronda) Milisegundos // + velocidad en cada ronda
	FinPara
Fin Funcion

// función que combina la elección del jugador y el tiempo de respuesta
Funcion puntosObtenidos <- ObtenerResultado(posicionPelota, ronda, puntosTotales)
    Definir ha, minInicio, minFin, segInicio, segFin, tiempoRespuesta, puntosBase Como Entero
	Definir eleccionJugador Como Real
    Definir auxeleccionJugador Como Caracter
    Borrar Pantalla
    Escribir "Ronda: ", ronda, " - Puntos Totales: ", puntosTotales
    Escribir "¡Ahora intenta adivinar en qué cubo está la pelota (1, 2, 3)!"
    Escribir "        1                2                3         "
    Escribir "     /^^^^\\          /^^^^\\          /^^^^\\      "
    Escribir "    /      \\        /      \\        /      \\     "
    Escribir "   /        \\      /        \\      /        \\    "
    Escribir "  /          \\    /          \\    /          \\   "
    Escribir " /            \\  /            \\  /            \\  "
    Escribir "/______________\\/______________\\/______________\\ "
    
    ha <- HoraActual() // Captura la hora actual al inicio
    minInicio <- trunc(ha / 100) % 100
    segInicio <- ha % 100
    Repetir
		Si contadorCiclos>0 Entonces
			Escribir "El ingreso <",auxeleccionJugador,"> no es un ingreso valido. Por favor intente nuevamente:"
		FinSi
		Leer auxeleccionJugador
		numeroOK<-0
		contadorCiclos<-0
		Para i<-0 hasta Longitud(auxeleccionJugador)-1 Hacer
			Si Subcadena(auxeleccionJugador,i,i)="1" | Subcadena(auxeleccionJugador,i,i)="2" | Subcadena(auxeleccionJugador,i,i)="3" Entonces
				numeroOK<-numeroOK+1
				
			FinSi
		FinPara
		contadorCiclos<-contadorCiclos+1
	Mientras Que numeroOK<>Longitud(auxeleccionJugador)
	eleccionJugador<-ConvertirANumero(auxeleccionJugador)
	Mientras (eleccionJugador < 1 o eleccionJugador > 3 o eleccionJugador<>trunc(eleccionJugador)) Hacer
		Escribir "Ingrese un valor válido, vaso 1, 2 o 3"
		Leer eleccionJugador
	Fin Mientras
    
    ha <- HoraActual()
    minFin <- trunc(ha / 100) % 100
    segFin <- ha % 100
    
    tiempoRespuesta <- (minFin - minInicio) * 60 + (segFin - segInicio)
    
    // Resultado
    puntosBase <- 100 * ronda // puntos máximos que aumentan con la ronda
    
    Si eleccionJugador = posicionPelota Entonces
        Escribir "Ganaste titán!"
        puntosObtenidos <- puntosBase - tiempoRespuesta // se restan puntos según el tiempo de respuesta
    Sino
        Escribir "No acertaste, pero muy bien jugado!"
        puntosObtenidos <- 0
    FinSi
Fin Funcion

// muestra resultados al jugador
Funcion sin_retorno <- MostrarResultados(posicionPelota, puntosObtenidos, puntosTotales)
    Escribir "La pelota estaba en el vaso: ", posicionPelota
    Escribir "Puntos obtenidos en esta ronda: ", puntosObtenidos
    Escribir "Puntos Totales: ", puntosTotales
Fin Funcion

// desea continuar?
Funcion continuar <- PreguntarContinuar
    Escribir "¿Querés jugar de nuevo? (1 = Sí, 0 = No): "
    Leer continuar
	Mientras (continuar < 0 o continuar > 1) Hacer
		Escribir "Ingrese un valor válido, ¿Querés jugar de nuevo? (1 = Sí, 0 = No):"
		Leer continuar
	Fin Mientras
    continuar <- continuar
Fin Funcion

Proceso DescubrirLaPelota
    Definir posicionPelota, continuar, ronda, puntosTotales, puntosObtenidos Como Entero
    
    continuar <- 1
    ronda <- 1
    puntosTotales <- 0
    
    Repetir
        posicionPelota <- InicializarJuego
        posicionPelota <- MezclarVasos(posicionPelota, ronda, puntosTotales)
        puntosObtenidos <- ObtenerResultado(posicionPelota, ronda, puntosTotales)
        puntosTotales <- puntosTotales + puntosObtenidos
        sin_retorno <- MostrarResultados(posicionPelota, puntosObtenidos, puntosTotales)
        
        Si puntosObtenidos > 0 Entonces
            ronda <- ronda + 1
        FinSi
		Si puntosObtenidos = 0 Entonces
			puntosTotales <- 0
			ronda <- 1
		FinSi
        
        continuar <- PreguntarContinuar()
    Hasta Que continuar = 0
    
    Escribir "¡Gracias por jugar! Puntuación final: ", puntosTotales
FinProceso

