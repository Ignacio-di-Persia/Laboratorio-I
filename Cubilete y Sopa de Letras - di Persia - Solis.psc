Funcion sopaDeLetras
	// El vector abecedario se utiliza para validar el ingreso de las palabras personalizadas y para rellenar con letras aleatorias
	cantidadLetrasAbecedario<-27
	Dimensionar abecedario[cantidadLetrasAbecedario]
	llenarAbecedario(abecedario)
//	mostrarVector(abecedario, cantidadLetrasAbecedario) // testing
//	Esperar Tecla // testing
//	Limpiar Pantalla // testing
	// El vector vNumeros se utiliza para validar el ingreso de las opciones numericas sin generar errores
	cantidadNumeros<-10
	Dimensionar vNumeros[cantidadNumeros]
	llenarNumeros(vNumeros)
//	mostrarVector(vNumeros, cantidadNumeros) // testing
//	Esperar Tecla // testing
//	Limpiar Pantalla // testing
	// Creamos la grilla[filas, columnas] 
	filasGrilla<-15
	columnasGrilla<-15
	Dimensionar grilla[filasGrilla,columnasGrilla]
	// Inicializamos la grilla con "-" para que solo se puedan colocar valores si hay un "-"
	inicializarMatriz(grilla, filasGrilla, columnasGrilla)
//	mostrarMatriz(grilla, filasGrilla, columnasGrilla) // testing
//	Esperar Tecla // testing
//	Limpiar Pantalla // testing
	// Creamos un vector de palabras con un tamaño maximo
	cantidadMaximaPalabras<-10
	Dimensionar familiaDePalabras[cantidadMaximaPalabras]
	// Inicializamos el vector de palabras con "." 
	inicializarVector(familiaDePalabras, cantidadMaximaPalabras)
	largoMaximoPalabra<-10
	codigoFamilia<-seleccionFamilia()
	Si codigoFamilia<>0 Entonces
		// Cargamos el vector de palabras con la familia de palabras seleccionada en seleccionFamilia()
		cantidadPalabrasUsadas<-cargarVector(familiaDePalabras, cantidadMaximaPalabras, largoMaximoPalabra, abecedario , vNumeros, codigoFamilia)
//		mostrarVector(familiaDePalabras, cantidadMaximaPalabras) // testing 
		//Contamos la cantidad de palabras que realmente fueron utilizadas en el vector, es decir las posiciones del vector en las que no hay "."
		//cantidadPalabrasUsadas<-contarPalabrasUtilizadas(familiaDePalabras, cantidadMaximaPalabras)
//		Escribir cantidadPalabrasUsadas // testing
//		Esperar Tecla // testing
//		mostrarVector(familiaDePalabras, cantidadPalabrasUsadas) // testing
//		Esperar Tecla // testing
		//Colocamos las palabras utilizadas en la grilla de forma aleatoria para paso seguido cargar la grilla de validacion con el numero de palabra
		colocarPalabra(cantidadPalabrasUsadas, familiaDePalabras, grilla, filasGrilla, columnasGrilla)
//		mostrarMatriz(grilla, filasGrilla, columnasGrilla) // testing
		// Llenamos los espacios de la matriz que todavia contienen "-" con letras aleatorias
		llenarRestantes(grilla, filasGrilla, columnasGrilla, abecedario)
		Escribir ""
		buscarPalabras(familiaDePalabras, cantidadPalabrasUsadas, grilla, filasGrilla, columnasGrilla, vNumeros, cantidadNumeros)
	FinSi
Fin Funcion

Funcion palabrasUtilizadas<-validarCantidadPalabras(cantidadMaximaPalabras Por Valor, vectorNumeros Por Referencia)
	Repetir
		Escribir "¿Cuantas palabras desea ingresar? (Máximo ", cantidadMaximaPalabras, "  palabras)"
		Leer entradaUsuario
		entradaValida<-0
		Para i<-0 Hasta Longitud(entradaUsuario)-1 Con Paso 1 Hacer
			Para j<-0 Hasta 9 Con Paso 1 Hacer
				Si vectorNumeros[j]=Subcadena(entradaUsuario,i,i)
					entradaValida<-entradaValida+1
				FinSi
			Fin Para
		Fin Para
		Si entradaValida=Longitud(entradaUsuario) Entonces
			palabrasUtilizadas<-ConvertirANumero(entradaUsuario)
			Si palabrasUtilizadas>cantidadMaximaPalabras Entonces
				Escribir "El maximo de palabras permitido es de <",cantidadMaximaPalabras,"> palabras. Por favor, ingrese un valor valido entre <1> y <",cantidadMaximaPalabras,">"
			SiNo
				Si palabrasUtilizadas=0 Entonces
					Escribir "El mínimo de palabras permitido es de <1> palabra. Por favor, ingrese un valor valido entre <1> y <",cantidadMaximaPalabras,">"
				FinSi
			FinSi
		SiNo
			Escribir "<",entradaUsuario,"> no es un numero valido. Por favor, ingrese un valor valido entre <1> y <10>"
		FinSi
	Mientras Que (entradaValida<>Longitud(entradaUsuario) | palabrasUtilizadas>cantidadMaximaPalabras | palabrasUtilizadas=0)
Fin Funcion

Funcion palabraInvertida<-invertirPalabra(palabra)
	Para i<-0 Hasta Longitud(palabra)-1 Con Paso 1 Hacer
		palabraInvertida<-Concatenar(palabraInvertida,subcadena(palabra,Longitud(palabra)-1-i,Longitud(palabra)-1-i))
	Fin Para
