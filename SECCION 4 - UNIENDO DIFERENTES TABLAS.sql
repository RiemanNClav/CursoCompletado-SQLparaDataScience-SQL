
---INNER JOIN 
USE Alumnos;
---En el FROM se especifica las tablas que estamos juntando y el tipo de union que estamos haciendo. 
---con la palabra ON se busca la condicion que se esta buscando, que en este caso es que el ID.Num 
--- sea = al Id.Num de la tabla Datos_Personales. 
SELECT Actividades_Extra.Id_num, Datos_Personales.Nombre, Actividades_Extra.Actividad,Ciudad.Ciudad
FROM    Actividades_Extra 
INNER JOIN
        Datos_Personales ON Actividades_Extra.Id_num = Datos_Personales.Id_num
INNER JOIN 
Ciudad ON Datos_Personales.Ciudad = Ciudad.Ciudad;

--- 46. LEFT JOIN, RIGHT JOIN Y FULL JOIN 

---left join
---trajo todos los registros de la tabla Actividades_Extra y que ha todos los ID.Num que encontro 
---en la tabla Datos_Personales les agrego el nombre del alumno, 
---a los que no encontro en la tabla de Datos_Personales les dejo un valor NULL en la columna Nombre. 
SELECT Actividades_Extra.Id_num, Datos_Personales.Nombre, Actividades_Extra.Actividad
FROM    Actividades_Extra 
LEFT JOIN
        Datos_Personales ON Actividades_Extra.Id_num = Datos_Personales.Id_num;

---right join 
SELECT Datos_Personales.Id_num, Datos_Personales.Nombre, Actividades_Extra.Actividad
FROM    Actividades_Extra 
RIGHT JOIN
        Datos_Personales ON Actividades_Extra.Id_num = Datos_Personales.Id_num;


---full join 
SELECT Datos_Personales.Id_num,Actividades_Extra.Id_num AS Id_num_Act, Datos_Personales.Nombre,
Actividades_Extra.Actividad
FROM    Actividades_Extra 
FULL JOIN
        Datos_Personales ON Actividades_Extra.Id_num = Datos_Personales.Id_num;

--- 47. JOIN ENTRE BASE DE DATOS 
---con frecuencia es necesario llevar acabo consultas que involucran dos bases de datos y no solo una como 
---vimos antes, esto lo haremos en SQL Server. 




---48.SELF JOIN 
---veremos como llevar acabo consultas mediante la comparacion de dos columnas en datos que estan en una misma tabla. 

USE Tablas_Varias

--- con el * especificamos que queremos todas las columnas de las 2 tablas que uniremos. 
--- con el alias diferente suponemos que tenemos dos tablas separadas.
--- con el ON indicamos que nos interesan los registros de la tabla a la que llamamos emp cuyo 
--- valor en la columna supervisor sea = a la columna nombre de la tabla sup. 
--- osea estamos buscando el nombre de los empleados que tienen cargo de supervisor. 
SELECT emp.Nombre, sup.Nombre AS Supervisor, sup.Telefono AS Tel_Supervisor
FROM Empleados AS emp
INNER JOIN 
     Empleados AS sup ON emp.Supervisor = sup.Nombre
ORDER BY emp.Nombre;
          
SELECT *
FROM Empleados AS emp
INNER JOIN 
     Empleados AS sup ON emp.Supervisor = sup.Nombre
ORDER BY emp.Nombre;

--- 49. CONSULTAS COMPLEJAS UTILIZANDO VISTAS 
--- como crear una vista, estas son muy utiles cuando queremos consultar que son muy elaboradas.
---especie de tablas de datos temporal, para despues aplicar sobre ella otra consulta y asi obtener el resultado
---de interes. 

-- Utilizando la información contenida en la base de datos Alumnos, encuentre la nacionalidad de las alumnas 
---solteras y los alumnos divorciados regitrados en cada una de las actividades extra-curriculares. 
---Incluya ademas la cantidad de alumnos que cumplen con estas condiciones. 

USE Alumnos
CREATE VIEW Alumnos_Edo_Civil AS

SELECT Datos_Personales.Estado_Civil, Datos_Personales.Genero, Ciudad.Pais, Actividades_Extra.Actividad
FROM Ciudad 
INNER JOIN Datos_Personales ON Ciudad.Ciudad = Datos_Personales.Ciudad 
INNER JOIN Actividades_Extra ON Actividades_Extra.Id_num =	Datos_personales.Id_num;

--- Con esto obtenemos los 18 alumnos que estan tanto en la tabla de datos_personales como 
--- en la de actividades_extras ademas del pais en el que viven. 
SELECT * 
FROM Alumnos_Edo_Civil

SELECT Pais, Estado_Civil, Genero, Actividad, COUNT(Actividad) AS Cant_Edo_Civil 
FROM Alumnos_Edo_Civil 
WHERE (Genero = 'F' AND Estado_Civil = 'Single') OR (Genero = 'M' AND Estado_Civil = 'Divorced')
GROUP BY Estado_Civil,Pais, Genero, Actividad 
ORDER BY Pais, Estado_Civil, Actividad;


---50 CREANDO UNA TABLA A PARTIR DE OTRA O DE UNA VISTA 
--- crear una tabla apartir de una tabla que ya existe. 

USE [maraton ]

SELECT gender, age, [time] INTO Maraton_Nueva 
FROM MaratonNY

SELECT * 
FROM Maraton_Nueva;

