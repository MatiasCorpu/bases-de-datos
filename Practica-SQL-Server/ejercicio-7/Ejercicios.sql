use EJERCICIO_7
go

/*
Coche (matrícula, modelo, año)
Chofer(nroLicencia, nombre, apellido, fecha_ingreso, teléfono)
Viaje(FechaHoraInicio, FechaHoraFin, chofer, cliente, coche, kmTotales, esperaTotal, costoEspera, costoKms )
Cliente (nroCliente, calle, nro, localidad )
*/

-- 1. Indique cuales son los cohes con mayor cantidad de kilómetros realizados en el último mes.

select coche, sum(kmTotales) as kmTotales
from Viaje
WHERE FechaHoraInicio BETWEEN DATEADD(MONTH, - 1, GETDATE()) and GETDATE()
GROUP BY coche
HAVING sum(kmTotales) = (
    select max(A.kmTotales) 
    from (
        select coche, sum(kmTotales) as kmTotales
        from Viaje
        WHERE FechaHoraInicio BETWEEN DATEADD(MONTH, - 1, GETDATE()) and GETDATE()
        GROUP BY coche
    ) as A
)

-- 2. Indique los clientes que más viajes hayan realizado con el mismo chofer.
select cliente, chofer, COUNT(*) as cantViajes
from Viaje
GROUP by cliente, chofer
HAVING COUNT(*) = (
    SELECT MAX(A.cantViajes)
    from (
        select cliente, chofer, COUNT(*) as cantViajes
        from Viaje
        GROUP by cliente, chofer
    ) as A
)

-- 3. Indique el o los clientes con mayor cantidad de viajes en este año.
SELECT cliente, COUNT(*) as cantViajes
from Viaje 
WHERE FechaHoraInicio BETWEEN DATEADD(YEAR, -1, GETDATE()) and GETDATE()
GROUP BY cliente
HAVING COUNT(*) = (
    select MAX(A.cantViajes) 
    from (
        SELECT cliente, COUNT(*) as cantViajes
        from Viaje 
        WHERE FechaHoraInicio BETWEEN DATEADD(YEAR, -1, GETDATE()) and GETDATE()
        GROUP BY cliente
    ) as A
)

-- 4. Obtenga nombre y apellido de los choferes que no manejaron todos los vehículos que disponemos.

--1ro cantidad de vehiculos disponibles
SELECT count(*)
from Coche

--2do cantidad de vehiculos distintos conducido por cada chofer
select chofer, count(distinct coche) as cantCoches
from Viaje
GROUP by chofer

--3ro finalente
SELECT nombre, apellido
from Chofer
WHERE nroLicencia not in (
    select chofer
    from Viaje
    GROUP by chofer
    HAVING count(distinct coche) = (
        SELECT count(*)
        from Coche
    )
)

-- 5. Obtenga el nombre y apellido de los clientes que hayan viajado en todos nuestros coches.
SELECT *
from Cliente
WHERE nroCliente in(
    select cliente
    from Viaje
    GROUP by cliente
    HAVING count(distinct coche) = (
        SELECT count(*)
        from Coche
    )
)

-- 6. Queremos conocer el tiempo de espera promedio de los viajes de los últimos 2 meses
SELECT AVG(esperaTotal)
from Viaje
WHERE FechaHoraInicio BETWEEN DATEADD(MONTH, -2, GETDATE()) and GETDATE()

-- 7. Indique los kilómetros realizados en viajes por cada coches.
SELECT coche, SUM(kmTotales)
from Viaje
GROUP BY coche

-- 8. Indique el costo promedio de los viajes realizados por cada coches.
SELECT coche, AVG(costoEspera + costoKms)
from Viaje 
GROUP BY coche

-- 9. Indique el costo total de los viajes realizados por cada chofer en el último mes.
SELECT coche, AVG(costoEspera + costoKms)
from Viaje 
WHERE FechaHoraInicio BETWEEN DATEADD(MONTH, -1, GETDATE()) and GETDATE()
GROUP BY coche

-- 10. Indique la fecha inicial, el chofer y el cliente que hayan realizado el viaje más largo de este año.

--km recorridos
SELECT FechaHoraInicio, chofer, cliente, kmTotales
from Viaje
WHERE FechaHoraInicio between DATEADD(YEAR, -1, GETDATE()) and GETDATE()
and kmTotales = (
    SELECT MAX(kmTotales)
    from Viaje
    WHERE FechaHoraInicio between DATEADD(YEAR, -1, GETDATE()) and GETDATE()
)

--tiempo del recorrido
SELECT chofer, cliente, DATEDIFF(MINUTE, FechaHoraInicio, FechaHoraFin) as minutos
from Viaje
WHERE FechaHoraInicio between DATEADD(YEAR, -1, GETDATE()) and GETDATE()
and kmTotales = (
    SELECT MAX(kmTotales)
    from Viaje
    WHERE FechaHoraInicio between DATEADD(YEAR, -1, GETDATE()) and GETDATE()
)