Fin Funcion

Funcion cantidadPalabrasUsadas<-contarPalabrasUtilizadas(vector Por Referencia, largoMax Por Valor)
	Para i<-0 Hasta largoMax-1 Con Paso 1 Hacer
		Si vector[i]="." Entonces
			cantidadPalabrasUsadas<-i
			i<-largoMax-1
		SiNo
			cantidadPalabrasUsadas<-i+1
		FinSi
	Fin Para
Fin Funcion

Funcion inicializarVector(vector Por Referencia, largoMaximo Por Valor)
	Para i<-0 Hasta largoMaximo-1 Con Paso 1 Hacer
		vector[i]<-"."
	Fin Para
Fin Funcion

// INICIALIZACIONES

Funcion llenarNumeros(vectorNumeros Por Referencia)
	vectorNumeros[0]<-"0"
	vectorNumeros[1]<-"1"
	vectorNumeros[2]<-"2"
	vectorNumeros[3]<-"3"
	vectorNumeros[4]<-"4"
	vectorNumeros[5]<-"5"
	vectorNumeros[6]<-"6"
	vectorNumeros[7]<-"7"
	vectorNumeros[8]<-"8"
	vectorNumeros[9]<-"9"
FinFuncion

Funcion llenarAbecedario (abecedario Por Referencia)
	abecedario[0]<-"A"
	abecedario[1]<-"B"
	abecedario[2]<-"C"
	abecedario[3]<-"D"
	abecedario[4]<-"E"
	abecedario[5]<-"F"
	abecedario[6]<-"G"
	abecedario[7]<-"H"
	abecedario[8]<-"I"
	abecedario[9]<-"J"
	abecedario[10]<-"K"
	abecedario[11]<-"L"
	abecedario[12]<-"M"
	abecedario[13]<-"N"
	abecedario[14]<-"Ñ"
	abecedario[15]<-"O"
	abecedario[16]<-"P"
	abecedario[17]<-"Q"
	abecedario[18]<-"R"
	abecedario[19]<-"S"
	abecedario[20]<-"T"
	abecedario[21]<-"U"
	abecedario[22]<-"V"
	abecedario[23]<-"W"
	abecedario[24]<-"X"
	abecedario[25]<-"Y"
	abecedario[26]<-"Z"
Fin Funcion

Funcion inicializarMatriz(grilla Por Referencia, filas Por Valor, columnas Por Valor)
	Para i<-0 Hasta filas-1 Con Paso 1 Hacer
		Para j<-0 Hasta columnas-1 Con Paso 1 Hacer
			grilla[i,j] <- "-"
		Fin Para
	Fin Para
FinFuncion

Funcion letraAleatoria <- generarLetraAleatoria(abecedario Por Referencia)
	letraAleatoria<-abecedario[azar(27)] // Azar(N) devuelve un numero entre 0 y N-1 es decir entre 0 y 26 (27-1)
FinFuncion

Funcion llenarRestantes(grilla Por Referencia, filas Por Valor, columnas Por Valor, abecedario Por Referencia)
	Para i<-0 Hasta filas-1 Con Paso 1 Hacer
		Para j<-0 Hasta columnas-1 Con Paso 1 Hacer
			Si (grilla[i,j] = "-") Entonces
				grilla[i,j]<-generarLetraAleatoria(abecedario)
			FinSi
		Fin Para
	Fin Para
FinFuncion

Funcion cantidadPalabrasUsuario<-cargarVector(vectorPalabras Por Referencia, cantidadMaximaPalabras Por Valor, cantidadMaximaLetras por Valor, abecedario Por Referencia, vectorNumeros Por Referencia, codigoFamilia Por Valor)
	cantidadPalabrasUsuario<-10
	Segun codigoFamilia Hacer
		1:	// Comidas
			vectorPalabras[0]<-"Pizza"
			vectorPalabras[1]<-"Fideos"
			vectorPalabras[2]<-"Asado"
			vectorPalabras[3]<-"Ensalada"
			vectorPalabras[4]<-"Milanesa"
			vectorPalabras[5]<-"Albondigas"
			vectorPalabras[6]<-"Hamburguesa"
			vectorPalabras[7]<-"Pure"
			vectorPalabras[8]<-"Alfajor"
			vectorPalabras[9]<-"Helado"
		2:	// Tech
			vectorPalabras[0]<-"Teclado"
			vectorPalabras[1]<-"Mouse"
			vectorPalabras[2]<-"Monitor"
			vectorPalabras[3]<-"Software"
			vectorPalabras[4]<-"Webcam"
			vectorPalabras[5]<-"Procesador"
			vectorPalabras[6]<-"Hardware"
			vectorPalabras[7]<-"Codigo"
			vectorPalabras[8]<-"Disco"
			vectorPalabras[9]<-"Pendrive"
		3:	// Vehiculos
			vectorPalabras[0]<-"Auto"
			vectorPalabras[1]<-"Moto"
			vectorPalabras[2]<-"Bicicleta"
			vectorPalabras[3]<-"Monopatin"
			vectorPalabras[4]<-"Avion"
			vectorPalabras[5]<-"Barco"
			vectorPalabras[6]<-"Colectivo"
			vectorPalabras[7]<-"Tren"
			vectorPalabras[8]<-"Subte"
			vectorPalabras[9]<-"Tranvia"
		4:	// Animales
			vectorPalabras[0]<-"Pato"
			vectorPalabras[1]<-"Tigre"
			vectorPalabras[2]<-"Leon"
			vectorPalabras[3]<-"Cebra"
			vectorPalabras[4]<-"Perro"
			vectorPalabras[5]<-"Gato"
			vectorPalabras[6]<-"Elefante"
			vectorPalabras[7]<-"Puma"
			vectorPalabras[8]<-"Tortuga"
			vectorPalabras[9]<-"Iguana"
		5:	//Ingreso de palabras personalizadas
			cantidadPalabrasUsuario<-validarCantidadPalabras(cantidadMaximaPalabras, vectorNumeros)
			Para i<-0 Hasta cantidadPalabrasUsuario-1 Con Paso 1 Hacer
				vectorPalabras[i]<-ingresarPalabraPersonalizada(cantidadMaximaLetras, abecedario)				
			FinPara
		De Otro Modo:
			Escribir "Error en Funcion seleccionFamilia"
	FinSegun
