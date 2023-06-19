Proceso principal //Ledesma Thomas, Porcari Ivan, Pradenas Jordan
	//El objetivo de este trabajo práctico es desarrollar un sistema de gestión para un gimnasio que cumpla con los siguientes requisitos: carga de datos, búsqueda, ordenamiento y generación de listados.
	Definir opc, n_clientes, i Como Entero;
	
	
	Repetir
		Escribir "MENU";
		Escribir "1-> Cargar Datos Clientes";
		Escribir "2-> Buscar Datos Cliente por DNI";
		Escribir "3-> Ordenar Datos Clientes";
		Escribir "4-> Mostrar Listado";
		Escribir "Seleccione la opcion que desea realizar:";
		
		Leer opc;
		Si opc < 1 o opc > 5 Entonces 
			Escribir "Opción no válida. Ingresela nuevamente";
		FinSi
		
		Segun opc Hacer
			1:
				Repetir
					Escribir "Ingrese la cantidad de clientes que desea cargar:";
					Leer n_clientes;
					Si n < 1 Entonces
						Escribir "La cantidad de clientes a ingresar debe ser mayor a 0";
					FinSi
				Hasta Que n_clientes > 0
				Dimension nombre[n_clientes+1];
				Dimension direccion[n_clientes+1];
				Dimension telefono[n_clientes+1];
				Dimension edad[n_clientes+1];
				Dimension n_membresia[n_clientes+1];
				Dimension estado_membresia[n_clientes+1];
				Dimension tipo_membresia[n_clientes+1];
				Dimension estado_pago[n_clientes+1];
				cargarDatos(nombre, direccion, telefono, edad, n_membresia, estado_membresia, tipo_membresia, estado_pago, n_clientes);
		FinSegun
	Hasta Que opc = 5
	
FinProceso
// carga de datos 
SubProceso cargarDatos(nombre Por Referencia, direccion Por Referencia, telefono Por Referencia, edad Por Referencia, n_membresia Por Referencia, estado_membresia Por Referencia, tipo_membresia Por Referencia, estado_pago Por Referencia, n_clientes)
	
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
		Leer estado_membresia[i];
		Escribir "Ingrese tipo membresia del cliente ", i, ": ";
		Leer tipo_membresia[i];
		Escribir "Ingrese estado pago del cliente ", i, ": ";
		Leer estado_pago[i];
	FinPara
FinSubProceso


