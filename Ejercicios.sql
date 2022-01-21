--- Devolver ClienteID y Fecha de todas las ordenes realizadas hasta Octubre del año 2017. 

SELECT ClienteId, Fecha
FROM Ordenes 
WHERE Fecha <= '20171031';


--- Devolver Nombre, Codigo y NombreLocal renombrados como "Pais", "Abreviatura" y "Nomenclatura Local" 
-- de todos los paises de la region "Polynesia". 

SELECT Nombre as Pais, Codigo as Abreviatura, NombreLocal as Nomenclatura_Local FROM Paises 
WHERE Region = 'Polynesia';

--- Devolver en una sola columna Nombre, Apellido y Direccion de todos los cliente de la ciudad Bari 
--- el formato debe ser: 
---Nombre: nombre, Apellido: apellido, Direccion: Direccion. 

SELECT 'Nombre' + ':' + Nombre + ',' + 'Apellido' + ':'+ Apellido + ',' + 'Direccion' + ':' Direccion FROM Clientes;


------------------------AND OR NOT ------------------------------------------------------------------

---Devolver todos los productos cuyo precio sea mayor que el costo incrementado en un 40%
--- o la ganancia sea al menos de 25. 

SELECT *, (Costo * 1.4) as Costo_Incrementado
FROM Productos
WHERE Precio > (Costo  * 1.4) 
OR  
 (Precio - Costo) > 25;

--Devolver todas las ciudades argentinas y todas las ciudades brasileras excepto Buenos Aires y Recife. 
SELECT * 
FROM Ciudades
WHERE (CodigoPais = 'ARG' AND Distrito != 'Buenos Aires') 
OR (CodigoPais = 'BRA' AND   Distrito != 'Recife');

--- Devolver solo Ordenes realizadas antes de febrero del 2018 que hayan vendido mas de 100 productos
-- o ordenes realizadas despues de Julio de 2018 que hayan vendido al menos 50 productos. 
SELECT * FROM Ordenes
WHERE 
(Fecha < '20180201' AND 100 < Cantidad) OR 
(Fecha > '20180731' AND 50 <= Cantidad);


---------------------------------------------------IN------------------------------------------------------

---Devolver Clientes Cuyos Apellidos Sean: Myers, Levis, Kent, Case o Berger 

SELECT * FROM CLIENTES 
WHERE Apellido IN ('Myers','Lewis','Kent','Case','Berger');

---Devolver Codigo, Nombre, Continente y Region de todos los paises de America . 

SELECT Codigo, Nombre, Continente, Region
FROM Paises 
 WHERE Continente IN ('South America', 'North America');

 --- Devolver todas las ciudades de todos los paises hispanohablantes. 
 SELECT * FROM PaisesIdioma;

 -------------------------BETWEEN--------------------------------------------------------
 ---Devolver clientes nacidos entre 1950  y 1980  y clientes nacidos entre 1990 y 2010.

 SELECT *, YEAR(FechaNacimiento) as Año
 FROM Clientes
 WHERE YEAR(FechaNacimiento) BETWEEN 1950 AND 1980 
 OR 
 YEAR(FechaNacimiento) BETWEEN 1990 AND 2010;
 
/* Devolver ordenes realizadas: antes de enero del 2016 entre marzo y noviembre del 2017 y noviembre del 2018 
despues de enero del 2019. */ 

SELECT * FROM  ORDENES
WHERE 
Fecha < '20160101' OR ( Fecha BETWEEN '20170301' AND '20171130') OR Fecha > '20190131';

/* Devolver Id, Nombre, Apellido y Direccion de los clientes con id mayores a 80 pero menores a 125 
excepto por los clientes 99 y 100 y ademas devolver los clientes con id 13, 17, 19 28 y 56. */ 

SELECT Id, Nombre, Apellido, Direccion  FROM Clientes
WHERE ((Id BETWEEN 80 AND 125) AND Id NOT IN (99,100)) OR Id IN (13,17,19,28,56);