Fin Funcion

// *****************************************************************************************************************************************************************************

// MOSTRAR

Funcion mostrarVector(vector Por Referencia, largo Por Valor)
	Escribir "Funcionalidad para el testeo"
	Escribir "Que nombre tiene el vector?: "
	Leer textoVector
	Para i<-0 hasta largo-1 Con Paso 1 Hacer
		Escribir textoVector,"[",i,"] = ", vector[i]
	FinPara
FinFuncion

//Funcion mostrarMatriz(grilla Por Referencia, filas Por Valor, columnas Por Valor)
//	Para i<-0 Hasta filas-1 Con Paso 1 Hacer
//		Para j<-0 Hasta columnas-1 Con Paso 1 Hacer
//			Escribir Sin Saltar " || ", grilla[i,j] 
//		Fin Para
//		Escribir Sin Saltar " ||"
//		Escribir ""
//	Fin Para
//FinFuncion

//Funcion mostrarMatriz(grilla Por Referencia, filas Por Valor, columnas Por Valor)
//	Para i<-0 Hasta filas-1 Con Paso 1 Hacer
//		Para j<-0 Hasta columnas-1 Con Paso 1 Hacer
//			Escribir Sin Saltar "     ", grilla[i,j] 
//		Fin Para
//		Escribir Sin Saltar "     ",i+1
//		Escribir ""
//		Escribir ""
//	Fin Para
//FinFuncion

Funcion mostrarMenuGeneral
	Escribir "Bienvenido al programa"
	Escribir "Elija uno de nuestros juegos"
	Escribir "<1> Descubrir la pelota"
	Escribir "<2> Sopa de Letras"
	Escribir "<0> Salir"
FinFuncion

Funcion mostrarMenuFamilias
	Escribir "Menu familias"
	Escribir "<1> Comidas"
	Escribir "<2> Tech"
	Escribir "<3> Vehiculos"
	Escribir "<4> Animales"
	Escribir "<5> Personalizado"
	Escribir "<0> Salir"
FinFuncion

Funcion animacionTexto(palabra Por Valor, simbolo Por Valor,cantSimbolos Por Valor)
	Para i<-0 Hasta cantSimbolos Con Paso 1 Hacer
		Limpiar Pantalla
		Segun i Hacer
			0:
				// No hace nada
			De Otro Modo:
				palabra<-Concatenar(palabra,simbolo)
		FinSegun
		Escribir palabra
		Esperar 500 Milisegundos
	FinPara
FinFuncion

// *****************************************************************************************************************************************************************************

// CONVERTIR

Funcion  palabraAVector (palabra Por Valor, vector Por Referencia )
	Para i<-0 Hasta Longitud(palabra)-1 Con Paso 1 Hacer
		vector[i]<-Mayusculas(Subcadena(palabra,i,i))
	FinPara
Fin Funcion

Funcion invertirPalabraVectorizada(vector Por Referencia, largoMaximoPalabras)
	contadorLetras<-0
	Dimensionar vectorAux[largoMaximoPalabras]
	Para i<-0 Hasta largoMaximoPalabras-1 Con Paso 1 Hacer
		Si vector[i]<>"." Entonces
			contadorLetras<-contadorLetras+1
		FinSi
	FinPara
	Para i<-0 Hasta contadorLetras-1 Con Paso 1 Hacer
		vectorAux[contadorLetras-1-i]<-vector[i]
	FinPara
	Para i<-0 Hasta contadorLetras-1 Con Paso 1 Hacer
		vector[i]<-vectorAux[i]
	FinPara 
FinFuncion

Funcion convertirEnMatriz(vectorStrings Por Referencia, matriz Por Referencia, nPalabras Por Valor, largoMaximoPalabras Por Valor )
	Dimensionar vectorAuxiliar[largoMaximoPalabras]
	Para i<-0 Hasta nPalabras-1 Con Paso 1 Hacer
		palabraAVector(vectorStrings[i], vectorAuxiliar)
		Para j<-0 Hasta largoMaximoPalabras-1 Con Paso 1 Hacer
			Si vectorAuxiliar[j]<>"."
				matriz[i,j]<-vectorAuxiliar[j]
			SiNo
				j<-largoMaximoPalabras-1
			FinSi
		FinPara
	Fin Para
Fin Funcion

// *****************************************************************************************************************************************************************************

// VALIDACIONES E INGRESOS DE USUARIO

