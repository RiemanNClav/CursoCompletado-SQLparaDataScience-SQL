--- 20. FILTRANDO LA INFORMACION CON SQL : WHERE, LIKE, IGUAL A, DIFERENTE A. 

USE Alumnos;

SELECT *  -- Muestre todas las columnas 
FROM Datos_Personales
WHERE Estado_Civil = 'Married'; --Filtra registros en base a los valores de sus columnas. 


SELECT *  -- Muestre todas las columnas 
FROM Datos_Personales
WHERE Estado_Civil != 'Married'; ---Todos excepto los que sean Married. 

--Si queremos los valores que no son casado y que tienen un valor nulo en la columna. 

SELECT *  
FROM Datos_Personales
WHERE Estado_Civil <> 'Married' or Estado_Civil IS NULL 

--LIKE PARA BUSCAR CAMPOS QUE TENGAN UN VALOR DETERMINADO DENTRO DE SU CADENA DE CARACTERES. 
--TODOS LOS ALUMNOS TAL QUE SU CORREO ELECTRONICO CONTENGA LA PALABRA GMAIL. 
SELECT * 
FROM Datos_Personales
WHERE Correo like '%gmail%';

SELECT *
FROM Datos_Personales
WHERE Nombre like '%A%';

--- 21. NOT LIKE Y MAS EJEMPLOS DE USO DE LIKE. 

SELECT * 
FROM Datos_Personales
WHERE Telefono like '______8%'; 

SELECT * 
FROM Datos_Personales 
WHERE Ciudad like '%______%'; --ciudades que tienen 6 letras. 

SELECT *
FROM Ciudad 
WHERE Ciudad NOT LIKE '%L%' 

SELECT * 
FROM Ciudad
WHERE Ciudad LIKE '%L%'

--23. FILTRANDO INFORMACION NUMERICA
USE [maraton ];
SELECT *
FROM MaratonNY
WHERE Age >=30;

SELECT *
FROM MaratonNY
WHERE Age BETWEEN 30 AND 50;

SELECT * 
FROM MaratonNY
WHERE Age > 45 AND gender = 'Female' AND time < 250;

SELECT * 
FROM MaratonNY
WHERE ((Age > 45 AND gender = 'Female')
OR   (Age > 55 AND gender = 'Male'))
AND time > 250; 


USE [maraton ]; 

---solo traiga la info de los corredores provenientes de esos paises. 
SELECT *
FROM MaratonNY
WHERE home IN ('MEX', 'BRA', 'ARG', 'PER'); 

--- 25. SELECT DENTRO DE SELECT 

USE Tablas_Varias;

--Muestre dichas columnas de la tabla poblacion_mundial 
--pero que muestre la informacion de los paises cuya poblacion sea mayor o igual a la que tiene registrada medico. 
SELECT Pais, Poblacion FROM Poblacion_Mundial
WHERE Poblacion >= 
(SELECT Poblacion FROM Poblacion_Mundial
WHERE Pais= 'Mexico');

--26. ORDER BY 

SELECT Pais, Poblacion FROM Poblacion_Mundial
WHERE Poblacion >= 
(SELECT Poblacion FROM Poblacion_Mundial
WHERE Pais= 'Mexico')
ORDER BY Poblacion DESC; --ordene de mayor a menor. 

USE [maraton ];

SELECT Age, Time FROM MaratonNY
ORDER BY Age; --ordena la edad de menor a mayor, pero los tiempos que hicieron los corredores no estan ordenados.

SELECT Age, Time FROM MaratonNY
ORDER BY Age, Time; 

-- 27. SELECT TOP 

--Muestre una cierta cantidad de filas al momento de realizar una consulta. 

USE Tablas_Varias;

