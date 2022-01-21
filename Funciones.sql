/* FUNCIONES 
CREATE FUNCTION CUENTA_ORDENES() RETURNS INT 
AS
BEGIN 
     DECLARE @NUM_ORDEN INT 
	 SELECT @NUM_ORDEN COUNT(O.OrderId) 
	 FROM Orders AS O 
	 WHERE YEAR(O.OrderDate) = 1997 AND MONTH(O.OrderDate) = 12 

END 

print dbo.CUENTA_ORDENES() 
*/ 

---Cantidad de Ordenes en un determinado año y mes. 

CREATE FUNCTION Cuenta_Ordenes() RETURNS INT 
AS 
BEGIN 
     DECLARE @Num_Orden INT 
	 SELECT @Num_Orden = COUNT(O.OrderID) FROM Orders AS O
	 WHERE YEAR(O.OrderDate) = 1998 AND MONTH(O.OrderDate) = 5 
	 RETURN @Num_Orden


END 

PRINT dbo.Cuenta_Ordenes()

/* Crear funcion que devuelva la suma del monto total por un año, mes, dia en especifico. */ 
GO

CREATE FUNCTION Suma_Total(@year int,@month int,@day int) RETURNS FLOAT 
AS 
BEGIN 
   DECLARE @monto FLOAT 
   SELECT @monto = SUM(OD.Quantity * OD.UnitPrice * (1-OD.Discount))
   FROM Orders AS O 
   INNER JOIN [Order Details] AS OD ON OD.OrderID = O.OrderID
   WHERE YEAR(O.OrderDate) = @year and MONTH(O.OrderDate) = @month AND DAY(O.OrderDate) = @day 
   RETURN @monto 

END

Print dbo.Suma_Total(1997,2,25)

/*  Crear una funcion que devuelva una tabla con ordenes, fecha, shipped date y freight date por un 
año, mes, dia en especifo */ 

GO 
CREATE FUNCTION Ordenes_Especiales(@year INT,@month INT,@day INT) RETURNS 
@tabla TABLE(OrderId INT, OrderDate DATE, ShippedDate DATE, freight FLOAT) 
AS 
BEGIN 
INSERT INTO @tabla
SELECT O.OrderID, O.ShippedDate, O.Freight FROM Orders AS O 
WHERE YEAR(O.OrderDate) = @year AND MONTH(O.OrderDate) = @month AND DAY(O.OrderDate) = @day

RETURN
END


SELECT A,* 
FROM Ordenes_Especiales(1997,3,4) A;