Funcion palabraOK<-ingresarPalabraPersonalizada(cantidadMaximaLetras Por Valor,abecedario Por Referencia)
	contadorCiclos<-0
	Repetir
		Si contadorCiclos>0 Entonces
			Si Longitud(palabraOK)>cantidadMaximaLetras
				Escribir "La palabra ingresada contiene <",(Longitud(palabraOk)-cantidadMaximaLetras),"> caracter/es de más. Ingrese nuevamente su palabra sin estos caracteres: "
			SiNo
				Escribir "La palabra ingresada contiene <",(Longitud(palabraOk)-letrasOk),"> caracter/es especial/es. Ingrese nuevamente su palabra sin estos caracteres: "
			FinSi
		SiNo
			Escribir "Ingrese su palabra con un maximo de <",cantidadMaximaLetras,"> caracteres: "
		FinSi
		Leer palabraOK
		palabraOK<-Mayusculas(palabraOK)
		letrasOK<-0
		Para i<-0 hasta Longitud(palabraOK)-1 Con Paso 1 Hacer
			Para j<-0 Hasta 26 Con Paso 1 Hacer
				Si SubCadena(palabraOK,i,i)=abecedario[j] Entonces
					letrasOK<-letrasOK+1
				FinSi
			FinPara
		FinPara
		contadorCiclos<-contadorCiclos+1
	Mientras Que (Longitud(palabraOK)>cantidadMaximaLetras | Longitud(palabraOK)<>letrasOK)
FinFuncion

Funcion codigoFamilia<-seleccionFamilia
	contadorCiclos<-0
	Repetir
		Limpiar Pantalla
		mostrarMenuFamilias()
		Si contadorCiclos=0 Entonces
			Escribir "Ingrese el codigo de familia a utilizar: "
			
		SiNo
			Escribir "El codigo ingresado <",codigo,"> es invalido. Intente nuevamente"
			Escribir "Ingrese el codigo de familia a utilizar: "
		FinSi
		Leer codigo
		contadorCiclos<-contadorCiclos+1
	Mientras Que (codigo<>"0" Y codigo<>"1" Y codigo<>"2" Y codigo<>"3" Y codigo<>"4" Y codigo<>"5")=Verdadero
	Limpiar Pantalla
	codigoFamilia<-ConvertirANumero(codigo)
FinFuncion

Funcion orientacion<-orientarPalabras
	//         Tabla de valores	  
	// 	*********************************
	// 	*Orientacion  /  Valor Asociado *
	// 	*********************************
	// 	*    1	      /    Horizontal   *
	// 	*    2	      /     Vertical    *
	// 	*    3	      /  Diagonal Asc   *
	// 	*    4	      /  Diagonal Desc  *
	// 	*    5	      /   1 Invertido   *
	// 	*    6	      /   2 Invertido   *
	// 	*    7	      /   3 Invertido   *
	// 	*    8	      /   4 Invertido   *
	// 	********************************* 	
	orientacion<-azar(8)+1
FinFuncion

Funcion colocarPalabra(cantidadPalabras Por Valor, vectorFamilia Por Referencia, grilla Por Referencia, filas Por Valor, columnas Por Valor)
	Reinicio<-0
	Repetir
		Si Reinicio=1 Entonces
			Reinicio<-0
			inicializarMatriz(grilla, filas, columnas)
		FinSi
		Para i<-0 Hasta cantidadPalabras-1 Con Paso 1 Hacer
			orientacion<-orientarPalabras
			Segun orientacion Hacer
				1: 
					Reinicio<-palabraHorizontal(vectorFamilia[i], grilla, filas, columnas, i)
				2:
					Reinicio<-palabraVertical(vectorFamilia[i], grilla, filas, columnas, i)
				3:
					Reinicio<-palabraDiagonalAsc(vectorFamilia[i], grilla, filas, columnas, i)
				4:
					Reinicio<-palabraDiagonalDesc(vectorFamilia[i], grilla, filas, columnas, i)
				5: 
					Reinicio<-palabraHorizontal(invertirPalabra(vectorFamilia[i]), grilla, filas, columnas, i)
				6:
					Reinicio<-palabraVertical(invertirPalabra(vectorFamilia[i]), grilla, filas, columnas, i)
				7:
					Reinicio<-palabraDiagonalAsc(invertirPalabra(vectorFamilia[i]), grilla, filas, columnas, i)
				8:
					Reinicio<-palabraDiagonalDesc(invertirPalabra(vectorFamilia[i]), grilla, filas, columnas, i)
				De Otro Modo:
					Escribir "Error en funcion Colocar Palabra "
			FinSegun
		Fin Para
	Mientras Que Reinicio=1
FinFuncion

Funcion error<-palabraHorizontal(palabra Por Valor, matriz Por Referencia, filas Por Valor, columnas Por Valor, numeroPalabra Por Valor)
	error<-0
	contadorCiclos<-0
	maximoCiclos<-filas*columnas
	Repetir
		colocacionInvalida<-0
		indiceFila<-Azar(filas)
		indiceColumna<-Azar(columnas-longitud(palabra)+1)
		Para i<-indiceColumna Hasta indiceColumna+Longitud(palabra)-1 Con Paso 1 Hacer
			Si matriz[indiceFila,i]<>"-"
				colocacionInvalida<-1
			FinSi
		Fin Para
		contadorCiclos<-contadorCiclos+1
	Hasta Que (colocacionInvalida=0 | contadorCiclos=maximoCiclos)
//	Escribir palabra // testing
//	Escribir Longitud(palabra) // testing
//	Esperar Tecla // testing
	Si contadorCiclos<maximoCiclos Entonces
		Dimensionar vectorAux[Longitud(palabra)]
		palabraAVector(palabra, vectorAux)
		indicePalabra<-0
		Para i<-indiceColumna Hasta (indiceColumna+Longitud(palabra)-1) Con Paso 1 Hacer
			matriz[indiceFila,i]<-vectorAux[indicePalabra]
			indicePalabra<-indicePalabra+1
		Fin Para
	SiNo
		error<-1
	FinSi
