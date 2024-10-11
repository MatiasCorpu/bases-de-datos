use EJERCICIO_13
go


/*
Medición(fecha,hora,métrica,temperatura,presión,humedad,nivel)
Nivel (código, descripción)
*/

-- 1. p_CrearEntidades(): Realizar un procedimiento que permita crear las tablas de nuestro modelo relacional.

/*
go
create or alter PROCEDURE p_CrearEntidades
AS
BEGIN
    CREATE TABLE Nivel (
        codigo int PRIMARY KEY, 
        descripcion VARCHAR(100)
    )


    CREATE TABLE Medicion (
        fecha DATE,
        hora TIME,
        metrica VARCHAR(50),
        temperatura DECIMAL(8,2),
        presión DECIMAL(8,2),
        humedad DECIMAL(8,2),
        nivel int
        PRIMARY KEY (fecha, hora, metrica)
        foreign KEY (nivel) REFERENCES Nivel(codigo)
    );
END
go

EXEC p_CrearEntidades
*/



-- 2. f_ultimamedicion(Métrica): Realizar una función que devuelva la fecha y hora de la última medición realizada en una métrica específica, la cual será enviada por parámetro. La sintaxis de la función deberá respetar lo siguiente: Fecha/hora = f_ultimamedicion(vMetrica char(5)) Ejemplificar el uso de la función.


go
create or alter FUNCTION f_ultimamedicion
(
    @metrica VARCHAR(50)
)
RETURNS TABLE
AS
RETURN (
    SELECT fecha, hora, metrica
    from Medicion
    WHERE metrica = @metrica
)
go

SELECT *
from f_ultimamedicion('M1')



-- 3. v_Listado: Realizar una vista que permita listar las métricas en las cuales se hayan realizado, en la última semana, mediciones para todos los niveles existentes. El resultado del listado deberá mostrar, el nombre de la métrica que respete la condición enunciada, el máximo nivel de temperatura de la última semana y la cantidad de mediciones realizadas también en la última semana.

go
create or alter VIEW v_Listado
AS
select metrica , MAX(temperatura) as MaxTemp, COUNT(distinct nivel) as cant
from Medicion 
WHERE fecha >= DATEADD(DAY, -7, GETDATE())
GROUP by metrica
HAVING count(distinct nivel) < (
    select COUNT(*)
    from Nivel
)
go

SELECT *
from v_Listado



/*
4. p_ListaAcumulados(finicio,ffin): Realizar un procedimiento que permita GENERAR una tabla de acumulados diarios de temperatura por cada métrica y por cada día. El procedimiento deberá admitir como parámetro el rango de fechas que mostrará el reporte. Además, estas fechas deben ser validadas. El informe se deberá visualizar la siguiente forma:

Fecha           Metrica     Ac.DiarioTemp        Ac.Temp
01/03/2009      M1              25                  25
02/03/2009      M1              20                  45
03/03/2009      M1              15                  60
01/03/2009      M2              15                  15
02/03/2009      M2              10                  25
*/
go
CREATE or alter PROCEDURE p_ListaAcumulados (
    @finicio DATE,
    @ffin DATE
)
AS
BEGIN
    --valido fecha
    if (@finicio is NULL or @ffin is NULL or @ffin < @finicio)
        RETURN;

    select fecha, metrica, AVG(temperatura) as [Ac.DiarioTemp], SUM(temperatura) as [Ac.Temp]
    from Medicion
    WHERE fecha between @finicio and @ffin
    GROUP BY fecha, metrica
END
go

exec p_ListaAcumulados @finicio = '2024-06-02', @ffin = '2024-06-05'


-- 5. p_InsertMedicion(fecha,hora, metrica,temp,presion,hum,niv): Realizar un procedimiento que permita agregar una nueva medición en su respectiva entidad. Los parámetros deberán ser validados según:
-- a. Para una nueva fecha hora, no puede haber más de una medida por métrica
-- b. El valor de humedad sólo podrá efectuarse entre 0 y 100.
-- c. El campo nivel deberá ser válido, según su correspondiente entidad.

go
create or alter PROCEDURE p_InsertMedicion (
    @fecha DATE,
    @hora TIME,
    @metrica VARCHAR(50),
    @temp DECIMAL(8,2),
    @presion DECIMAL(8,2),
    @hum DECIMAL(8,2),
    @niv int
)
AS
BEGIN
    --validaciones
    if(@fecha is null or @hora is null or @metrica is null or @temp is null or @presion is null or @hum is NULL or @niv is null)
    BEGIN
        PRINT 'Todos los campos son obligatorios'
        RETURN
    END
    
    if(@hum > 100 or @hum < 0)
    BEGIN
        PRINT 'Valor de humedad incorrecto'
        RETURN
    END

    if EXISTS (select 1 from Medicion WHERE fecha = @fecha and hora = @hora and metrica = @metrica)
    BEGIN
        PRINT 'Ya existe una medicion a la hora y fecha especificada'
    END

    if NOT EXISTS(SELECT 1 from Nivel WHERE codigo = @niv)
    BEGIN
        PRINT 'No existe el nivel especificado'
        RETURN
    END

    --inserto nueva medicion
    INSERT INTO Medicion(fecha, hora, metrica, temperatura, presión, humedad, nivel)
    VALUES (@fecha, @hora, @metrica, @temp, @presion, @hum, @niv)
END
go


-- 6. p_depuraMedicion(días): Realizar un procedimiento que depure la tabla de mediciones, dejando sólo las últimas mediciones. El resto de las mediciones, no deben ser borradas sino trasladadas a otra entidad que llamaremos Medicion_Hist. El proceso deberá tener como parámetro la cantidad de días de retención de las mediciones.

CREATE TABLE Medicion_Hist (
    fecha DATE,
    hora TIME,
    métrica VARCHAR(50),
    temperatura DECIMAL(8,2),
    presión DECIMAL(8,2),
    humedad DECIMAL(8,2),
    nivel INT,
);

go
create or alter PROCEDURE p_depuraMedicion (
    @dias int
)
as
BEGIN
    --inserto lo borrado en la tabla de mediciones historcas
    INSERT INTO Medicion_Hist(fecha, hora, métrica, temperatura, presión, humedad, nivel)
    SELECT fecha, hora, metrica, temperatura, presión, humedad, nivel
    from Medicion
    WHERE fecha < DATEADD(DAY, -@dias, GETDATE())
    
    --borro las mediciones de los anteriores dias
    DELETE Medicion
    WHERE fecha < DATEADD(DAY, -@dias, GETDATE())

END
go

select *
from Medicion

exec p_depuraMedicion @dias = 10

select *
from Medicion

select *
from Medicion_Hist

-- 7. tg_descNivel: Realizar un trigger que coloque la descripción en mayúscula cada vez que se inserte un nuevo nivel.

go
create or alter TRIGGER tg_descNivel
on Nivel
AFTER INSERT
AS
BEGIN
    UPDATE Nivel
    SET descripcion = UPPER(i.descripcion) 
    from inserted i
    WHERE Nivel.codigo = i.codigo
END
go



INSERT INTO Nivel (codigo, descripcion)
VALUES(8, 'aLtO')

select *
from Nivel