-----------------------------------LIKE---------------------------------------------------
/* Devolver Id, Nombre, Costo y Precio de todos los productos relacionados con Queso 
siempre y cuando su costo no sea menor a 10 ni mayor a 30. */ 

SELECT Id, Nombre, Costo, Precio
FROM  Productos
WHERE Nombre LIKE '%Queso%' AND Costo BETWEEN 10 AND 30;

/* Devolver	todos los clientes cuyo nombre tenga como segunda letra, la letra 'a' y termine con la letra e. */

SELECT * FROM Clientes 
WHERE Nombre LIKE '_a%e';

/* Devolver todos los clientes cuyo apellido no tenga la letra 'r' en la tercera posicion y su penultima 
posicion sea la letra 'e'. */ 

SELECT * FROM Clientes 
WHERE Apellido NOT LIKE '___r' 
AND Apellido LIKE '%e_';

------------------------------------NULL----------------------------------------------------------------------
--- Devolver todos los productos que tengan proveedor

SELECT Nombre FROM Productos 
WHERE  ProveedorId IS NOT NULL;

--- Devolver todos los clientes que no tengan telefono 
SELECT * FROM Clientes
WHERE Telefono IS NULL;


---------------------------------ORDER BY ---------------------------------------------------------------

/*Devolver nombre, apellido y direccion de todos los clientes ordenados por fecha de nacimiento desde el 
mas reciente al mas antiguo */ 

SELECT Nombre, Apellido, Direccion,FechaNacimiento  FROM Clientes 
ORDER BY FechaNacimiento DESC;

/* Devolver Nombre, ProveedorId y Ganancia	de todos los productos, ordenados de mayor a menor, con el producto 
de mayor ganancia primero en la lista. */ 

SELECT Nombre, ProveedorId, (Precio - Costo) AS Ganancia
FROM Productos 
ORDER BY (Precio - Costo) DESC;

/* Devolver todos los clientes y ordenarlos por nombres de A-Z, si el nombre coincide ordenarlos por appellido 
de la Z-A, si ambos coinciden elegir primero el cliente de mayor edad.  */ 

SELECT * FROM Clientes
ORDER BY Nombre ASC, apellido DESC, FechaNacimiento ASC;


-------------------------------------------------INNER JOIN----------------------------------------------------------
/* Devolver nombre de proveedores, Precio y costo de productos cuya ganancia sea mayor a 20.  */ 

SELECT p.Nombre, Precio, Costo 
FROM Productos
INNER JOIN Proveedores p On ProveedorId = p.Id
WHERE Precio - Costo > 20;

/* Devolver Fecha, Apellido y Nombre de cliente y nombre de producto de todos los clientes que hayan comprado
productos entre 2016 y 2019 inclusive, ordenando primero por mas reciente y segundo por apellido A-Z.  */ 


SELECT Fecha, Apellido, c.Nombre, p.Nombre AS ProductoNombre 
FROM Ordenes 
     INNER JOIN Clientes c ON ClienteId = c.Id 
	 INNER JOIN Productos p ON ProductoId = p.Id
WHERE Fecha BETWEEN  '20160101' AND '20191231'
ORDER BY c.Nombre DESC, Apellido;

---------------------------------------------------------OUTER JOIN ----------------------------------------
/* Devolver nombre y apellido de clientes que no hayan comprado ningun producto en el año 2018.  */ 
 SELECT Nombre, Apellido FROM Clientes C
LEFT JOIN Ordenes O ON C.Id = O.ClienteId
WHERE YEAR(Fecha) != 2018;

 /* Devolver Id y Nombre de todos los productos que nunca se han vendido */ 
 SELECT p.Id, p.Nombre
 FROM Productos  p
 LEFT JOIN Ordenes o ON o.ProductoId = p.Id
 WHERE o.Cantidad IS NULL;

 /* Devolver nombre y codigo de paises que nunca hayan participado en una transacción */ 

 SELECT DISTINCT pa.Nombre, pa.Codigo FROM Paises pa
 INNER JOIN Ciudades ciu ON CodigoPais = Codigo 
 INNER JOIN Clientes cli ON CiudadId = ciu.Id 
 LEFT JOIN Ordenes o ON ClienteId = cli.Id
 WHERE o.Id  IS NULL;