-- Lista de paises cuya poblacion es igual o mayor a la poblacion registrada en mexico, ordenada en form descen.
--Muestra las primeras 3 filas. 
SELECT TOP 3 Pais, Poblacion FROM Poblacion_Mundial
WHERE Poblacion >= 
(SELECT Poblacion FROM Poblacion_Mundial
WHERE Pais = 'Mexico' )
ORDER BY Poblacion Desc;

-- 29. EXTRAYENDO UNA LISTA DE VALORES UNICOS CON EL COMANDO DISTINCT
--cuando tenemos valores repetidos de una columna y queremos extraer una lista de los valores contenidos 
--en la misma, podemos usar el comando distinct, este nos ayudara a eliminar los valores repetidos 
-- y nos dara los valores unicos. 
USE [maraton ]; 

SELECT DISTINCT home 
FROM MaratonNY 
ORDER BY 1; --unicos 72 paises participantes. 

--tiempo minimo registrado en el mismo 
SELECT MIN(Time)
FROM MaratonNY;
--tiempo maximo 
SELECT MAX(Time)
FROM MaratonNY
--tiempo promedio, redondeado con 2 decimales. 
SELECT ROUND(AVG(Time),2)
FROM MaratonNY;
--suma de los tiempos 
SELECT SUM(Time)
FROM MaratonNY;
-- cantidad de paises que participaron en el maraton de newyork 
SELECT COUNT(DISTINCT(home))
FROM MaratonNY;


---31. GROUP BY Y HAVING 
--suponer que nos interesa el tiempo minimo que hicieron tanto los hombres como las mujeres 
--que participaron en el maraton, para hacerlo necesitamos agrupar a los participantes segun su genero. 
SELECT gender, MIN(Time) AS Tiempo_Minimo 
FROM MaratonNY
GROUP BY gender; 

SELECT home, COUNT(Corredor) AS Cant_Particip
FROM MaratonNY
GROUP BY home;

--cuantos participantes de cada pais son mujeres y cuantos son hombres. 
SELECT home,gender, COUNT(corredor) AS Cant_Particip
FROM MaratonNY
GROUP BY home, gender;

--agregandole el tiempo minimo que hicieron los corredores mexicanos. 
SELECT home, gender, MIN(time) AS Tiempo_Minimo 
FROM MaratonNY
WHERE home = 'MEX'
GROUP BY home, gender;
--crear varias columnas que contengan los estadisticos descriptivos.  

SELECT home,COUNT(corredor) AS Cant_Particip, MIN(time) AS Tiempo_Minimo, 
              MAX(Time) AS Tiempo_Maximo, AVG(time) AS Tiempo_Promedio 
FROM MaratonNY
GROUP BY home;

SELECT home, COUNT(corredor) AS Cant_Particip, MIN(time) AS Tiempo_Minimo, 
              MAX(Time) AS Tiempo_Maximo, AVG(time) AS Tiempo_Promedio 
FROM MaratonNY
GROUP BY home 
ORDER BY Tiempo_Minimo;
--deseamos tener aquellos paises cuya cantidad de participantes es mayor a uno. 
--having va despues de haber hecho el agrupamiento de los datos. 
--ya no mostrara los paises cuya cantidad de participantes sea igual a uno. 
--la diferencia entre where y having es que where filtra en base a los valores que estan 
--en las columnas originales y se coloca antes de la sentencia group by, having se aplica
--a los resultados de la agrupacion que se hizo sobre los datos originales, por ello despues de group by. 
SELECT home, COUNT(corredor) AS Cant_Particip, MIN(time) AS Tiempo_Minimo, 
              MAX(Time) AS Tiempo_Maximo, AVG(time) AS Tiempo_Promedio 
FROM MaratonNY
GROUP BY home 
HAVING COUNT(corredor) > 1
ORDER BY Tiempo_Minimo;

-------32. UNION 
--sirve para unir los registros resultantes de diferentes consultas llevadas acabo. 

