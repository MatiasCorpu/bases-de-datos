use EJERCICIO_5_R
go

/*
GaleríaDeArte(id, nombre, disponible, calle, nro, localidad)
TipoDeObra(id, descripcion)
Autor(id, nya, fechaNacimiento)

Obra(id, nombre, material, idTipo, idAutor)
Temática(id, descripcion)
Exposición(idGaleria, idObra, idTematica, fecha, sala)
*/

--a - Obtener el nombre de la galería de arte, la descripción de la temática presentada y la fecha de realización, cuando la exposición tuvo la mayor cantidad de obras en expuestas. Sólo se mostrarán los resultados siempre y cuando la galería de arte haya presentado todas las temáticas disponibles o haya expuesto distintas obras a tal punto de haber presentado todos los tipos de obra disponibles.

--1ro 
GO
create or alter VIEW exposicion_cantidadObras
AS
select idGaleria, idTematica, fecha, COUNT(idObra) as cantObras
from Exposicion
GROUP by idGaleria, idTematica, fecha
go


--2do
GO
CREATE or alter VIEW exposicion_obrasMax 
as
SELECT idGaleria, idTematica, fecha
from exposicion_cantidadObras
WHERE cantObras = (
    SELECT MAX(cantObras)
    from exposicion_cantidadObras
)
go

--3ro 
go
create or alter VIEW geleria_todasTematicas
as
SELECT idGaleria, COUNT(idTematica) as tematicasPresentadas
from Exposicion
GROUP by idGaleria
HAVING COUNT(idTematica) = (
    select COUNT(*)
    from Tematica
)
go

--4to
go
CREATE or ALTER VIEW galeria_todosTiposObra
as
SELECT e.idGaleria, COUNT(o.idTipo) as cantidadTiposObra
from Exposicion e
join Obra o on o.id = e.idObra
GROUP by idGaleria
HAVING COUNT(o.idTipo) = (
    select COUNT(*)
    from TipoDeObra
)
go


--5to 
SELECT * 
from exposicion_obrasMax
WHERE idGaleria in (
    select idGaleria
    from geleria_todasTematicas
)
or
idGaleria in (
    select idGaleria
    from galeria_todosTiposObra
)

/*
GaleríaDeArte(id, nombre, disponible, calle, nro, localidad)
TipoDeObra(id, descripcion)
Autor(id, nya, fechaNacimiento)

Obra(id, nombre, material, idTipo, idAutor)
Temática(id, descripcion)
Exposición(idGaleria, idObra, idTematica, fecha, sala)
*/


--b - Se requiere crear un procedimiento almacenados q o función (PostgreSQL) para generar una nueva exposición, por lo tanto se desea recibir por parámetro, el id de la galería de arte, id de la temática, id de la obra a participar y la fecha. Si la exposición no existe se deberá asignar el número de sala “1”, pero si la exposición ya existiera deberá utilizarse el número de sala previamente cargado para la misma. Aclaración: Deberá validar que los id recibidos por parámetros existan en las tablas correspondientes.