FinFuncion

Funcion error<-palabraVertical(palabra Por Valor, matriz Por Referencia, filas Por Valor, columnas Por Valor, numeroPalabra Por Valor)
	contadorCiclos<-0
	maximoCiclos<-filas*columnas
	Repetir
		colocacionInvalida<-0
		indiceFila<-Azar(filas-longitud(palabra)+1)
		indiceColumna<-Azar(columnas)
		Para i<-indiceFila Hasta indiceFila+Longitud(palabra)-1 Con Paso 1 Hacer
			Si matriz[i,indiceColumna]<>"-"
				colocacionInvalida<-1
			FinSi
		Fin Para
		contadorCiclos<-contadorCiclos+1
	Hasta Que (colocacionInvalida=0 | contadorCiclos=maximoCiclos)
//	Escribir palabra // testing
//	Escribir Longitud(palabra) // testing
//	Esperar Tecla // testing
	Si contadorCiclos<maximoCiclos Entonces
		Dimensionar vectorAux[Longitud(palabra)]
		palabraAVector(palabra, vectorAux)
		indicePalabra<-0
		Para i<-indiceFila Hasta (indiceFila+Longitud(palabra)-1) Con Paso 1 Hacer
			matriz[i,indiceColumna]<-vectorAux[indicePalabra]
			indicePalabra<-indicePalabra+1
		Fin Para
	SiNo
		error<-1
		Escribir error
	FinSi
	
FinFuncion

Funcion error<-palabraDiagonalDesc(palabra Por Valor, matriz Por Referencia, filas Por Valor, columnas Por Valor, numeroPalabra Por Valor)
	contadorCiclos<-0
	maximoCiclos<-filas*columnas
	Repetir
		colocacionInvalida<-0
		indiceFila<-Azar(filas-longitud(palabra)+1)
		indiceColumna<-Azar(columnas-longitud(palabra)+1)
		auxFila<-indiceFila
		auxColumna<-indiceColumna
		Para i<-indiceFila Hasta indiceFila+Longitud(palabra)-1 Con Paso 1 Hacer
			Si matriz[auxFila,auxColumna]<>"-"
				colocacionInvalida<-1
				i<-indiceFila+Longitud(palabra) // Sale del ciclo for, si una letra no se puede colocar no tiene sentido seguir evaluando el resto de letras
			FinSi
			auxFila<-auxFila+1
			auxColumna<-auxColumna+1
		Fin Para
		contadorCiclos<-contadorCiclos+1
	Hasta Que (colocacionInvalida=0 | contadorCiclos=maximoCiclos)
//	Escribir palabra // testing
//	Escribir Longitud(palabra) // testing
//	Esperar Tecla // testing
	Si contadorCiclos<maximoCiclos Entonces
		Dimensionar vectorAux[Longitud(palabra)]
		palabraAVector(palabra, vectorAux)
		indicePalabra<-0
		auxFila<-indiceFila
		auxColumna<-indiceColumna
		Para i<-indiceFila Hasta (indiceFila+Longitud(palabra)-1) Con Paso 1 Hacer
			matriz[auxFila,auxColumna]<-vectorAux[indicePalabra]
			indicePalabra<-indicePalabra+1
			auxFila<-auxFila+1
			auxColumna<-auxColumna+1
		Fin Para
	SiNo
		error<-1
	FinSi
FinFuncion

Funcion error<-palabraDiagonalAsc(palabra Por Valor, matriz Por Referencia, filas Por Valor, columnas Por Valor, numeroPalabra Por Valor)
	columnaInicialMaxima<-columnas-Longitud(palabra) 
	filaInicialMinima<-Longitud(palabra)-1
	contadorCiclos<-0
	maximoCiclos<-filas*columnas
	Repetir
		posicionInvalida<-0
		indiceFila<-azar(filas-Longitud(palabra)+1)+filaInicialMinima
		indiceColumna<-azar(columnaInicialMaxima+1)
		auxindiceFila<-indiceFila
		auxindiceColumna<-indiceColumna
		Para i<-0 Hasta Longitud(palabra)-1 Con Paso 1 Hacer
			Si matriz[auxindiceFila,auxindiceColumna]<>"-" Entonces
				posicionInvalida<-1
				i<-Longitud(palabra) // Sale del ciclo for, si una letra no se puede colocar no tiene sentido seguir evaluando el resto de letras
			FinSi
			auxindiceFila<-AuxindiceFila-1
			auxindiceColumna<-AuxindiceColumna+1
		FinPara
		contadorCiclos<-contadorCiclos+1
	Mientras Que (posicionInvalida=1 & contadorCiclos<maximoCiclos)
//	Escribir palabra // testing
//	Escribir Longitud(palabra) // testing
//	Esperar Tecla // testing
	Si contadorCiclos<maximoCiclos Entonces
		auxindiceFila<-indiceFila
		auxindiceColumna<-indiceColumna
		Para i<-0 Hasta Longitud(palabra)-1 Con Paso 1 Hacer
			matriz[indiceFila,indiceColumna]<-Mayusculas(Subcadena(palabra,i,i))
			indiceFila<-indiceFila-1
			indiceColumna<-indiceColumna+1
		FinPara
	SiNo
		error<-1
		Escribir error
	FinSi
FinFuncion

