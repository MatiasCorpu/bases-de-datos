use EJERICICIO_12
go

/*
Producto (CodProd, Descripcion, CodProv, StockActual)
Stock (Nro, Fecha, CodProd, Cantidad)
Proveedor (CodProv, RazonSocial, FechaInicio)
*/


-- 1. p_EliminaSinstock(): Realizar un procedimiento que elimine los productos que no poseen stock.

go
CREATE or ALTER PROCEDURE p_EliminaSinstock
AS
BEGIN
    select * --delete iria aca
    from Producto
    WHERE StockActual = 0;
END
go

select *
from Producto

EXEC p_EliminaSinstock

-- 2. p_ActualizaStock(): Para los casos que se presenten inconvenientes en los datos, se necesita realizar un procedimiento que permita actualizar todos los Stock_Actual de los productos, tomando los datos de la entidad Stock. Para ello, se utilizará como stock válido la última fecha en la cual se haya cargado el stock.

go
CREATE OR ALTER PROCEDURE p_ActualizaStock
AS
BEGIN
    UPDATE Producto
    SET StockActual = (
        SELECT TOP 1 Cantidad
        FROM Stock 
        WHERE Producto.CodProd = Stock.CodProd
        ORDER BY Cantidad DESC
    );
END;
GO

EXEC p_ActualizaStock 


-- 3. p_DepuraProveedor(): Realizar un procedimiento que permita depurar todos los proveedores de los cuales no se posea stock de ningún producto provisto desde hace más de 1 año.

go
create or alter procedure p_DepuraProveedor
as 
begin
    select *
    from Producto
    WHERE CodProd not in (
        select distinct p.CodProd
        from Producto p 
        join Stock s on s.CodProd = p.CodProd
        WHERE s.Fecha between DATEADD(YEAR, -1, GETDATE()) and GETDATE()
        AND p.StockActual <> 0 
    )
end;
go

EXEC p_DepuraProveedor


-- 4. p_InsertStock(nro,fecha,prod,cantidad): Realizar un procedimiento que permita agregar stocks de productos. Al realizar la inserción se deberá validar que:
-- a. El producto debe ser un producto existente
-- b. La cantidad de stock del producto debe ser cualquier número entero mayor a cero.
-- c. El número de stock será un valor correlativo que se irá agregando por cada nuevo stock de producto.


go
create or alter PROCEDURE p_InsertStock 
    @fecha DATE,
    @codProd INT,
    @cantidad INT
AS
BEGIN
    DECLARE @nro INT

    IF EXISTS(select 1 from Stock WHERE CodProd = @codProd)
        BEGIN
            IF(@cantidad > 0)
                BEGIN
                    SET @nro = (select ISNULL(max(nro),0)+ 1  from Stock)
                    INSERT INTO Stock (Nro, Fecha, CodProd, Cantidad)
                    VALUES (@nro, @fecha, @codProd, @cantidad);
                END
            ELSE
            BEGIN
            PRINT 'cantidad negativa'
            RETURN
            END            
        END
    ELSE
        BEGIN
        PRINT 'No existe el producto'
        RETURN
        END
END;
go

SELECT *
from Stock

EXEC p_InsertStock @fecha = '2024-06-07', @codProd = 3 ,@cantidad = 47

SELECT *
from Stock



-- 5. tg_CrearStock: Realizar un trigger que permita automáticamente agregar un registro en la entidad Stock, cada vez que se inserte un nuevo producto. El stock inicial a tomar, será el valor del campo Stock_Actual.

go
create or alter TRIGGER tg_CrearStock
on Producto
AFTER INSERT
AS
BEGIN
    INSERT INTO Stock(Nro, Fecha, CodProd, Cantidad)
    SELECT
        (select ISNULL(MAX(nro), 0) + 1 from stock),
        GETDATE(),
        i.CodProd,
        i.StockActual
    from inserted i
END
go

SELECT * 
from Stock

INSERT INTO Producto (CodProd, Descripcion, CodProv, StockActual)
VALUES(7, 'Producto 7', 3, 111);

SELECT *
from Producto

SELECT * 
from Stock





-- 6. p_ListaSinStock(): Crear un procedimiento que permita listar los productos que no posean stock en este momento y que no haya ingresado ninguno en este último mes. De estos productos, listar el código y nombre del producto, razón social del proveedor y stock que se tenía al mes anterior.
go
create or alter PROCEDURE p_ListaSinStock
AS
BEGIN
    select p.CodProd, p.Descripcion, pp.RazonSocial, p.StockActual
    from Producto p 
    join Proveedor pp on pp.CodProv = p.CodProv
    WHERE p.StockActual = 0
    and p.CodProd not in(
        select distinct CodProd
        from Stock 
        WHERE Cantidad > 0 
        and Fecha >= DATEADD(MONTH, -1, GETDATE()) and Fecha <= GETDATE()
    )
END;
go


EXEC p_ListaSinStock

/*
7. p_ListaStock(): Realizar un procedimiento que permita generar el siguiente reporte:

Fecha           > 1000      < 1000          = 0
01/08/2009      100         8               3
03/08/2009      53          50              7
04/08/2009      50          20              40
*/

go
create or alter PROCEDURE p_ListaStock
AS
BEGIN
    SELECT Fecha,
        sum(case when Cantidad > 100 then 1 else 0 end) as [> 100],
        sum(case when Cantidad < 100 then 1 else 0 end) as [< 100],
        sum(case when Cantidad = 0 then 1 else 0 end) as [> 0]
    from Stock
    GROUP by Fecha
END;
go

EXEC p_ListaStock

-- 8. El siguiente requerimiento consiste en actualizar el campo stock actual de la entidad producto, cada vez que se altere una cantidad (positiva o negativa) de ese producto. El stock actual reflejará el stock que exista del producto, sabiendo que en la entidad Stock se almacenará la cantidad que ingrese o egrese. Además, se debe impedir que el campo “Stock actual” pueda ser actualizado manualmente. Si esto sucede, se deberá dar marcha atrás a la operación indicando que no está permitido.

--1) UN TRIGGER para actualizar StockActual mediante la modificacion de Stock(cantidad)

go
create or alter TRIGGER tg_UpdateStockActual
on Stock
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    --manejo de insert / update
    if exists (select 1 from inserted)
    BEGIN   
        UPDATE Producto
        SET StockActual = StockActual + i.Cantidad
        FROM Producto p 
        JOIN inserted i on i.CodProd = p.CodProd
    END

    --manejo de delete
    if exists (select 1 from inserted)
    BEGIN
        UPDATE Producto
        SET StockActual = StockActual - d.Cantidad
        from Producto p
        join deleted d on d.CodProd = p.CodProd
    END
END;
go

--2) UN TRIGGER para prohibir la actualizacion de Producto(StockActual) desde la misma tabla

go
create or alter TRIGGER tg_PreventManualUpdateStockActual
on Producto
INSTEAD OF UPDATE
AS
BEGIN
    if UPDATE(StockActual)
    BEGIN
        RAISERROR ('No está permitido actualizar el campo StockActual manualmente.', 16, 1);
        ROLLBACK TRANSACTION
        RETURN;
    END

    --puede permitir otras acciones
    UPDATE Producto
    SET Descripcion = i.Descripcion, CodProd = i.CodProd
    from inserted i
    WHERE i.CodProd = Producto.CodProd
END
go