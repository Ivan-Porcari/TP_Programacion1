Proceso principal //Ledesma Thomas, Porcari Ivan, Pradenas Jordan
	//El objetivo de este trabajo práctico es desarrollar un sistema de gestión para un gimnasio que cumpla con los siguientes requisitos: carga de datos, búsqueda, ordenamiento y generación de listados.
	Definir opc, n_clientes, telefono, edad, dni, i Como Entero;
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
			FinSi
		FinSi
		
		
		Segun opc Hacer
			1:
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
				Dimension membresia_paga[n_clientes+1]; //entero, 1: paga, 2: debe la cuota del mes
				Dimension tipo_membresia[n_clientes+1]; //cadena, 1 = estandar, 2 = clases, 3 = premium
				cargarDatos(nombre, direccion, telefono, edad, dni, membresia_paga, tipo_membresia, n_clientes);
				socios_cargados = Verdadero;
			2: 
				buscarDni(nombre, direccion, telefono, edad, dni, membresia_paga, tipo_membresia, n_clientes);
		FinSegun
	Hasta Que opc = 5
	
FinProceso
// carga de datos 
SubProceso cargarDatos(nombre Por Referencia, direccion Por Referencia, telefono Por Referencia, edad Por Referencia, dni Por Referencia, membresia_paga Por Referencia, tipo_membresia Por Referencia, n_clientes)
	
	Para i <- 1 Hasta n_clientes Con Paso 1 Hacer
		Escribir "Ingrese nombre del cliente ", i, ": ";
		Leer nombre[i];
		Escribir "Ingrese direccion del cliente ", i, ": ";
		Leer direccion[i];
		Escribir "Ingrese telefono del cliente ", i, ": ";
		Leer telefono[i];
		Escribir "Ingrese edad del cliente ", i, ": ";
		Leer edad[i];
		Escribir "Ingrese el DNI del cliente ", i, ": ";
		Leer dni[i];
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
		Escribir "nombre: ", nombre[i-1]
		Escribir "dni: ", dni[i-1]
		Escribir "direccion: ", direccion[i-1]
		Escribir "edad: ", edad[i-1]
		Escribir "tipo de membresia: ", tipo_membresia[i-1]
		Escribir "estado de cuenta: ", membresia_paga[i-1]
		Escribir "telefono: ", telefono[i-1]
		leer continuar
	SiNo
		Escribir "dni no encontrado"
		leer continuar
	FinSi
finSubProceso 



