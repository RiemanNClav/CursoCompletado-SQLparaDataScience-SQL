---------------------------------VISTAS----------------------------------------------------------

/* Vista = tabla virtual almacenada */ 

/* Si cada vendedor representa a una ciudad que es la ciudad donde vive, calcule 
la cantidad de ordenes y el monto final sin descuento de cada ciudad */ 

CREATE VIEW Vendedor_Orden 
AS 
SELECT E.City,COUNT(O.OrderID) AS Cantidad_Ordenes, SUM(Od.Quantity * Od.UnitPrice) as Monto_Sin_Descuento
FROM Employees as E
INNER JOIN Orders O ON E.EmployeeID = O.EmployeeID
INNER JOIN [Order Details] Od ON O.OrderID = Od.OrderID
GROUP BY E.City;

SELECT E.EmployeeID, E.City, O.OrderID, Od.Quantity, Od.UnitPrice
FROM Employees as E
INNER JOIN Orders O ON E.EmployeeID = O.EmployeeID
INNER JOIN [Order Details] Od ON O.OrderID = Od.OrderID
Where E.City = 'London';


/* ¿Cual es el año en el que se generaron mas ventas ? */ 
CREATE VIEW Año_x_ventas
AS
 SELECT YEAR(O.OrderDate) as AÑO, SUM(OD.Quantity * OD.UnitPrice * (1-OD.Discount)) as Ventas
 FROM Orders AS O 
 INNER JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID
 GROUP BY YEAR(O.OrderDate);

 /* ¿Podemos decir que todos los productos se encuentran en al menos 4 ordenes? */ 
 --Si, todos los productos se encuentran en almenos 4 ordenes.

GO
CREATE VIEW vOrdenes_Producto
AS
 SELECT P.ProductName AS Nombre_Producto, COUNT(OD.OrderID) AS Cantidad_Ordenes
 FROM Products AS P 
 INNER JOIN [Order Details] AS OD ON OD.ProductID = P.ProductID
 GROUP BY P.ProductName
 HAVING COUNT(OD.OrderID) >= 4;

 /* ¿Todos los vendedores han vendido al menos 100 unidades de algun producto 
 en noviembre y diciembre de cualquier año ? */ 
 
 GO 
 CREATE VIEW VVendores_Producto
 AS
 SELECT E.LastName+' '+E.FirstName AS Nombre,
 MONTH(o.OrderDate) AS Mes,
 COUNT(O.OrderId) AS Unidades_Vendidas
 FROM Employees AS E 
 INNER JOIN Orders AS O ON O.EmployeeID = E.EmployeeID
 INNER JOIN [Order Details] as OD ON O.OrderID = OD.OrderID
 INNER JOIN Products AS P ON P.ProductID = OD.ProductID
 WHERE MONTH(O.OrderDate) = 11 OR MONTH(O.OrderDate) = 12
 GROUP BY E.LastName+' '+E.FirstName, MONTH(O.OrderDate)

 SELECT Mes, SUM(Unidades_Vendidas) AS Unidades_Totales
 FROM VVendores_Producto
 GROUP BY Mes;
 

SELECT E.FirstName, E.LastName, P.ProductName, OD.Quantity, MONTH(O.OrderDate) as Mes,
YEAR(O.OrderDate) as Año
 FROM Employees AS E 
 INNER JOIN Orders AS O ON O.EmployeeID = E.EmployeeID
 INNER JOIN [Order Details] as OD ON O.OrderID = OD.OrderID
 INNER JOIN Products AS P ON P.ProductID = OD.ProductID
 WHERE (MONTH(O.OrderDate) = 11 OR MONTH(O.OrderDate) = 12)
 ORDER BY MONTH(O.OrderDate) ASC, YEAR(O.OrderDate) ASC
 --AND p.ProductName LIKE '%Chef Anton%';
 --AND OD.Quantity >= 100;


/* ¿Quienes son los vendedores que tuvieron menor tiempo de entrega de productos?  */ 

SELECT * 
FROM Employees AS E 
INNER JOIN Orders AS O ON E.EmployeeID = O.EmployeeID 
WHERE E.FirstName = 'Steven'








