use EJERCICIO_4_R
go



--A. Listar a las personas que no tienen ninguna cuenta en "pesos argentinos" en Ningún banco. Que además tengan al menos dos cuentas en "dólares"

SELECT *
from Persona
WHERE pasaporte in (
    select distinct idPersona
    from Cuenta
    WHERE idPersona not in (
        select idPersona
        from Cuenta c 
        join Moneda m on m.id = c.idMoneda
        where m.descripcion = 'Peso Argentino'
    )

    INTERSECT 

    select c.idPersona
    from Cuenta c
    JOIN Moneda m on m.id = c.idMoneda
    WHERE m.descripcion = 'Dolar'
    GROUP BY c.idPersona
    HAVING COUNT(*) >= 2
)


--B. Listar de las monedas que son operadas en todos los bancos, aquellas con el valor oro más alto.

go
create or alter VIEW monedas_operada_en_todos_los_bancos
AS
SELECT idMoneda
from Opera
GROUP by idMoneda
HAVING COUNT(distinct idBanco) = (
    --cantidad total de bancos
    SELECT COUNT(*)
    from Banco
)
go


SELECT *
from Moneda
WHERE id in (
    select *
    from monedas_operada_en_todos_los_bancos
)