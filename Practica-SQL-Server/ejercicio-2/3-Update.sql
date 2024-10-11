--Para adaptar a los ejercicios
use [EJERCICIO_2]
go

--1
update [dbo].[Articulo] set [Descripcion]='a146' where [NroArt]=1

--2
UPDATE [dbo].[Proveedor] SET [NomProv]='p015' where [NroProv]=1


--3
update [dbo].[Proveedor] set [Categoria]=null

alter table [dbo].[Proveedor]
alter column [Categoria] int

DECLARE @counter smallint;

SET @counter = 1;
WHILE @counter <7 
   BEGIN


   update [dbo].[Proveedor] set [Categoria]=@counter where [NroProv]=@counter
   SET @counter = @counter + 1
END;  
GO


--4
update [dbo].[Articulo] set  [CiudadArt]='Mendoza' where [NroArt]=1
UPDATE [dbo].[Cliente] SET [CiudadCli]='Rosario' WHERE [NroCli]=1



--5
UPDATE [dbo].[Cliente] SET [NomCli] ='c23' WHERE [NroCli]=1
UPDATE [dbo].[Cliente] SET [NomCli] ='c30' WHERE [NroCli]=2


--6
update [dbo].[Articulo] set[CiudadArt]='La Plata' where  [NroArt] in(5,6)


/*
SELECT *
FROM [dbo].[Articulo]
*/

--7

UPDATE [dbo].[Cliente] SET [CiudadCli]='Jun�n' WHERE [NroCli]=3
UPDATE [dbo].[Cliente] SET [CiudadCli]='Jun�n' WHERE [NroCli]=4


--8
update [dbo].[Articulo] set [Descripcion]='cuaderno' where [NroArt]=2



--9

update [dbo].[Articulo] set [Descripcion]='A001' where [NroArt]=5
update [dbo].[Articulo] set [Descripcion]='A004' where [NroArt]=6
update [dbo].[Articulo] set [Descripcion]='A100' where [NroArt]=7


INSERT INTO [dbo].[Pedido]
   ( [NroArt], [NroCli], [NroProv], [FechaPedido], [Cantidad], [PrecioTotal])
VALUES
   (7, 1, 4, GETDATE(), 900, 9000)

--SELECT *
--FROM [dbo].[Articulo]
--WHERE [Descripcion] BETWEEN  'A001' AND 'A100'


--10
UPDATE [dbo].[Pedido] SET  [FechaPedido]='2004-01-01'      WHERE [NroPed]=5
UPDATE [dbo].[Pedido] SET  [FechaPedido]='2004-02-01'      WHERE [NroPed]=6
UPDATE [dbo].[Pedido] SET  [FechaPedido]='2004-03-31'      WHERE [NroPed]=7


--11 
INSERT INTO [dbo].[Pedido]
   ( [NroArt], [NroCli], [NroProv], [FechaPedido], [Cantidad], [PrecioTotal])
VALUES
   (1, 3, 1, '2004-02-06', 500, 8700)

--12

INSERT INTO Stock
   (NroArt, FECHA, CANTIDAD)
VALUES(1, '2023-10-21', 2000)

INSERT into Stock
   (NroArt, fecha, cantidad)
   VALUES(7, '29-05-2024', 800)


-- 13
SET IDENTITY_INSERT Pedido ON;

INSERT into Pedido
   (NroPed, NroArt, NroCli, NroProv, FechaPedido, Cantidad, PrecioTotal)
   VALUES(23 , 6, 1, 1, '18-05-2024', 2000, 2000)

INSERT into Pedido
   (NroPed, NroArt, NroCli, NroProv, FechaPedido, Cantidad, PrecioTotal)
   VALUES(24, 7, 1, 1, '18-05-2024', 2000, 2000)

SET IDENTITY_INSERT Pedido OFF;

--14
INSERT INTO [dbo].[Pedido]
   ( [NroArt], [NroCli], [NroProv], [FechaPedido], [Cantidad], [PrecioTotal])
VALUES
   (1, 1, 6, dateadd(year, -1, getdate()), 5, 209000)

INSERT INTO [dbo].[Pedido]
   ( [NroArt], [NroCli], [NroProv], [FechaPedido], [Cantidad], [PrecioTotal])
VALUES
   (1, 1, 6, dateadd(year, -1, getdate()), 5, 209000)

INSERT INTO [dbo].[Pedido]
   ( [NroArt], [NroCli], [NroProv], [FechaPedido], [Cantidad], [PrecioTotal])
VALUES
   (1, 1, 6, dateadd(year, -1, getdate()), 5, 209000)




--15

UPDATE [dbo].[Proveedor] SET [CiudadProv]='Capital Federal' WHERE [NroProv] IN(4,5,6)

-- ej 8. actualizo una categroria
UPDATE Proveedor
set
Categoria = 5
where NroProv = 5

 