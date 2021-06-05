
--- 37. OPERADORES LOGICOS 

--- AND = verdadero solo si las dos condiciones son verdaderas. 
--- OR = Verdadero si una de las condiciones es verdadera. 
--- NOT = Negacion logica. 
--- veremos un ejemplo que los contiene a todos. 

USE [maraton ]
 --- Mujeres que no sean de Mexico.
SELECT gender, age, home, time 
FROM MaratonNY 
Where NOT home = 'Mex' AND gender = 'Female';

--- No muestres mexicanos y muestra todas las mujeres o en caso de ser hombres solo los que tengan entre 25 y 30. 
SELECT gender, age, home, time 
FROM MaratonNY
WHERE NOT home = 'Mex' AND (gender = 'Female' OR (gender = 'Male' AND age BETWEEN 25 AND 30))
ORDER BY age; 

--- 38. OPERADORES DE COMPARACION 
--- > , < , >=, <=, <>, BETWEEN, LIKE, IN, ANY, ALL. 

SELECT gender, age, time
FROM MaratonNY 
WHERE time BETWEEN 100 AND 200; 

---Muestre los corredores cuya pais de procedencia comience con m, utilizamos LIKE. 
SELECT gender, age, home, time 
FROM MaratonNY 
WHERE home LIKE 'M%'
--- Si queremos que el campo termine com M. 
SELECT gender, age, home, time 
FROM MaratonNY 
WHERE home LIKE '%M';

--- 39. SUBCONSULTAS ESCALONADAS 

--- Cree una lista de corredores que hicieron un tiempo menor o igual al promedio 
--- de los valores que aparecen en la columna tiempo. 
SELECT AVG(time) 
FROM MaratonNY 

SELECT gender, age, time 
FROM MaratonNY 
WHERE time <= (SELECT AVG(time) 
              FROM MaratonNY);


--- 40. SUBCONSULTAS DE LISTA 

--- lo que buscamos es que nos traiga el gender, la edad, procedencia y el tiempo 
--- cuyo valor en la columna tiempo es menor que todos los valores que se encuentran 
--- en la lista obtenia en el segundo SELECT, lo que significa que los tiempos buscados 
--- deber�n ser menores al valor mas peque�o de esta lista, osea 207.01 minutos. 
SELECT gender, age, home, time 
FROM MaratonNY 
WHERE time  < ALL 
       (SELECT time 
	   FROM MaratonNY 
	   WHERE  home = 'MEX');

SELECT gender, age, home, time 
FROM MaratonNY 
WHERE time  < ANY 
       (SELECT time 
	   FROM MaratonNY 
	   WHERE  home = 'MEX');

--- TAREA 
---1. Obt�n el tiempo que le tom� llegar a la meta a cada una de las mujeres provenientes de NY. 
---Muestra las columnas gender, age, home y time en los resultados y 
--- ord�nalos de forma ascendente en base a los valores de la columna time
SELECT gender,age, time 
FROM MaratonNY 
WHERE home = 'NY' AND gender = 'Female'
ORDER BY time;

---2. Crea una lista con los hombres menores de 30 a�os y de las mujeres que tengan entre 30 y 40 a�os. 
---Incluye las columnas gender, age y home. Ordena la lista en base a la edad
SELECT gender, age, home 
FROM MaratonNY 
WHERE (gender = 'Female' AND age BETWEEN 30 AND 40) 
OR
(gender = 'Male' AND age < 30)
ORDER BY age;



---3. Realiza una subconsulta escalonada para obtener una lista
---de los corredores mayores de 25 a�os que sean mas veloces que los corredores menores de 25 a�os. 
---Indica cual es el tiempo m�nimo que hicieron �stos �ltimos y
---despu�s incluye las columnas gender, age y time en tus resultados
SELECT gender, age, time
FROM MaratonNY 
WHERE age > 25 AND time <
	(SELECT MIN(time) as Tiempo_Minimo
	 FROM MaratonNY 
	 WHERE age < 25);

SELECT gender, age, time 
FROM MaratonNY 
WHERE (age > 25) 
AND 
time < (SELECT MIN(time)
        FROM MaratonNY 
		WHERE age < 25);





---4. Realiza una subconsulta de lista para conocer cuales hombres menores de 40 a�os 
---fueron mas lentos que todas las mujeres menores de 40 a�os. 
---Ord�nalos de forma descendente en base a la columna age

SELECT gender, age, time 
FROM MaratonNY 
WHERE (gender = 'Male' AND age < 40) 
AND 
time < ALL (SELECT time 
       FROM MaratonNY 
	   WHERE gender = 'Female' AND age < 40)
ORDER BY age DESC;