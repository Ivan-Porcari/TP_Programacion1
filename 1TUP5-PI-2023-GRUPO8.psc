Proceso principal //Ledesma Thomas, Porcari Ivan, Pradenas Jordan
	//El objetivo de este trabajo práctico es desarrollar un sistema de gestión para un gimnasio que cumpla con los siguientes requisitos: carga de datos, búsqueda, ordenamiento y generación de listados.
	Definir opc,opc_ordenar, n_clientes, telefono, edad, dni, i Como Entero;
	Definir socios_cargados Como Logico;
	Definir nombre, direccion, continuar, tipo_membresia, membresia_paga Como Caracter;
	socios_cargados = falso;
	Repetir
		Limpiar Pantalla;
		Escribir "MENU";
		Escribir "1-> Cargar Datos Clientes";
		Escribir "2-> Buscar Datos Cliente por DNI";
		Escribir "3-> Ordenar Datos Clientes";
		Escribir "4-> Mostrar Listado";
		Escribir "5-> Salir";
		Escribir "Seleccione la opcion que desea realizar:";
		
		Leer opc;
		Si opc < 1 o opc > 5 Entonces 
			Escribir "Opción no válida. Ingresela nuevamente";
			opc = 6;
		SiNo
			si (opc <> 1 y opc <> 5) y socios_cargados == Falso
				Limpiar Pantalla
				Escribir "Aún no se han cargado los socios, presione enter para continuar"
				leer continuar;
				opc = 6;
			SiNo
				si opc == 1 y socios_cargados == Verdadero
					Escribir "ya se han ingresado los datos de los socios";
					leer continuar;
					opc = 6;
				FinSi
			FinSi
		FinSi
		
		Segun opc Hacer
			1:			///carga de socios
				Repetir
					Escribir "Ingrese la cantidad de clientes que desea cargar:";
					Leer n_clientes;
					Si n_clientes < 0 Entonces
						Escribir "La cantidad de clientes a ingresar debe ser mayor a 0";
					FinSi
				Hasta Que n_clientes > 0
				Dimension nombre[n_clientes+1]; // cadena, nombre del cliente
				Dimension direccion[n_clientes+1]; // cadena
				Dimension telefono[n_clientes+1]; // entero
				Dimension edad[n_clientes+1]; //entero
				Dimension dni[n_clientes+1]; // entero, identificación del gimansio
				Dimension membresia_paga[n_clientes+1]; //cadena, 1: paga, 2: debe la cuota del mes
				Dimension tipo_membresia[n_clientes+1]; //cadena, 1 = estandar, 2 = clases, 3 = premium
				cargarDatos(nombre, direccion, telefono, edad, dni, membresia_paga, tipo_membresia, n_clientes);
				socios_cargados = Verdadero;
			2: 
				buscarDni(nombre, direccion, telefono, edad, dni, membresia_paga, tipo_membresia, n_clientes); /// busqueda por dni
				
			3:	
				Escribir "SUBMENU ORDENAR";
				Escribir "1-> Ordenar Por DNI Ascendente";
				Escribir "2-> Ordenar Por DNI Descendente";
				Escribir "3-> Ordenar Por Nombre Ascendente";
				Escribir "4-> Ordenar Por Nombre Descendente";
				Escribir "5-> Ordenar Por Direccion Ascendente";
				Escribir "6-> Ordenar Por Direccion Descendente";
				Escribir "7-> Ordenar Por Estado Membresia Ascendente";
				Escribir "8-> Ordenar Por Estado Membresia Descendente";
				Escribir "Seleccione la opcion que desea realizar:";
				Leer opc_ordenar;
				
				ordenamientoLista(nombre, direccion, telefono, edad, dni, membresia_paga, tipo_membresia, n_clientes, opc_ordenar); ///Tipo de ordenamiento para el Listado
								
			4: 	mostrarListado(nombre, dni, membresia_paga, direccion, telefono,  n_clientes)   ///muestreo de listado
			
		FinSegun
	Hasta Que opc = 5
	
FinProceso

