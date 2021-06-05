

-----53. INSERT --------------------------------------------------------
USE Tablas_Varias

---todas permiten valores nulos. 
CREATE TABLE Utiles_Escolares(
        Prod_Num INT PRIMARY KEY, 
		Producto VARCHAR(50) NOT NULL,
		Proveedor VARCHAR(100) NOT NULL,
		Costo DECIMAL(6,2) NOT NULL
	)

---insertar valores de la tabla 
INSERT INTO Utiles_Escolares VALUES (129, 'Cuaderno Cuadriculado', 'Proveedora de Oficinas', 22.30)

SELECT *
FROM Utiles_Escolares;


----54. ALTER TABLE -----------------------------------
----insertar/borrar una columna 
----asignacion de llave primaria 
---DETELE FROM Utiles_Escolares  WHERE Columna = algun valor---
ALTER TABLE Utiles_Escolares 
ADD PRIMARY KEY (Prod_Num);
---columna a crear con el tipo de dato. 
ALTER TABLE Utiles_Escolares 
ADD Precio DECIMAL(6,2) 
---tenemos que meterle valores a la columna, porque si lo hacemos asi, no se podra cambiar a NOT NULL. 
---quitar el que acepte valores nulos. 
ALTER TABLE Utiles_Escolares
ALTER COLUMN Precio Decimal(6,2) NOT NULL

---creamos una tabla nueva con solo 3 columnas y veremos como hacer para que por default un campo ya este registrado. 
---y asi evitar valores NULL. 
CREATE TABLE Proveedores (
         Id_Proveedor INT PRIMARY KEY, 
		 Registro_Fiscal VARCHAR(50) DEFAULT ('Desconocido'), 
		 Domicilio VARCHAR(100) NOT NULL 
		 )

---insertamos un registro 

INSERT INTO Proveedores(Id_Proveedor, Domicilio) VALUES (345, 'Arco Vespacioano 89')

---vemos que el respectivo registro en la columna Registro_Fiscal lo ha marcado como Desconocido. 
SELECT *
FROM Proveedores;

---cambiar el tipo de dato de alguna columna ya existente y con previo tipo de dato. 
ALTER TABLE Utiles_Escolares 
ALTER COLUMN Precio INT 
----borrar una columna 
ALTER TABLE Utiles_Escolares 
DROP COLUMN Precio

---asigarles un rango de valores permitidos al momento de crearla, para hacerlo usamos
--- dicha columna solo tendrá un rango permitido entre 10 y 100000 valores . 
ALTER TABLE Proveedores 
ADD Pago_a_Proveedores INT 
CHECK (Pago_a_Proveedores >10 AND Pago_a_Proveedores <100000)


----56. UPDATE -------------------------------------------------------------------------
---	asignar valores a diferentes registros que cumplan una condicion en una o varias columnas determinadas. 
---cambiar los valores existentes en una columna. 
---realizar operaciones aritmeticas sobre los valores de una columna. 
---utilizar los valores de otra tabla para probar una columna. 

USE [maraton ]
---tabla llamada maraton modificada
 SELECT * 
 INTO Maraton_Modificada 
 FROM MaratonNY
 ---agregamos una columna a la tabla 
 ALTER TABLE Maraton_Modificada 
 ADD Clasificacion VARCHAR(50)
---en la columna clasificacion indicaremos si los corredores son jovenes o adultos y si son hombres o mujeres. 
UPDATE Maraton_Modificada 
SET Clasificacion = 'Jovencito'
WHERE gender = 'Male' AND age <=40 

UPDATE Maraton_Modificada 
SET Clasificacion = 'Jovencitq'
WHERE gender = 'Female' AND age <=40

WHERE gender = 'Male' AND age >40
UPDATE Maraton_Modificada 
SET Clasificacion = 'Señor'

UPDATE Maraton_Modificada 
SET Clasificacion = 'Señora'
WHERE gender = 'Female' AND age >40

---cuando queremos reemplazar un valor existente por otro valor. 
UPDATE Maraton_Modificada
SET gender = 'Hombre'
WHERE gender = 'Male'

UPDATE Maraton_Modificada
SET gender = 'Mujer'
WHERE gender = 'Female'

---modifica el tiempo en horas. 
UPDATE Maraton_Modificada 
SET time = time/60

---para moificarle el nombre a una columna, es desde la pestaña de diseño. 


---57.DELETE------------------------------------------------------------------------------------------
---borrar definitamente la informacion 
DELETE FROM Maraton_Modificada
WHERE Corredor  = 53;

---58. ELIMIAR REGISTROS DUPLICADOS---------------------------------------------------------------------


---59. DROP Y TRUNCATE-------------------------------------------------------------------------------
---truncate elimina todos los registros dejando la tabla sin valores. 
---con delete podemos hacer eliminaciones mas especificas y con truncte la totalidad de los registros. 


---TAREA 
---Crea la tabla Utiles_Escolares_2 que aparece en el video llamado INSERT
---asignando a la Columna Prod_Num como llave primaria
---Una vez que la hayas creado, inserta al menos tres productos que contengan información en todas las columnas 
---de la tabla utilizando el comando INSERT INTO
USE Tablas_Varias
CREATE TABLE Utiles_Escolares_2 (
		Prod_Num INT PRIMARY KEY, 
		Producto VARCHAR(50) NOT NULL,
		Proveedor VARCHAR(100) NOT NULL,
		Costo DECIMAL(6,2) NOT NULL
	)

INSERT INTO Utiles_Escolares_2 (Prod_Num, Producto, Proveedor, Costo)
	   VALUES (126, 'Lápiz 2B', 'Papelería San Felipe', 3.50)
INSERT INTO Utiles_Escolares_2 (Prod_Num, Producto, Proveedor, Costo)
	   VALUES (129, 'Cuaderno Cuadriculado', 'Proveedora de Oficinas', 22.30)
INSERT INTO Utiles_Escolares_2 (Prod_Num, Producto, Proveedor, Costo)
	   VALUES (133, 'Borrador Blanco', 'Papelería El recreo', 5.00);
INSERT INTO Utiles_Escolares_2 (Prod_Num, Producto, Proveedor, Costo)
	   VALUES (119, 'Papel de China', 'Proveedora de Oficinas', 0.50); 
INSERT INTO Utiles_Escolares_2 (Prod_Num, Producto, Proveedor, Costo)
	   VALUES (115, 'Carpeta Tamaño C	arta', 'Papelería San Felipe', 1.50);


---Con el comando DELETE borra la información correspondiente al Cuaderno Cuadriculado
DELETE FROM Utiles_Escolares_2
   WHERE Producto = 'Cuaderno Cuadriculado'


---Agrega una columna de tipo caracter llamada Categoría a la tabla Utiles_Escolares_2 
---cuyo valor por default sea 'Utiles Escolares'
 ALTER TABLE Utiles_Escolares_2
   ADD Categoria VARCHAR(100) DEFAULT ('Utiles Escolares')


---Utilizando el comando UPDATE, asigna la categoria 'Articulos Varios' al papel de china
 UPDATE Utiles_Escolares_2
   SET Categoria = 'Articulos Varios'
   WHERE Producto = 'Papel de China' 



---Cambia la columna a tipo NOT NULL siguiendo los pasos que aparecen en el video ALTER TABLE II