--------------------------------------------------UNION ALL ----------------------------------------------------
---UNION ALL Concatena todas las filas aun y teniendo duplicados. 
---UNION Concatena todas las filas quitando duplicados. 
SELECT 'Clientes' + ':' + Apellido as Datos FROM Clientes

UNION ALL

SELECT 'Proveedores' + ':' + Nombre FROM Proveedores;



SELECT 'Prioritario' As Tipo, * 
FROM Productos 
WHERE Precio - Costo > 50 

UNION 

SELECT 'No Prioritarios' As Tipo, * 
FROM Productos 
WHERE Precio - Costo BETWEEN 20 AND 50;

/* Devolver en un unico listado: 
Id y nombre de productos cuyo costo sea mayor a 80 pero menor a 100 
Id y nombre de categorias que no comiencen con la letra C 
Id y nombre de Proveedores cuya segunda letra no sea "e", ni su ultima letra sea "n". */ 

SELECT Id, 'Productos: '+Nombre as Unico_Listado FROM Productos
WHERE Costo BETWEEN 80 AND 100

UNION ALL

SELECT Id, 'Categorias: '+Nombre FROM Categorias
WHERE Nombre NOT LIKE 'c%'

UNION ALL

SELECT Id, 'Proveedores: '+Nombre FROM Proveedores
WHERE Nombre NOT LIKE '_e%n';


/* Devolver Nombre de producto, apellido y nombre como Cliente, Fecha de orden y texto 
"mayorista" para aquelals ordenes con pedido mayores a 50.
y texto "minorista" para aquellas ordenes con pedidos menores a 50. */

SELECT * FROM Ordenes; --Id,ProductoId,ClienteId,Fecha
SELECT * FROM Productos; --Id,Nombre, ProveedorId, CategoriaId
SELECT * FROM Clientes; ---Id,Nombre,Apellido,

SELECT P.Nombre, C.Apellido+' '+C.Nombre AS Cliente, O.Fecha, 'Mayorista' as Vendedor
FROM           Ordenes O 
    INNER JOIN Productos P ON O.ProductoId = P.Id 
	INNER JOIN  Clientes C ON O.ClienteId = C.Id
WHERE O.Cantidad > 50


UNION 

SELECT P.Nombre, C.Apellido+' '+C.Nombre AS Cliente, O.Fecha, 'Minorista'
FROM           Ordenes O 
    INNER JOIN Productos P ON O.ProductoId = P.Id 
	INNER JOIN  Clientes C ON O.ClienteId = C.Id
WHERE O.Cantidad < 50
ORDER BY P.Nombre DESC;

/* Devolver un solo listado de productos, precio y nombre de categoria con precios actualizados: 
descuento del 10% para bebidas, aumento del 15% para Carnes y agregar un impuesto fijo de 13.5 para lácteos. */

SELECT P.Nombre, P.Precio - (P.Precio*0.1) As Precio, C.Nombre as Categorias
FROM Productos P 
INNER JOIN Categorias C ON P.CategoriaId = C.Id 
WHERE P.CategoriaId = 1

UNION 

SELECT P.Nombre, P.Precio + (P.Precio*0.15), C.Nombre as Categorias
FROM Productos P 
INNER JOIN Categorias C ON P.CategoriaId = C.Id 
WHERE P.CategoriaId = 4 

UNION 

SELECT P.Nombre, P.Precio + 13.5, C.Nombre as Categorias
FROM Productos P 
INNER JOIN Categorias C ON P.CategoriaId = C.Id 
WHERE P.CategoriaId = 6

UNION 

SELECT P.Nombre, P.Precio, C.Nombre as Categorias
FROM Productos P 
INNER JOIN Categorias C ON P.CategoriaId = C.Id 
WHERE P.CategoriaId NOT IN (1,4,6); 


----------------------------------------GROUP BY---------------------------------------------------------------
SELECT ProveedorId FROM Productos
GROUP BY ProveedorId;

---Diferencia.