Funcion palabraEncontrada<-buscarEnSeleccion(grilla Por Referencia, vectorPalabras Por Referencia, palabrasUtilizadas Por Valor, indicePalabraEncontrada Por Referencia, avanceFilas Por Valor, avanceColumnas Por Valor, filaInicial Por Valor, filaFinal Por Valor, columnaInicial Por Valor, columnaFinal Por Valor)
	Si avanceFilas<>0 Entonces
		largo<-abs(filaFinal-filaInicial)
	SiNo
		largo<-abs(columnaFinal-columnaInicial)
	FinSi
	Para i<-0 Hasta palabrasUtilizadas-1 Con Paso 1 Hacer
//		Escribir ""
//		Escribir "soy la palabra ",vectorPalabras[i]
//		Escribir ""
		letraOK<-0
		contadorCiclos<-0
		fila<-filaInicial
		columna<-columnaInicial
		Para j<-0 Hasta largo Con Paso 1 Hacer
//			Escribir ""
//			Escribir "soy la palabra ",i
//			Escribir "soy la fila en la grilla ",fila
//			Escribir "soy la columna en la grilla ",columna
//			Escribir ""
			Si Mayusculas(Subcadena(vectorPalabras[i],j,j))=grilla[fila, columna] Entonces
				letraOK<-letraOK+1
			FinSi
			Si letraOK=Longitud(vectorPalabras[i])
				palabraEncontrada<-1
				indicePalabraEncontrada<-i
				i<-palabrasUtilizadas // para no seguir buscando en caso de encontrar la palabra
			FinSi
			fila<-fila+avanceFilas
			columna<-columna+avanceColumnas
		Fin Para
	Fin Para
	Si palabraEncontrada=1 Entonces
		fila<-filaInicial
		columna<-columnaInicial
		Para j<-0 Hasta largo Con Paso 1 Hacer
			grilla[fila,columna]<-"-"
			fila<-fila+avanceFilas
			columna<-columna+avanceColumnas
		Fin Para
	FinSi
Fin Funcion

Funcion avances(avanceColumnas Por Referencia, avanceFilas Por Referencia, cambioFilas Por Valor, cambioColumnas Por Valor)
	Si cambioFilas=0 Entonces
		avanceFilas<-0
		Si cambioColumnas<0 Entonces
			avanceColumnas<-(-1)
		SiNo
			avanceColumnas<-1
		FinSi
	SiNo
		Si cambioColumnas=0 Entonces
			avanceColumnas<-0
			Si cambioFilas<0 Entonces
				avanceFilas<-(-1)
			SiNo
				avanceFilas<-(1)
			FinSi
		SiNo
			Si cambioFilas>0 & cambioColumnas>0 Entonces
				// Diagonal Desc
				avanceFilas<-1
				avanceColumnas<-1
			SiNo
				Si cambioFilas<0 & cambioColumnas<0 Entonces
					// Diagonal Desc Invertida
					avanceFilas<-(-1)
					avanceColumnas<-(-1)
				SiNo
					Si cambioFilas>0 & cambioColumnas<0 Entonces
						// Diagonal Ascendente Invertida
						avanceFilas<-1
						avanceColumnas<-(-1)
					SiNo
						// Diagonal Ascendente 
						avanceFilas<-(-1)
						avanceColumnas<-1
					FinSi
				FinSi
			FinSi				
		FinSi
	FinSi
Fin Funcion

Funcion titulo(seg)
	Limpiar Pantalla
	Escribir ""
	Escribir ""
	Escribir ""
	Escribir ""
	Escribir ""
	Escribir "                  .----------------.  .----------------.  .----------------.  .----------------.    .----------------.  .----------------.                  "
	Escribir "                 | .--------------. || .--------------. || .--------------. || .--------------. |  | .--------------. || .--------------. |                 "
	Escribir "                 | |    _______   | || |     ____     | || |   ______     | || |      __      | |  | |  ________    | || |  _________   | |                 "
	Escribir "                 | |   /  ___  |  | || |   .´    `.   | || |  |_   __ \   | || |     /  \     | |  | | |_   ___ `.  | || | |_   ___  |  | |                 "
	Escribir "                 | |  |  (__ \_|  | || |  /  .--.  \  | || |    | |__) |  | || |    / /\ \    | |  | |   | |   `. \ | || |   | |_  \_|  | |                 "
	Escribir "                 | |   `.___`-.   | || |  | |    | |  | || |    |  ___/   | || |   / ____ \   | |  | |   | |    | | | || |   |  _|  _   | |                 "
	Escribir "                 | |  |`\____) |  | || |  \  `--´  /  | || |   _| |_      | || | _/ /    \ \_ | |  | |  _| |___.´ / | || |  _| |___/ |  | |                 "
	Escribir "                 | |  |_______.´  | || |   `.____.´   | || |  |_____|     | || ||____|  |____|| |  | | |________.´  | || | |_________|  | |                 "
	Escribir "                 | |              | || |              | || |              | || |              | |  | |              | || |              | |                 "
	Escribir "                 | `--------------´ || `--------------´ || `--------------´ || `--------------´ |  | `--------------´ || `--------------´ |                 "
	Escribir "                  `----------------´  `----------------´  `----------------´  `----------------´    `----------------´  `----------------´                  "
	Escribir "                   .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.                   "
	Escribir "                  | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |                  "
	Escribir "                  | |   _____      | || |  _________   | || |  _________   | || |  _______     | || |      __      | || |    _______   | |                  "
	Escribir "                  | |  |_   _|     | || | |_   ___  |  | || | |  _   _  |  | || | |_   __ \    | || |     /  \     | || |   /  ___  |  | |                  "
	Escribir "                  | |    | |       | || |   | |_  \_|  | || | |_/ | | \_|  | || |   | |__) |   | || |    / /\ \    | || |  |  (__ \_|  | |                  "
	Escribir "                  | |    | |   _   | || |   |  _|  _   | || |     | |      | || |   |  __ /    | || |   / ____ \   | || |   `.___`-.   | |                  "
	Escribir "                  | |   _| |__/ |  | || |  _| |___/ |  | || |    _| |_     | || |  _| |  \ \_  | || | _/ /    \ \_ | || |  |`\____) |  | |                  "
	Escribir "                  | |  |________|  | || | |_________|  | || |   |_____|    | || | |____| |___| | || ||____|  |____|| || |  |_______.´  | |                  "
	Escribir "                  | |              | || |              | || |              | || |              | || |              | || |              | |                  "
	Escribir "                  | `--------------´ || `--------------´ || `--------------´ || `--------------´ || `--------------´ || `--------------´ |                  "
	Escribir "                   `----------------´  `----------------´  `----------------´  `----------------´  `----------------´  `----------------´                   "
	Escribir ""
	Escribir ""
	Escribir ""
	Escribir ""
	Escribir ""
	Esperar seg Segundos
	Limpiar Pantalla
