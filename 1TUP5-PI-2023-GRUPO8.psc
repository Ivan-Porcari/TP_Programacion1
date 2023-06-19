Proceso principal //Ledesma Thomas, Porcari Ivan, Pradenas Jordan
	//El objetivo de este trabajo práctico es desarrollar un sistema de gestión para un gimnasio que cumpla con los siguientes requisitos: carga de datos, búsqueda, ordenamiento y generación de listados.
	Definir opc, n_clientes, telefono, edad, n_membresia, tipo_membresia, i Como Entero;
	Definir membresia_paga, socios_cargados Como Logico
	Definir nombre, direccion, continuar Como Caracter
	socios_cargados = falso
	Repetir
		Limpiar Pantalla
		Escribir "MENU";
		Escribir "1-> Cargar Datos Clientes";
		Escribir "2-> Buscar Datos Cliente por DNI";
		Escribir "3-> Ordenar Datos Clientes";
		Escribir "4-> Mostrar Listado";
		Escribir "5-> Salir" 
		Escribir "Seleccione la opcion que desea realizar:";
		
		Leer opc;
		Si opc < 1 o opc > 5 Entonces 
			Escribir "Opción no válida. Ingresela nuevamente";
			opc = 6
		SiNo
			si (opc <> 1 y opc <> 5) y socios_cargados == Falso
				Limpiar Pantalla
				Escribir "Aún no se han cargado los socios, presione enter para continuar"
				leer continuar
				opc = 6
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
				Dimension n_membresia[n_clientes+1]; // entero, identificación del gimansio
				Dimension membresia_paga[n_clientes+1]; //booleano, verdadero: paga, falso: debe la cuota
				Dimension tipo_membresia[n_clientes+1]; //entero, 1 = estandar, 2 = clases, 3 = premium
				cargarDatos(nombre, direccion, telefono, edad, n_membresia, estado_membresia, tipo_membresia, n_clientes);
				socios_cargados = Verdadero
		FinSegun
	Hasta Que opc = 5
	
FinProceso
// carga de datos 
SubProceso cargarDatos(nombre Por Referencia, direccion Por Referencia, telefono Por Referencia, edad Por Referencia, n_membresia Por Referencia, membresia_paga Por Referencia, tipo_membresia Por Referencia, n_clientes)
	
	Para i <- 1 Hasta n_clientes Con Paso 1 Hacer
		Escribir "Ingrese nombre del cliente ", i, ": ";
		Leer nombre[i];
		Escribir "Ingrese direccion del cliente ", i, ": ";
		Leer direccion[i];
		Escribir "Ingrese telefono del cliente ", i, ": ";
		Leer telefono[i];
		Escribir "Ingrese edad del cliente ", i, ": ";
		Leer edad[i];
		Escribir "Ingrese numero de membresia del cliente ", i, ": ";
		Leer n_membresia[i];
		Escribir "Ingrese estado membresia del cliente ", i, ": ";
		Leer membresia_paga[i];
		Escribir "Ingrese tipo membresia del cliente ", i, ": ";
		Leer tipo_membresia[i];
	FinPara
FinSubProceso