SELECT ProveedorId FROM Productos 
ORDER BY ProveedorId;


SELECT ProveedorId, p.Nombre 
FROM Productos Pro
JOIN Proveedores p ON ProveedorId = p.Id
GROUP BY Pro.ProveedorId, p.Nombre;

/* Devolver solo los paises de la tabla ciudades */ 
SELECT CodigoPais FROM Ciudades
GROUP BY CodigoPais;
 
SELECT DISTINCT CodigoPais FROM Ciudades;

-----------------------------------------------------------COUNT-------------------------------------------
/* La potencia de la clausula Group By se complementa con las clausulas de agregado, que son las que nos permiten 
sumar datos */ 

SELECT prov.Nombre, COUNT( DISTINCT prod.Id) as Cantidad_Productos
FROM Productos prod 
JOIN Proveedores prov ON prov.Id = prod.ProveedorId
GROUP BY prov.Nombre
ORDER BY prov.Nombre;

SELECT COUNT(*) 
FROM Clientes;

SELECT COUNT(*) 
FROM Clientes 
WHERE Nombre = 'Carla';

SELECT COUNT( DISTINCT Nombre)
FROM Clientes ;

/* Devolver la cantidad de productos vendidos por categoria ordenado de mayor a menor. */ 

SELECT * FROM Ordenes; --- ProductoId, CantidadId, ClienteId
SELECT * FROM Productos; --Id, ProveedorId, CategoriaId
SELECT * FROM Categorias; --Id, Nombre

SELECT C.Nombre, COUNT(P.CategoriaId) As Cantidad_Vendida
FROM Ordenes O 
      INNER JOIN Productos P ON O.ProductoId = P.Id
      INNER JOIN Categorias C ON P.CategoriaId = C.Id

GROUP BY P.CategoriaId,C.Nombre
ORDER BY COUNT(P.CategoriaId) DESC;

/* Devolver la cantidad de clientes que alguna vez ordenaron algo, por pais. */ 

SELECT P.Codigo, P.Nombre AS Pais, COUNT(O.ClienteId) AS Cantidad_Clientes
FROM Ordenes O
INNER JOIN Clientes C ON O.ClienteId = C.Id
INNER JOIN Ciudades CIU ON C.CiudadId = CIU.Id
INNER JOIN Paises P ON CIU.CodigoPais = P.Codigo
WHERE Cantidad IS NOT NULL 
GROUP BY P.Codigo, P.Nombre;

/* Devolver la cantidad de productos cuya ganancia esta entre 5 y 20 y su proveedor no esta vacio. */ 

SELECT COUNT(Nombre) AS Cantidad_Productos
FROM Productos
WHERE (Precio - Costo) BETWEEN 5 AND 20
AND ProveedorId IS NOT NULL;


---------------------------------------------SUM-----------------------------------------------------------
/* Calcula la suma de los valores de la columna indicada */ 
SELECT prov.Nombre, SUM(DISTINCT COSTO) AS CostoProducto
FROM Productos AS PROD 
INNER JOIN Proveedores AS PROV ON PROV.Id = PROD.ProveedorId
GROUP BY PROV.Nombre 
ORDER BY PROV.Nombre;

/* Determinar cual es la categoria mas exitosa calculando el total vendido por categoria */ 

SELECT C.Id, C.Nombre, SUM(P.Precio * O.Cantidad) As Total_Vendido
FROM Ordenes O
INNER JOIN Productos AS P ON O.ProductoId = P.Id
INNER JOIN Categorias AS C ON P.CategoriaId = C.Id
GROUP BY C.Id, C.Nombre
ORDER BY SUM(P.Precio * O.Cantidad) DESC;

/* Determinar cual es el proveedor mas costoso del sistema calculando el total por proveedor. */ 

SELECT * 
FROM Ordenes AS O
INNER JOIN Productos AS P ON O.ProductoId = P.Id
INNER JOIN Proveedores AS PROV ON P.ProveedorId = PROV.Id

----------------------------------------------------AVG-------------------------------------------------
SELECT AVG(Precio) AS Promedio
FROM Productos 
WHERE ProveedorId = 2;

