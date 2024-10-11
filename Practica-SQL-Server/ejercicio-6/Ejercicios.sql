use EJERCICIO_6
go

/*
Vuelo (NroVuelo, Desde, Hasta, Fecha)
Avion_utilizado (NroVuelo, TipoAvion, NroAvion)
Info_pasajeros(NroVuelo, Documento, Nombre, Origen, Destino)
*/

-- 1. Hallar los números de vuelo desde el origen A hasta el destino F.

SELECT *
from Vuelo
WHERE Desde LIKE 'A' 
and Hasta LIKE 'F'

-- 2. Hallar los tipos de avión que no son utilizados en ningún vuelo que pase por B.

SELECT v.NroVuelo, au.TipoAvion
from Vuelo v
join Avion_utilizado au on au.NroVuelo = v.NroVuelo
WHERE v.Desde <> 'B' AND v.Hasta <> 'B'

-- 3. Hallar los pasajeros y números de vuelo para aquellos pasajeros que viajan desde A a D pasando por B.
--no se si esta bien

SELECT i.NroVuelo, i.Nombre
from Info_pasajeros i
join Vuelo v1 on i.NroVuelo = v1.NroVuelo
join Vuelo v2 on v1.NroVuelo = v2.NroVuelo
WHERE v1.Desde LIKE 'A' and v1.Hasta LIKE 'D'
and v2.Desde LIKE 'D' and v2.Hasta LIKE 'B'

SELECT ip.Nombre, ip.NroVuelo
FROM Info_pasajeros ip
JOIN Vuelo v ON ip.NroVuelo = v.NroVuelo
WHERE ip.Origen = 'A' AND ip.Destino = 'D'
  AND EXISTS (
      SELECT 1 
      FROM Vuelo v2
      JOIN Info_pasajeros ip2 ON v2.NroVuelo = ip2.NroVuelo
      WHERE v2.Desde = 'B' AND ip2.Documento = ip.Documento
  );

-- 4. Hallar los tipos de avión que pasan por C.

select distinct a.TipoAvion
from vuelo v
join Avion_utilizado a on a.NroVuelo = v.NroVuelo
WHERE v.Desde LIKE 'C' or v.Hasta LIKE 'C'

-- 5. Hallar por cada Avión la cantidad de vuelos distintos en que se encuentra registrado.

SELECT NroAvion, TipoAvion ,COUNT(distinct NroVuelo) as [cant vuelos asignados]
from Avion_utilizado 
GROUP by NroAvion, TipoAvion

-- 6. Listar los distintos tipo y nro. de avión que tienen a H como destino.

select distinct au.NroAvion, au.TipoAvion
from Avion_utilizado au
join Vuelo v on v.NroVuelo = au.NroVuelo
where v.Hasta LIKE 'D'

-- 7. Hallar los pasajeros que han volado más frecuentemente en el último año.

select  i.Nombre, COUNT(i.NroVuelo) as [cant de vuelos]
from Info_pasajeros i
join Vuelo v on v.NroVuelo = i.NroVuelo
where v.Fecha >= DATEADD(YEAR, -1, GETDATE()) and v.Fecha <= GETDATE()
GROUP by i.Nombre
ORDER BY COUNT(i.NroVuelo) DESC;

-- 8. Hallar los pasajeros que han volado la mayor cantidad de veces posible en un B-777.

select  i.Nombre, COUNT(a.TipoAvion) 
from Info_pasajeros i
JOIN Avion_utilizado a on a.NroVuelo = i.NroVuelo
where a.TipoAvion like 'B%777'
GROUP by i.Nombre

-- 9. Hallar los aviones que han transportado más veces al pasajero más antiguo.

--pasajero mas antiguo
SELECT MIN(Documento) as [pasajero mas antiguo]
from Info_pasajeros 

-- 10. Listar la cantidad promedio de pasajeros transportados por los aviones de la compañía, por tipo de avión.

SELECT t.TipoAvion, AVG([cant pasajeros])
from (
    SELECT a.TipoAvion, a.NroVuelo , COUNT(i.Documento) as [cant pasajeros]
    from Avion_utilizado a
    join Info_pasajeros i on a.NroVuelo = i.NroVuelo
    GROUP by a.TipoAvion, a.NroVuelo
)as t
GROUP by t.TipoAvion


-- 11. Hallar los pasajeros que han realizado una cantidad de vuelos dentro del 10% en más o en menos del promedio de vuelos de todos los pasajeros de la compañía.

--promedio de vuelos de todos los pasajeros
SELECT AVG([cant de vuelos]) as promedio
from(
  SELECT Documento, COUNT(NroVuelo) as [cant de vuelos]
  from Info_pasajeros
  GROUP by Documento
) as aux

--todos los pasajeros que realizaron vuelos
select Documento, COUNT(NroVuelo)
from Info_pasajeros
GROUP by Documento
having COUNT(NroVuelo) >= (
  SELECT AVG([cant de vuelos]) as promedio
  from(
    SELECT Documento, COUNT(NroVuelo) as [cant de vuelos]
    from Info_pasajeros
    GROUP by Documento
  ) as aux
) * 0.9
and COUNT(NroVuelo) <= (
  SELECT AVG([cant de vuelos]) as promedio
  from(
    SELECT Documento, COUNT(NroVuelo) as [cant de vuelos]
    from Info_pasajeros
    GROUP by Documento
  ) as aux
) * 1.1