/// carga de datos 
SubProceso cargarDatos(nombre Por Referencia, direccion Por Referencia, telefono Por Referencia, edad Por Referencia, dni Por Referencia, membresia_paga Por Referencia, tipo_membresia Por Referencia, n_clientes)
	
	definir dniIngresado, i, j, k, validacion Como Entero
	definir dniInvalido Como Logico
	Definir continuar como cadena
	Para j <- 1 Hasta n_clientes con paso 1 Hacer //rellena el vector de dni's con la los numeros del 1 hasta n_clientes, para que no salte un error al comprobar si ya fue ingresado ese dni con anterioridad
		dni[j] = j;
	FinPara
	
	Para i <- 1 Hasta n_clientes Con Paso 1 Hacer
		Escribir "Ingrese nombre del cliente ", i, ": ";
		Leer nombre[i];
		Escribir "Ingrese direccion del cliente ", i, ": ";
		Leer direccion[i];
		Escribir "Ingrese telefono del cliente ", i, ": ";
		Leer telefono[i];
		Escribir "Ingrese edad del cliente ", i, ": ";
		Leer edad[i];
		Hacer //desde acá hasta la linea 106 se comprueba 1: si el DNI está dentro de un rango valido y 2: si el dni ya fue ingresado con anterioridad
			k = 1
			dniInvalido = Falso
			Escribir "Ingrese el DNI del cliente ", i, ": ";
			Leer dniIngresado;
			si dniIngresado < 1000000 o dniIngresado > 99999999//comprueba que el dni contenga 8 digitos
				dniInvalido = Verdadero
			FinSi
			Mientras k <= n_clientes y dniInvalido == Falso // si el bucle ya se ejecuto una vez por cada cliente o se comprueba que el dni es falso, no se ejecuta este bucle, así recorre solo lo necesario
				si dniIngresado == dni[k]
					dniInvalido = Verdadero
				FinSi
				k = k + 1
			FinMientras
			si dniInvalido = Verdadero
				Escribir "dni no valido o ya en uso, presione enter e intente de nuevo"
				leer continuar
			SiNo
				dni[i] = dniIngresado
			FinSi
		Mientras Que dniInvalido == Verdadero o k <= n_clientes
		Hacer
		Limpiar Pantalla
		Escribir "Ingrese estado membresia del cliente ", i, ": ";
		Escribir "1: paga"
		Escribir "2: debe este mes"
			Leer validacion
			si validacion < 1 o validacion > 2
				Escribir "opción no valida, presione enter para continuar"
				leer continuar
				validacion = 3;
			SiNo
				Segun validacion	
					1:
						membresia_paga[i] = "pago";
					2:
						membresia_paga[i] = "debe el mes";
				FinSegun
			FinSi
		Hasta Que validacion <> 3
		Hacer
			Limpiar Pantalla
			Escribir "Ingrese tipo membresia del cliente ", i, ": ";
			Escribir "1: estandar"
			Escribir "2: clase de zumba"
			Escribir "3: premium"
			Leer validacion;
			si validacion < 1 o validacion > 3
				Escribir "opción no valida, presione enter para continuar";
				leer continuar;
				validacion = 4;
			SiNo
				Segun validacion	
					1:
						tipo_membresia[i] = "estandar";
					2:
						tipo_membresia[i] = "clases de zumba";
					3:
						tipo_membresia[i] = "premium";
				FinSegun
				
			FinSi
		Hasta Que validacion <> 4
	FinPara
FinSubProceso


/// proceso busqueda de DNI
SubProceso buscarDni(nombre Por Referencia, direccion Por Referencia, telefono Por Referencia, edad Por Referencia, dni Por Referencia, membresia_paga Por Referencia, tipo_membresia Por Referencia, n_clientes)
	Definir i, dniBuscado Como Entero
	Definir dniEncontrado Como Logico
	dniEncontrado = Falso
	i = 1
	Escribir "ingrese el dni que busca"
	Leer dniBuscado
	Mientras i <= n_clientes y dniEncontrado == Falso
		si dniBuscado == dni[i]
			dniEncontrado = Verdadero
		FinSi
		i = i + 1
	FinMientras
	si dniEncontrado == Verdadero
		Escribir "nombre: ", nombre[i-1];
		Escribir "dni: ", dni[i-1];
		Escribir "direccion: ", direccion[i-1];
		Escribir "edad: ", edad[i-1];
		Escribir "tipo de membresia: ", tipo_membresia[i-1];
		Escribir "estado de cuenta: ", membresia_paga[i-1];
		Escribir "telefono: ", telefono[i-1];
		leer continuar;
	SiNo
		Escribir "dni no encontrado";
		leer continuar;
	FinSi