Fin Funcion

Funcion buscarPalabras(vectorPalabras Por Referencia, palabrasUtilizadas Por Valor, grilla Por Referencia, filas Por Valor, columnas Por Valor, vNumeros Por Referencia, nNumeros Por Valor)
	Dimensionar vectorPalabrasEncontradas[palabrasUtilizadas]
	Repetir
		contadorCiclos<-0
		Repetir
			Limpiar Pantalla
			mostrarMatriz(grilla, filas, columnas)
			Escribir "Listado de palabras a encontrar: "
			Para i<-0 Hasta palabrasUtilizadas-1 Con Paso 1 Hacer
				Si vectorPalabras[i]<>vectorPalabrasEncontradas[i] Entonces
					Escribir "- ",vectorPalabras[i]
				FinSi
			FinPara
			Si contadorCiclos>0 Entonces
				Si (cambioFilas=0 & cambioColumnas=0) Entonces
					Escribir "Usted selecciono la misma celda como principio y fin de su seleccion. Intente nuevamente."
				SiNo
					Escribir "Las diagonales pueden ser en cualquier sentido, sin embargo deben formar un angulo de 45°. Intente nuevamente."
				FinSi
			FinSi
			filaInicial<-Verificacion(vNumeros, nNumeros, filas, "fila inicial")
			columnaInicial<-Verificacion(vNumeros, nNumeros, columnas, "columna inicial")
			filaFinal<-Verificacion(vNumeros, nNumeros, filas, "fila final")
			columnaFinal<-Verificacion(vNumeros, nNumeros, columnas, "columna final")
			cambioFilas<-filaFinal-filaInicial
			cambioColumnas<-columnaFinal-columnaInicial
			contadorCiclos<-contadorCiclos+1
		Mientras Que (cambioFilas=0 & cambioColumnas=0) | (abs(cambioFilas)>0 & abs(cambioColumnas)>0 & abs(cambioColumnas)<>abs(cambioFilas))
		
//		Escribir "filaInicial ",filaInicial // testing
//		Escribir "columnaInicial ",columnaInicial // testing
//		Escribir "filaFinal ",filaFinal // testing
//		Escribir "columnaFinal ",columnaFinal // testing
		
		avances(avanceColumnas, avanceFilas, cambioFilas, cambioColumnas)
		
		cantidadPalabrasEncontradas<-0
		
		indicePalabraEncontrada<--1
		
		palabraEncontradaEnEstaRonda<-0
		
		palabraEncontradaEnEstaRonda<-buscarEnSeleccion(grilla, vectorPalabras, palabrasUtilizadas, indicePalabraEncontrada, avanceFilas, avanceColumnas, filaInicial, filaFinal, columnaInicial, columnaFinal)
		
		
		Si palabraEncontradaEnEstaRonda=0 & indicePalabraEncontrada=-1 Entonces
			Escribir "No se encontraron palabras en tu seleccion."
		SiNo
			vectorPalabrasEncontradas[indicePalabraEncontrada]<-vectorPalabras[indicePalabraEncontrada]
			Escribir "¡Felicitaciones! Encontraste la palabra: ",vectorPalabrasEncontradas[indicePalabraEncontrada]
			Para i<-0 Hasta palabrasUtilizadas-1 Con Paso 1 Hacer
				Si vectorPalabras[i]=vectorPalabrasEncontradas[i] Entonces
					cantidadPalabrasEncontradas<-cantidadPalabrasEncontradas+1
				FinSi
			Fin Para
		FinSi
		Si cantidadPalabrasEncontradas<>palabrasUtilizadas Entonces
			Escribir "¿Desea seguir buscando palabras? Ingrese <me rindo> para salir, cualquier otro ingreso continuara con la búsqueda"
			Leer seguir
			seguir<-Mayusculas(seguir)
		FinSi
	Mientras Que seguir<>"ME RINDO" & cantidadPalabrasEncontradas<>palabrasUtilizadas
	
	Si cantidadPalabrasEncontradas=palabrasUtilizadas Entonces
		Limpiar Pantalla
		Escribir "¡GANASTE!"
	SiNo
		Limpiar Pantalla
		Escribir "Te rendiste :("
	FinSi
	
