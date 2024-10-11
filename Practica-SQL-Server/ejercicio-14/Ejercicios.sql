use EJERCICIO_14
go

/*
Festejo (NroFestejo, descripción, fecha, nrocliente)
Contrata (NroFestejo, Item, NroServicio, HDesde, HHasta)
Servicio (NroServicio, Descripción, Precio)
Cliente (NroCliente, RazonSocial)
*/

-- 1. p_Servicios(FDesde, FHasta): Crear un procedimiento almacenado que permita listar aquellos servicios que fueron contratados en todos los festejos del período enviado por parámetro. De dichos servicios mostrar el nombre y la cantidad de horas que fueron contratadas en el período enviado por parámetro. Ejemplificar la invocación del procedimiento.

go
create or alter PROCEDURE p_Servicios (
    @FDesde DATE,
    @FHasta DATE
)
AS
BEGIN
    select NroServicio, SUM(DATEDIFF(MINUTE, c.HDesde, c.HHasta) / 60.0)
    from Contrata c
    JOIN Festejo f on f.NroFestejo = c.NroFestejo
    WHERE f.fecha between @FDesde and @FHasta
    GROUP by c.NroServicio
    HAVING COUNT(distinct c.NroFestejo) = (
        select COUNT(*)
        from Festejo
    )
END
go

-- 2. Agregar el campo “Tiempo” en la tabla “Contrata” de tipo smallint, que no acepte nulos y que posea como valor predeterminado 0 (cero). Este campo servirá para que ya se encuentre precalculado la cantidad de minutos que fue contratado el servicio, sin necesidad de realizar el cálculo con los campos de la tabla.

SELECT *
from Contrata


ALTER TABLE Contrata
add Tiempo SMALLINT NOT NULL DEFAULT 0



-- 3. tg_Tiempo: Crear un trigger que cada vez que se cambia la hora desde/hasta o bien se agregue un nuevo servicio contratado, recalculo el campo “Tiempo” con el tiempo en minutos del servicio. Validar que la hora desde no puede ser posterior a la hora hasta, si esto sucede se deberá avisar y volver atrás la operación. Además, tener en cuenta las actualizaciones masivas. Ejemplificar la invocación del trigger.

go
create or alter TRIGGER tg_Tiempo
on Contrata
AFTER INSERT, UPDATE
AS
BEGIN
    if exists(SELECT 1 from inserted i WHERE i.HDesde > i.HHasta)
    BEGIN
        PRINT 'rango de horas invalidas'
        ROLLBACK TRANSACTION
        RETURN
    END

    UPDATE Contrata
    SET Tiempo = DATEDIFF(MINUTE, i.HDesde, i.HHasta)
    from inserted i
    WHERE Contrata.NroFestejo = i.NroFestejo

END 
go

/*
Contrata (NroFestejo, Item, NroServicio, HDesde, HHasta)
Servicio (NroServicio, Descripción, Precio)
*/