finSubProceso 

///proceso de mostrar listado
subproceso mostrarListado(nombre Por Referencia, dni Por Referencia, membresia_paga Por Referencia, direccion Por Referencia, telefono Por Referencia, n_clientes)
	
	definir i Como Entero;
	definir continuar Como Caracter;
	Limpiar Pantalla
	
	i = 1
	
	para i <- 1 hasta n_clientes con paso 1 Hacer
		Escribir "Nombre: ", nombre[i], " - DNI: ", dni[i], " - Direccion: ", direccion[i], " - Telefono: ", telefono[i], " - Estado: ", membresia_paga[i];
	FinPara
	Escribir "Presione Enter para continuar";
	leer continuar
	
FinSubProceso

///proceso de ordenamiento
SubProceso ordenamientoLista(nombre Por Referencia, direccion Por Referencia, telefono Por Referencia, edad Por Referencia, dni Por Referencia, membresia_paga Por Referencia, tipo_membresia Por Referencia, n_clientes, opc_ordenar)
	
	definir i, j, posMM, aux_dni, aux_telefono, aux_edad Como Entero
	definir aux_nombre, aux_dir, aux_membresia, aux_tipo Como Caracter
	
	para i = 1 hasta n_clientes -1 Hacer
		
		posMM = i;
		
		Segun opc_ordenar Hacer
			1: 
				para j = i+1 hasta n_clientes Hacer
					
					si dni[j] < dni[posMM] Entonces
						posMM = j
					FinSi
					
				FinPara
			2:
				para j = i+1 hasta n_clientes Hacer
					
					si dni[j] > dni[posMM] Entonces
						posMM = j
					FinSi
					
				FinPara
			3:
				para j = i+1 hasta n_clientes Hacer
					
					si nombre[j] < nombre[posMM] Entonces
						posMM = j
					FinSi
					
				FinPara
			4:
				para j = i+1 hasta n_clientes Hacer
					
					si nombre[j] > nombre[posMM] Entonces
						posMM = j
					FinSi
					
				FinPara
			5:
				para j = i+1 hasta n_clientes Hacer
					
					si direccion[j] < direccion[posMM] Entonces
						posMM = j
					FinSi
					
				FinPara
			6:
				para j = i+1 hasta n_clientes Hacer
					
					si direccion[j] > direccion[posMM] Entonces
						posMM = j
					FinSi
					
				FinPara
			7:
				para j = i+1 hasta n_clientes Hacer
					
					si membresia_paga[j] < membresia_paga[posMM] Entonces
						posMM = j
					FinSi
					
				FinPara
			6:
				para j = i+1 hasta n_clientes Hacer
					
					si membresia_paga[j] > membresia_paga[posMM] Entonces
						posMM = j
					FinSi
					
				FinPara
			De Otro Modo:
				Escribir "Seleccion Invalida";
		FinSegun
		
		
		aux_dni = dni[i]
		dni[i] = dni[PosMM]
		dni[PosMM] = aux_dni
		
		aux_nombre = nombre[i]
		nombre[i] = nombre[PosMM]
		nombre[PosMM] = aux_nombre
		
		aux_telefono = telefono[i]
		telefono[i] = telefono[PosMM]
		telefono[PosMM] = aux_telefono
		
		aux_dir = direccion[i]
		direccion[i] = direccion[PosMM]
		direccion[PosMM] = aux_dir
		
		aux_edad = edad[i]
		edad[i] = edad[PosMM]
		edad[PosMM] = aux_edad
		
		aux_membresia = membresia_paga[i]
		membresia_paga[i] = membresia_paga[PosMM]
		membresia_paga[PosMM] = aux_membresia
		
		aux_tipo = tipo_membresia[i]
		tipo_membresia[i] = tipo_membresia[PosMM]
		tipo_membresia[PosMM] = aux_tipo
		
	FinPara
	
FinSubProceso