/* Determinar el promedio vendido por ciudad ordenados de mayor a menor */ 
SELECT CIU.CodigoPais, C.Nombre, AVG(P.Precio * O.Cantidad) AS Promedio_vendido
FROM Ordenes AS O
INNER JOIN Productos AS P ON O.ProductoId = P.Id
INNER JOIN Clientes AS C ON O.ClienteId = C.Id
INNER JOIN Ciudades AS CIU ON  C.CiudadId = CIU.Id
GROUP BY CIU.CodigoPais, C.Nombre
ORDER BY AVG(P.Precio * O.Cantidad) DESC;

/* Determinar el promedio vendido a clientes nacidos entre 1930 y 1970 */ 

SELECT  C.Id, C.Nombre, C.Apellido, AVG(P.Precio * O.Cantidad) AS Ventas
FROM Ordenes AS O
INNER JOIN Productos AS P ON O.ProductoId = P.Id
INNER JOIN Clientes AS C ON O.ClienteId = C.Id
WHERE YEAR(C.FechaNacimiento) BETWEEN 1930 AND 1970
GROUP BY C.Id, C.Nombre, C.Apellido
ORDER BY AVG(P.Precio * O.Cantidad) DESC;

/* Determinar el promedio invertido por proveedor para productos con al menos una venta */ 

SELECT PROV.Id, PROV.Nombre, AVG(P.Costo) AS Total_Invertido
FROM Ordenes AS O 
INNER JOIN Productos AS P ON O.ProductoId = P.Id
INNER JOIN Proveedores AS PROV ON P.ProveedorId = PROV.Id 
WHERE O.Cantidad >= 1
GROUP BY PROV.Id, PROV.Nombre
ORDER BY AVG(Costo) DESC;

-----------------------------------------------MAX MIN--------------------------------------------------------
SELECT MIN(FechaNacimiento) 
FROM Clientes;

/* Encontrar el Cliente mas joven que alguna vez haya realizado una compra */ 
SELECT C.Id, C.Nombre, c.Apellido, MAX(C.FechaNacimiento) AS Fecha 
FROM Ordenes AS O
INNER JOIN Clientes AS C ON O.ClienteId = C.Id
GROUP BY C.Id, C.Nombre, C.Apellido
ORDER BY MAX(C.FechaNacimiento) DESC;


/* Determinar el producto de menor costo en cada categoria */ 

SELECT C.Id AS Id_Categoria, C.Nombre AS Categoria,P.Nombre AS Producto, MIN(P.Costo)  --P.Id, P.Nombre, MIN(P.Costo) AS Costo
FROM Ordenes AS O 
INNER JOIN Productos AS P ON O.ProductoId = P.Id
INNER JOIN Categorias AS C ON P.CategoriaId = C.Id
GROUP BY C.id, C.Nombre, P.Nombre
ORDER BY MIN(P.Costo);
--GROUP BY P.Id, P.Nombre
--ORDER BY MIN(P.Costo) ASC;

GO
CREATE VIEW Vista_MinCosto 
AS 
SELECT C.Id AS Id_Categoria, C.Nombre AS Categoria, MIN(P.Costo) AS Costo
FROM Ordenes AS O 
INNER JOIN Productos AS P ON O.ProductoId = P.Id
INNER JOIN Categorias AS C ON P.CategoriaId = C.Id
GROUP BY C.Id, C.Nombre;

SELECT O.Id, O.Nombre, VM.Categoria, VM.Costo
FROM Productos AS O 
INNER JOIN Vista_MinCosto AS VM ON O.CategoriaId = VM.Id_Categoria;

-----------------------------------------------HAVING----------------------------------------------------
--Lo mismo que Where pero para grupos, los grupos que cumplen la condicion cumplen la clausula. 
--filtro a los valores agrupados.

SELECT PROV.Nombre, SUM(PROD.Precio) AS PrecioTotal
FROM Productos PROD 
INNER JOIN Proveedores AS PROV ON PROD.ProveedorId = PROV.Id
GROUP BY PROV.Nombre
HAVING SUM(PROD.Precio) = 236
ORDER BY PROV.Nombre;

