use EJERCICIO_5
go

/*
Pelicula (CodPel, Titulo, Duracion, Año, CodRubro)
Rubro (CodRubro, NombRubro)
Ejemplar (CodEj, CodPel, Estado, Ubicación) Estado: Libre,Ocupado
Cliente (Cod_Cli, Nombre, Apellido, Dirección, Tel, Email)
Prestamo (CodPrest, CodEj, CodPel, CodCli, FechaPrest, FechaDev)
*/

-- 1. Listar los clientes que no hayan reportado préstamos del rubro “Policial”.
SELECT *
from Cliente 
WHERE Cod_Cli not in(
    select c.Cod_Cli
    from Cliente c 
    join Prestamo p on p.CodCli = c.Cod_Cli
    join Pelicula pel on pel.CodPel = p.CodPel
    join Rubro r on r.CodRubro = pel.CodRubro
    where r.NombRubro like 'Policial'
)

-- 2. Listar las películas de mayor duración que alguna vez fueron prestadas.
SELECT *
FROM Pelicula
WHERE Duracion = (
    SELECT MAX(p.Duracion)
    from Pelicula p 
    join Prestamo pr on pr.CodPel = p.CodPel
)

-- 3. Listar los clientes que tienen más de un préstamo sobre la misma película (listar Cliente, Película y cantidad de préstamos).
select CodCli, CodPel, COUNT(*)
from Prestamo 
GROUP by CodCli, CodPel
HAVING COUNT(*) > 1

-- 4. Listar los clientes que han realizado préstamos del título “Rey León” y “Terminador 3” (Ambos).

SELECT distinct pr.CodCli
from Prestamo pr 
join Pelicula p on p.CodPel = pr.CodPel
where p.Titulo LIKE 'Rey Le_n'
INTERSECT
SELECT distinct pr.CodCli
from Prestamo pr 
join Pelicula p on p.CodPel = pr.CodPel
where p.Titulo LIKE 'Terminador 3'

-- 5. Listar las películas más vistas en cada mes (Mes, Película, Cantidad de Alquileres).
SELECT CodPel, FORMAT(FechaPrest, 'yyyy-MM'), COUNT(*) as cantPresatamos
from Prestamo
GROUP by CodPel, FORMAT(FechaPrest, 'yyyy-MM')

-- 6. Listar los clientes que hayan alquilado todas las películas del video.
--1ro cantidad total de peliculas
select COUNT(distinct CodPel)
from Pelicula

--2do cliente y la cantidad de peliculas alquiladas
SELECT CodCli, COUNT(distinct CodPel) as cantPelisAlquiladas
from Prestamo
GROUP by CodCli

--3ro finalmente
SELECT CodCli, COUNT(distinct CodPel) as cantPelisAlquiladas
from Prestamo 
GROUP by CodCli
HAVING COUNT(distinct CodPel) = (
    select COUNT(distinct CodPel)
    from Pelicula
)


-- 7. Listar las películas que no han registrado ningún préstamo a la fecha.
select *
from Pelicula
WHERE CodPel not in (
    select distinct CodPel
    from Prestamo
)

-- 8. Listar los clientes que no han efectuado la devolución de ejemplares.
SELECT *
from Cliente
WHERE Cod_Cli in (
    select CodCli
    from Prestamo
    where FechaDev is null
)

-- 9. Listar los títulos de las películas que tienen la mayor cantidad de préstamos.
--1ro cantidad maxima de prestamos de una pelicula
SELECT MAX(cantPrestamos)
from (
    select CodPel, COUNT(*) as cantPrestamos
    from Prestamo
    GROUP by CodPel
)as A

--2do finalmente
select CodPel, COUNT(*)
from Prestamo
GROUP by CodPel
HAVING COUNT(*) = (
    SELECT MAX(cantPrestamos)
    from (
        select CodPel, COUNT(*) as cantPrestamos
        from Prestamo
        GROUP by CodPel
    )as A
)

-- 10. Listar las películas que tienen todos los ejemplares prestados

--1ro cant de ejemplares por pelicula
SELECT e.CodPel, COUNT(distinct e.CodEj) as cantEjemplares
from Ejemplar e 
join Pelicula p on p.CodPel = e.CodPel
GROUP by e.CodPel

--2do cant de ejemplares cupados por pelicula
SELECT e.CodPel, COUNT(distinct e.CodEj) as cantEjemplares
from Ejemplar e 
join Pelicula p on p.CodPel = e.CodPel
where e.Estado LIKE 'Ocupado'
GROUP by e.CodPel

--3ro finalmente
SELECT e.CodPel, COUNT(distinct e.CodEj) as cantEjemplares
from Ejemplar e 
join Pelicula p on p.CodPel = e.CodPel
GROUP by e.CodPel
INTERSECT
SELECT e.CodPel, COUNT(distinct e.CodEj) as cantEjemplares
from Ejemplar e 
join Pelicula p on p.CodPel = e.CodPel
where e.Estado LIKE 'Ocupado'
GROUP by e.CodPel