--nos enfocamos en la columna tiempo para asignarle una categoria a cada uno de los corredores 
--que participaron en el maraton , filtraremos aquellos que tardaron mas de 300 minutos 
--a estos le asignaremos la etiqueta lento, los cuales las colocaremos en una nueva columna llamada 
--Categoria. 
SELECT gender, age, home, time, 'Lento' AS Categoria 
FROM MaratonNY
WHERE Time > 300;

SELECT gender, age, home, time, 'Regular' AS Categoria 
FROM MaratonNY
WHERE Time BETWEEN 200 AND 300;

SELECT gender, age, home, time, 'Veloz' AS Categoria 
FROM MaratonNY
WHERE Time > 200
--para unir estas 3 conjuntos usamos UNION. 
SELECT gender, age, home, time, 'Lento' AS Categoria 
FROM MaratonNY
WHERE Time > 300 UNION

SELECT gender, age, home, time, 'Regular' AS Categoria 
FROM MaratonNY
WHERE Time BETWEEN 200 AND 300 UNION

SELECT gender, age, home, time, 'Veloz' AS Categoria 
FROM MaratonNY
WHERE Time > 200
ORDER BY age;

-----33. CONCAT 
--unir info de dos columnas
USE [Adventure - Angel];
SELECT FirstName, LastName, FirstName + ' ' + LastName AS Full_Name
FROM Clientes;

-----TAREA 
---1. Carga el archivo PODateTime.csv que viene en la carpeta recursos del video 
--“Extrayendo los componentes de una Fecha” siguiendo las instrucciones de el mismo.
--Una vez que lo hayas cargado, genera una consulta en la que extraigas el año en el que
--fueron colocadas las órdenes que comienzan con PO5. Incluye dichas órdenes 
--de compra en tus resultados.
USE PODateTime;
SELECT *
FROM PODateTime;

SELECT PurchaseOrderNumber, DATEPART(YEAR,DateTime) AS Año 
FROM PODateTime
WHERE  PurchaseOrderNumber LIKE  '%PO5%';

--2. Crea una base de datos llamada Maratón y carga dentro de ella el archivo Maraton NY.csv
--llamando a la tabla MaratonNY, y obtén una lista de los competidores de sexo masculino,
--que tengan 60 o más años y que hayan llegado a la meta en menos de 200 minutos.
USE [maraton ];
SELECT Corredor, gender, age, time
FROM MaratonNY
WHERE age >= 60 AND time < 200
ORDER BY Corredor;


--3. Utilizando la misma tabla MaratonNY que creaste en el punto número 2, 
--crea una lista que contenga la cantidad de mujeres provenientes de cada pais que participaron el maratón
--y ordénala según las cantidades en forma descendente.

SELECT gender,home, COUNT(gender) AS Cantidad
	FROM MaratonNY
	WHERE gender = 'Female'
	GROUP BY gender,home
	ORDER BY Cantidad DESC;
--4. Realiza la misma consulta que el punto 3, pero obteniendo solamente 
--la información de los paises cuya cantidad de mujeres participantes sea mayor a 10.
SELECT gender,home, COUNT(gender) AS Cantidad
	FROM MaratonNY
	WHERE gender = 'Female' 
	GROUP BY gender,home
	HAVING COUNT(gender) > 10
	ORDER BY Cantidad DESC;
--5. Obtén la cantidad de participantes por pais, la edad mínima, la edad máxima y 
--la edad promedio de los mismos por cada uno de los países. Ordena la información 
--de manera Descendente en base a la edad máxima por pais para descubrir la procedencia de los participantes 
--de mayor edad en el Maratón de Nueva York.
SELECT home, 
		 COUNT(Corredor) AS Cant_Particip, 
		 MIN(age) AS Edad_Minima, 
		 MAX(age) AS Edad_Maxima, 
		 AVG(age) AS Edad_Promedio
  FROM MaratonNY
  GROUP BY home
  ORDER BY Edad_Maxima DESC;


