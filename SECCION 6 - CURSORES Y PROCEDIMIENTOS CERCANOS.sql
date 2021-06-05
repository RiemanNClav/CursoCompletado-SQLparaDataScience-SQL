----61. CURSORES---------------------------------------------
--los cursores son objetos que se crean en memoria para almacenar informacion contenida en una tabla e 
--irla recorriendo registro por registro, existen 5 grupos de intrucciones que son necesarios cuando usamos 
--cursores, estos son, la declaracion, la apertura, acceso a datos, el cierre y el desalojo de la memoria. 

USE Tablas_Varias

--creamos el cursor 
--el nombre del cursor es Poblacion, este es el espacio en memoria 
--despues de ello debemos indicarle la info que queremos almacene temporalmente en dicho espacio. 
--para ello usando el select, indicando las columnas en las que estamos interesados. 
DECLARE Poblacion CURSOR FOR 
     SELECT Id_Pais, Pais, Categoria 
	 FROM Poblacion_Mundial


--accedemos al cursor para llevar a cabo alguna acción sobre los registros 
OPEN Poblacion 

--hacemos el recorrido de la tabla 
--lo que nos arroja es el primer registro correspondiente a afganistan, 
--si lo volver a correr nos trae el segundo registro y asi sucesivamente. 
FETCH NEXT FROM Poblacion 

--cerramos el cursor 
CLOSE Poblacion 

--lo retiramos de la memoria 
DEALLOCATE Poblacion 

--algo que podemos hacer para recorrer la info obtenida en el cursor sin necesidad de estarlo haciendo de 
--forma manual es utilizar un ciclo while para recorrer la tabla. 

--cuando se quiere acceder a los registros de una tabla registros por registros. 
DECLARE Poblacion CURSOR FOR 
SELECT Id_Pais, Pais, Categoria
     FROM Poblacion_Mundial
OPEN Poblacion 
    
	FETCH NEXT FROM Poblacion 
	
	SELECT @@FETCH_STATUS AS FETCH_STATUS

WHILE @@FETCH_STATUS = 0 
     BEGIN 
     FETCH NEXT FROM Poblacion 
	 END


--otro tipo de cursor llamado "scroll" con el cual nos podemos ubicar en el primer registro con el comando 
--fetch first 
OPEN Poblacion 

     FETCH FIRST FROM Poblacion 

	 WHILE @@FETCH_STATUS = 0 
	 BEGIN 
	     FETCH NEXT FROM Poblacion 
     END 

--cerramos el cursor 
CLOSE Poblacion 

---62. UTILIZANDO LA INFORMACION ALMACENADA EN EL CURSOR 
USE Alumnos
/*Obtenga una lista de todos los alumnos que se encuentran en la tabla Datos_Personales, 
incluyendo su nombre y la ciudad en la que radica. En caso de que el alumno este registrado 
en alguna de las actividades extra-curriculares contenidas en la tabla Actividades_Extra, 
muestre tambien el nombre de dicha actividad. */

SELECT * FROM Datos_Personales
SELECT * FROM Actividades_Extra
--para relacionar ambas tablas 
--creamos las variables en las que vamos a almacernar los datos 
DECLARE @Nombre VARCHAR (255), @Ciudad VARCHAR (255)

--creamor el cursor 
DECLARE Clases_Extras CURSOR 
    FOR SELECT Nombre, Ciudad 
	FROM Datos_Personales



--accedemos al cursor para llevar a cabo alguna acción sobre los registros 
OPEN Clases_Extra 

     FETCH NEXT FROM Clases_Extras 
	     INTO @Nombre, @Ciudad