CREATE VIEW Mexicanos AS 
SELECT Corredor, place, gender, age, [time]
FROM MaratonNY
WHERE home = 'Mex';

SELECT *  
FROM Mexicanos 
---ahora la guardaremos en una tabla nueva 
SELECT *
INTO Tabla_Mexicanos 
FROM Mexicanos;


--- 51. UTILIZANDO VARIABLES EN NUESTRAS CONSULTAS 
---crear variables en las que podemos almacenar en memoria el resultado de una consulta para seguir trabajando 
---con el mismo. 
---debemos saber cuales y cuantas variables vamos a necesitar. 
USE Alumnos
DECLARE @Id_num int, @Pais VARCHAR (20), @Ciudad VARCHAR (20) 

SET @Id_num = 5 

SET @Ciudad = (SELECT Ciudad 
        FROM Datos_Personales
		WHERE Id_Num = @Id_Num)

SET @Pais = (SELECT Pais 
     FROM Ciudad 
	 WHERE Ciudad = @Ciudad)

SELECT @Id_num AS Número_de_Alumno 
SELECT @Ciudad AS Ciudad 
SELECT @Pais AS Pais

--- 52 CASE 
---comando que podemos utilizar cuando queremos que un codigo que se ejecute unicamente si 
---otra condcion se cumple. 
---similar al ifelse en otros lenguajes. 
---cuando se tienen varias condiciones a verificar la sentencia case va revisando cada una de las 
---condiciones en las que estas aparecen, en el momento en el que encuentra que una de ellas se cumple 
---interrumpe la verificación de las demas y regresa al valor encontrado, si nunguna de las condiciones 
---se cumple, regrega la lo que se puso en la clausula else. 



CASE 
  WHEN condicion1 THEN resultado1 
  WHEN condicion2 THEN resultado2 
  WHEN condicionN THEN resultadoN 
  ELSE resultado 

END

USE [maraton ]

SELECT *, "Categoria" = 
     CASE 
	     WHEN Time <= 200 THEN 'Veloz'
		 WHEN Time BETWEEN 200 AND 300 THEN 'Regular'
		 ELSE 'Lento'
     END 
from MaratonNY;

---Revisa el video de la lectura llamada “Inner Join”
---para que prepares la base de datos que vamos a analizar, y,
---mediante la unión de las tablas “Datos_Personales” y “Actividades_Extra”,
---obtén una lista de los nombres, los correos y la Clase Extra que están tomando los alumnos que se 
---encuentran registrados en alguna de las Actividades Extra-Curriculares. Ordena la lista de forma ascendente
---en base a la Actividad en la que se encuentran registrados los alumnos

USE Alumnos
SELECT Datos_Personales.Nombre, Datos_Personales.Correo, Actividades_Extra.Actividad 
FROM Datos_Personales 
INNER JOIN 
Actividades_Extra ON Datos_Personales.Id_num = Actividades_Extra.Id_num
ORDER BY Actividades_Extra.Actividad DESC;



---Utilizando las Tablas Actividades_Extra y Datos_Personales, 
---obtén una lista de los Números de Identificación de los alumnos que están incluidos en la lista de Actividades 
---Extra-curriculares pero que no se encuentran incluidos en la lista de alumnos de la Tabla Datos_personales


 SELECT Actividades_Extra.Id_num AS ID_01, Datos_Personales.Id_num AS ID_02
  FROM Actividades_Extra
  LEFT JOIN 
  Datos_Personales ON Actividades_Extra.Id_num = Datos_Personales.Id_num
  WHERE   Datos_Personales.Id_num IS NULL;
  



---Si todavía no has cargado la información de las tablas Clientes, 
---Ordenes_de_Compra y Productos, de la base de datos que creamos en el video 
---“Cargando un archivo csv en SQL Server”, es momento de hacerlo.
---Ten especial cuidado al momento de definir el formato de las columnas y asegúrate de que OrderQty 
---se cargue como una variable numérica.


---Utilizando las tablas Clientes, Ordenes_de_Compra y Productos, 
---de la base de datos que creamos en el video “Cargando un archivo csv en SQL Server”,
---obtén una lista de los productos adquiridos por cada uno de los Clientes,
---incluyendo sus descripciones y las cantidades ordenadas
USE [Adventure - Angel]
SELECT Clientes.CustomerID,Ordenes_de_Compra.ProductID,Productos.Name,Ordenes_de_Compra.OrderQty
FROM Clientes
INNER JOIN
Ordenes_de_Compra ON Clientes.CustomerID = Ordenes_de_Compra.CustomerID
INNER JOIN 
Productos ON Ordenes_de_Compra.ProductID = Productos.ProductID;


---Utiliza la información obtenida en el punto anterior para saber cuantas unidades se vendieron
---de cada uno de los productos
CREATE VIEW Productos_Vendidos AS

SELECT Clientes.CustomerID, Ordenes_de_Compra.ProductID, Productos.[Name] AS Descripcion, Ordenes_de_Compra.OrderQty
FROM Clientes
INNER JOIN 
Ordenes_de_Compra ON Clientes.CustomerID = Ordenes_de_Compra.CustomerID
INNER JOIN 
Productos ON Ordenes_de_Compra.ProductID = Productos.ProductID;



SELECT *
FROM Productos_Vendidos


SELECT ProductID, Descripcion, SUM(OrderQty) AS Cant_Total
FROM Productos_Vendidos
GROUP BY ProductID, Descripcion;