Fin Funcion

Funcion posicion<-Verificacion(vNumeros Por Referencia, nNumeros Por Valor, posiciones Por Valor, stringFilaColumna Por Valor)
	Definir auxPosicion Como Caracter
	contadorCiclos<-0
	Repetir
		digitosOK<-0
		Si contadorCiclos=0 Entonces
			Escribir "Ingrese el valor de la ",stringFilaColumna," (valor posibles entre 1 y ",posiciones,"): "
		SiNo
			Escribir "El valor ingresado no es valido, intente nuevamente (valor posibles entre 1 y ",posiciones,"): "
		FinSi
		Leer auxPosicion
		Para i<-0 Hasta Longitud(auxPosicion)-1 Con Paso 1 Hacer
			Para j<-0 Hasta nNumeros-1 Con Paso 1 Hacer
				Si vNumeros[j]=Subcadena(auxPosicion,i,i) Entonces
					digitosOK<-digitosOk+1
				FinSi
			FinPara
		Fin Para
		Si digitosOK=Longitud(auxPosicion) Entonces
			posicion<-ConvertirANumero(auxPosicion)-1
		FinSi
		contadorCiclos<-contadorCiclos+1
	Mientras Que digitosOK<>Longitud(auxPosicion) | posicion<0 | posicion>posiciones-1
Fin Funcion

Funcion mostrarMatriz(grilla Por Referencia, filas Por Valor, columnas Por Valor)
	Para i<-0 Hasta filas-1 Con Paso 1 Hacer
		digitos<-Longitud(ConvertirATexto(i+1))
		Si i=0 Entonces
			Escribir Sin Saltar "                            "
		FinSi
		Si i=9 Entonces
			Escribir Sin Saltar " "
		FinSi
		Si digitos>1 Entonces
			Escribir Sin Saltar "   ", trunc((i+1)/10)," ",(i+1) mod 10
		SiNo
			Escribir Sin Saltar "     ", i+1
		FinSi
	FinPara
	Escribir ""
	Para i<-0 Hasta filas-1 Con Paso 1 Hacer
		Escribir Sin Saltar "                            "
		Para j<-0 Hasta columnas-1 Con Paso 1 Hacer
			Escribir Sin Saltar "     ", grilla[i,j] 
		Fin Para
		Escribir Sin Saltar "     ",i+1
		Escribir ""
		Escribir ""
	Fin Para
FinFuncion

// *****************************************************************************************************************************************************************************

// Cubiletes

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
    contadorCiclos<-0
	Repetir
		Si contadorCiclos>0 Entonces
			Escribir "El ingreso <",auxeleccionJugador,"> no es un ingreso valido. Por favor intente nuevamente:"
		FinSi
		Leer auxeleccionJugador
		numeroOK<-0
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
	Definir continuar Como Real
    Definir auxContinuar Como Caracter
    Escribir "¿Querés jugar de nuevo? (1 = Sí, 0 = No): "
	
	contadorCiclos<-0
	Repetir
		Si contadorCiclos>0 Entonces
			Escribir "El ingreso <",auxContinuar,"> no es un ingreso valido. Por favor intente nuevamente:"
		FinSi
		Leer auxContinuar
		numeroOK<-0
		Para i<-0 hasta Longitud(auxContinuar)-1 Hacer
			Si Subcadena(auxContinuar,i,i)="0" | Subcadena(auxContinuar,i,i)="1" Entonces
				numeroOK<-numeroOK+1
			FinSi
		FinPara
		contadorCiclos<-contadorCiclos+1
	Mientras Que numeroOK<>Longitud(auxContinuar) y (auxContinuar<>"0" | auxContinuar <>"1")
	
	continuar<-ConvertirANumero(auxContinuar)
Fin Funcion

Funcion DescubrirLaPelota
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
FinFuncion


// *****************************************************************************************************************************************************************************

// PROGRAMA PRINCIPAL (MAIN)

Algoritmo Kermes
	cantNumeros<-10
	Dimensionar vecNum[cantNumeros]
	llenarNumeros(vecNum)
	Repetir
		Limpiar Pantalla
		contadorCiclo<-0
		Repetir
			Limpiar Pantalla
			caracterValido<-0
			mostrarMenuGeneral()
			Leer auxOp
			Para i<-0 Hasta Longitud(auxOp) Con Paso 1 Hacer
				Para j<-0 hasta cantNumeros-1 Con Paso 1 Hacer
					Si Subcadena(auxOp,i,i)=vecNum[j] Entonces
						caracterValido<-caracterValido+1
					FinSi
				FinPara
			Fin Para
			contadorCiclo<-contadorCiclo+1
		Mientras Que Longitud(auxOp)<>caracterValido
		op<-ConvertirANumero(auxOp)
		Segun op Hacer
			0: 
				animacionTexto("Muchas gracias por jugar. Saliendo del programa",".",3)
			1:
				DescubrirLaPelota()
			2:
				titulo(7)
				Repetir
					sopaDeLetras()
					Escribir "¿Desea jugar nuevamente? Escriba <no> para salir. Cualquier otro ingreso continuara con el juego."
					Leer seguir
					seguir<-Mayusculas(seguir)
					Si seguir="NO" Entonces
						animacionTexto("Saliendo del juego",".",3)
					FinSi
				Mientras Que seguir<>"NO"
			De Otro Modo:
				Escribir "Ingreso incorrecto vuelva a intentarlo."
		FinSegun
	Mientras Que op<>0
FinAlgoritmo