/* Devolver solo aquellos proveedores en donde el precio promedio de sus productos 
supere el valor de su producto mas caro dividido por dos. */ 
SELECT PROV.Id,
       PROV.Nombre, 
       AVG(P.Precio) AS PromedioTotal,
	   MAX(P.Precio) AS ProductoMasCaro
FROM Ordenes AS O
INNER JOIN Productos AS P ON O.ProductoId = P.Id
INNER JOIN Proveedores AS PROV ON P.ProveedorId = PROV.Id
GROUP BY PROV.Id, PROV.Nombre
HAVING AVG(P.Precio) > (MAX(P.Precio) / 2);

/* Mostrar el total y el promedio consumido por idioma de cliente 
ordenado de mayor a menor 
solo para los idiomas en donde la mitad de los consumido 
es mayor al promedio total consumido. */ 

SELECT PID.PaisIdioma AS Idioma,
SUM(P.Precio * O.Cantidad) AS Total_Consumido, 
AVG(P.Precio * O.Cantidad) AS Promedio_Consumido
FROM Ordenes AS O
INNER JOIN Productos AS P ON O.ProductoId = P.Id
INNER JOIN Clientes AS C ON O.ClienteId = C.Id
INNER JOIN Ciudades AS CIU ON C.CiudadId = CIU.Id
INNER JOIN Paises AS PA ON CIU.CodigoPais = PA.Codigo
INNER JOIN PaisesIdioma AS PID ON PA.Codigo = PID.PaisCodigo
GROUP BY PID.PaisIdioma
HAVING (SUM(P.Precio * O.Cantidad)/2) > AVG(P.Precio * O.Cantidad)
ORDER BY (SUM(P.Precio * O.Cantidad)/2) DESC;

/* Devolver solo aquellas categorias que hayan vendido al menos 25 productos distintos en el 2018 
de menor a mayor */ 

SELECT C.Id, C.Nombre, COUNT(DISTINCT O.Cantidad) AS Total_Productos
FROM Ordenes AS O
INNER JOIN Productos AS P ON O.ProductoId = P.Id
INNER JOIN Categorias AS C ON P.CategoriaId = C.Id 
GROUP BY C.Id, C.Nombre 
HAVING COUNT(DISTINCT O.Cantidad) > 25
ORDER BY COUNT(DISTINCT O.Cantidad) ASC;

------------------------------------------INSERT------------------------------------------------------
/* 1er manera de insertar datos:

INSERT INTO Tabla (Columna1, Columna2, Columna3, ....) VALUES (valor1, valor2, valor3,.....)

2da manera de insertar datos: 

INSERT INTO tabla VALUES (valor1, valor2, valor3, ........) 

*/ 

------------------------------------------------UPDATE-----------------------------------------------------
/* Modificar Valores existentes en una tabla. 

UPDATE tabla 
SET columna1 = valor1, columna2 = valor2 
WHERE condicion 
*/ 

BEGIN TRANSACTION 
UPDATE Clientes
SET Direccion = 'Algun lugar en California'

ROLLBACK TRANSACTION --regresamos a los datos anteriores 
COMMIT TRANSACTION --los cambios ya serian definitivos. 


SELECT * FROM Clientes

/* Actulizar la Direccion de James Bond a : "Una base secreta" */ 

UPDATE Clientes 
SET Direccion = 'Una base secreta'
WHERE Nombre = 'James' AND Apellido = 'Bond';

/* Cambiar la categoria del producto Chocolate Amargo, de reposteria a Lacteos */ 

UPDATE Productos 
SET CategoriaId = (SELECT Id FROM Categorias WHERE Nombre = 'Lacteos')
WHERE Nombre = 'Chocolate Amargo';

select * 
from productos;

select * 
from Categorias;

---------------------------------------------------DELETE--------------------------------------------------
/* Eliminar filas existentes en la tabla */ 

-- DELETE FROM tabla WHERE condicion 

DELETE FROM Clientes WHERE Id IN (202,203);



































 



 





 






