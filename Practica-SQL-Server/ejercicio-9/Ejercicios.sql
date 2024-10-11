use EJERCICIO_9
go

/*
Persona (TipoDoc, NroDoc, Nombre, Dirección, FechaNac, Sexo)
Progenitor (TipoDoc, NroDoc, TipoDocHijo, NroDocHijo)
*/

--1. Hallar para una persona dada, por ejemplo José Pérez, los tipos y números de documentos, nombres, dirección y fecha de nacimiento de todos sus hijos.

-->>>>PROCEDURE 
/*
DROP PROCEDURE p_obtener_hijos;

CREATE or ALTER PROCEDURE p_obtener_hijos
    @NroDoc VARCHAR(50)
AS
BEGIN
    select per.NroDoc, per.Nombre, per.FechaNac
    from Progenitor p
    join Persona per on per.NroDoc = p.NroDocHijo
    WHERE p.NroDoc = @NroDoc
END
*/
EXEC p_obtener_hijos @NroDoc = '12345678'

-->>>>FUNCTION 
/*
DROP FUNCTION f_obtener_hijos;

CREATE or ALTER FUNCTION f_obtener_hijos (
    @NroDoc VARCHAR(50)
)
RETURNS TABLE
AS
RETURN (
    select per.NroDoc, per.Nombre, per.FechaNac
    from Progenitor p
    join Persona per on per.NroDoc = p.NroDocHijo
    WHERE p.NroDoc = @NroDoc
);
*/

SELECT * 
from f_obtener_hijos ('12345678')


--2. Hallar para cada persona los tipos y números de documento, nombre, domicilio y fecha de nacimiento de:
--a. Todos sus hermanos, incluyendo medios hermanos.

-->>>>>PROCEDURE
/*
DROP PROCEDURE p_obtener_hermanos

CREATE or ALTER PROCEDURE p_obtener_hermanos
    @NroDoc VARCHAR(50)
AS
BEGIN
    SELECT distinct NroDocHijo
    from Progenitor
    WHERE NroDocHijo <> '12345678'
    and NroDoc in (
        --obtengo padres
        select pr.NroDoc
        from Persona p 
        join Progenitor pr on pr.NroDoc = p.NroDoc
        WHERE pr.NroDocHijo = @NroDoc
    )
END
*/
EXEC p_obtener_hermanos  @NroDoc = '12345678'


-->>>>>FUNCTION
/*
drop FUNCTION f_obtener_hermanos

CREATE or ALTER FUNCTION f_obtener_hermanos(
    @NroDoc VARCHAR(50)
)
RETURNS TABLE
AS
RETURN (
    SELECT distinct NroDocHijo
    from Progenitor
    WHERE NroDocHijo <> '12345678'
    and NroDoc in (
        --obtengo padres
        select pr.NroDoc
        from Persona p 
        join Progenitor pr on pr.NroDoc = p.NroDoc
        WHERE pr.NroDocHijo = @NroDoc
    )
)
*/
SELECT *
from f_obtener_hermanos('12345678')


--b. Su madre

-->>>>>PROCEDURE
/*
drop procedure p_obtener_madre

CREATE or ALTER procedure p_obtener_madre
    @NroDoc VARCHAR(50)
AS
BEGIN
    SELECT per.NroDoc, per.Nombre
    from Progenitor p 
    join Persona per on p.NroDoc = per.NroDoc
    WHERE p.NroDocHijo = @NroDoc
    and per.Sexo = 'F'
END
*/
EXEC p_obtener_madre @NroDoc = '12345678'


-->>>>>FUNCTION
/*
drop FUNCTION f_obtener_madre

create or alter FUNCTION f_obtener_madre (
    @NroDoc VARCHAR(50)
)
RETURNS TABLE
AS
RETURN (
    SELECT per.NroDoc, per.Nombre
    from Progenitor p 
    join Persona per on p.NroDoc = per.NroDoc
    WHERE p.NroDocHijo = @NroDoc
    and per.Sexo = 'F'
)
*/
SELECT *
from f_obtener_madre('12345678')


--c. Su abuelo materno
--1ro la madre
SELECT per.NroDoc
from Progenitor p 
join Persona per on p.NroDoc = per.NroDoc
WHERE p.NroDocHijo = '12345678'
and per.Sexo = 'F'

--2do el padre de la madre
SELECT per.NroDoc, per.Nombre
from Progenitor p
JOIN Persona per on per.NroDoc = p.NroDoc
WHERE p.NroDocHijo  = (
    SELECT per.NroDoc
    from Progenitor p 
    join Persona per on p.NroDoc = per.NroDoc
    WHERE p.NroDocHijo = '12345678'
    and per.Sexo = 'F'
)
and per.Sexo = 'M'

--d. Todos sus nietos
SELECT per.NroDoc, per.Nombre
from Progenitor p 
join Persona per on per.NroDoc = p.NroDocHijo
WHERE p.NroDoc in (
    SELECT per.NroDoc
    from Progenitor p
    join Persona per on per.NroDoc = p.NroDocHijo
    WHERE p.NroDoc = '45678901'
)