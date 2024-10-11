use EJERCICIO_1_R
go

/*
Almacen(Nro int primary key, Responsable varchar(50))
Articulo(CodArt int primary key, Descripcion varchar(50), Precio decimal(12, 3))
Material(CodMat int primary key, Descripcion varchar(50))
Proveedor(CodProv int primary key, Nombre varchar(50), Domicilio varchar(50), Ciudad varchar(50))
Tiene(Nro int, CodArt int)
Compuesto_Por(CodArt int, CodMat int)
Provisto_Por(CodMat int, CodProv int)
*/

-- 1. Listar los nombres de los proveedores de la ciudad de La Plata.
select Nombre
from Proveedor
WHERE Ciudad LIKE 'La Plata'

-- 2. Listar los números de artículos cuyo precio sea inferior a $10.
SELECT CodArt
from Articulo
WHERE Precio < 10

-- 3. Listar los responsables de los almacenes.
select Responsable
from Almacen

-- 4. Listar los códigos de los materiales que provea el proveedor 10 y no los provea el proveedor 15.
select distinct CodMat
from Provisto_Por
where CodProv LIKE '10'
EXCEPT
SELECT distinct CodMat
from Provisto_Por
WHERE CodProv LIKE '15'

-- 5. Listar los números de almacenes que almacenan el artículo A.
SELECT Nro
from Tiene
where CodArt LIKE '1'

-- 6. Listar los proveedores de Pergamino que se llamen Pérez.
select *
from Proveedor
WHERE Ciudad LIKE 'Pergamino' and Nombre LIKE '%P_rez'

-- 7. Listar los almacenes que contienen los artículos A y los artículos B (ambos).
SELECT Nro
from Tiene 
WHERE CodArt LIKE '2'
INTERSECT
SELECT Nro
from Tiene 
WHERE CodArt LIKE '1'

--otra forma
SELECT Nro
FROM Tiene
where CodArt LIKE '1' and Nro in (
    select Nro
    from Tiene
    where CodArt LIKE '2'
)

-- 8. Listar los artículos que cuesten más de $100 o que estén compuestos por el material M1.
select a.CodArt, a.Descripcion, a.Precio
from Articulo a 
JOIN Compuesto_Por c on c.CodArt = a.CodArt
WHERE a.Precio > 100 or c.CodMat like '1'

-- 9. Listar los materiales, código y descripción, provistos por proveedores de la ciudad de Rosario.
select distinct m.CodMat, m.Descripcion
from Proveedor p
join Provisto_Por pp on pp.CodProv = p.CodProv
join Material m on m.CodMat = pp.CodMat
WHERE p.Ciudad like 'CABA'

-- 10. Listar el código, descripción y precio de los artículos que se almacenan en A1.
SELECT a.CodArt, a.Descripcion, a.Precio
from Articulo a
join Tiene t on t.CodArt = a.CodArt
WHERE t.Nro LIKE '2'

-- 11. Listar la descripción de los materiales que componen el artículo B.
select m.CodMat, m.Descripcion
from Material m
join Compuesto_Por c on c.CodMat = m.CodMat
WHERE c.CodArt LIKE '1'

-- 12. Listar los nombres de los proveedores que proveen los materiales al almacén que Martín Gómez tiene a su cargo.
select distinct p.Nombre
from Proveedor p 
join Provisto_Por pp on pp.CodProv = p.CodProv
join Compuesto_Por c on c.CodMat = pp.CodMat
join Tiene t on t.CodArt = c.CodArt
join Almacen a on a.Nro = t.Nro
WHERE a.Responsable LIKE 'Jose Basualdo'

-- 13. Listar códigos y descripciones de los artículos compuestos por al menos un material provisto por el proveedor López.
SELECT distinct a.CodArt, a.Descripcion
from Proveedor p 
join Provisto_Por pp on pp.CodProv = p.CodProv
join Compuesto_Por c on c.CodMat = pp.CodMat
join Articulo a on a.CodArt = c.CodArt
WHERE p.Nombre LIKE '%Pedrito'

-- 14. Hallar los códigos y nombres de los proveedores que proveen al menos un material que se usa en algún artículo cuyo precio es mayor a $100.
SELECT distinct p.CodProv, p.Nombre
from Articulo a 
join Compuesto_Por c on c.CodArt = a.CodArt
join Provisto_Por pp on pp.CodMat = c.CodMat
join Proveedor p on p.CodProv = pp.CodProv
WHERE a.Precio > 10

-- 15. Listar los números de almacenes que tienen todos los artículos que incluyen el material con código 1.
--1ro cuento cuantos articulos tienen cada almacen con articulos compuestos por material de codigo 1
SELECT t.nro, COUNT(distinct t.CodArt)
from Tiene t
join Compuesto_Por c on c.CodArt = t.CodArt
WHERE c.CodMat LIKE '1'
GROUP by t.Nro

--2do cuento cuantos articulos tienen cada almacen
SELECT nro, COUNT(distinct CodArt)
from Tiene 
GROUP by Nro

--3ro junto ambas
SELECT t.nro
from Tiene t
join Compuesto_Por c on c.CodArt = t.CodArt
WHERE c.CodMat LIKE '1'
GROUP by t.Nro
HAVING COUNT(distinct t.CodArt) in (
    SELECT COUNT(distinct CodArt)
    from Tiene 
    GROUP by Nro
)

--otra forma 
SELECT t.Nro
FROM Tiene t
WHERE EXISTS (
    SELECT c.CodArt
    FROM Compuesto_Por c
    WHERE c.CodMat = '1'
    AND NOT EXISTS (
        SELECT 1
        FROM Tiene t2
        WHERE t2.Nro = t.Nro
        AND t2.CodArt = c.CodArt
    )
)
GROUP BY t.Nro;

-- 16. Listar los proveedores de Capital Federal que sean únicos proveedores de algún material.
select distinct p.Nombre, p.Ciudad, pp.CodMat
from Proveedor p
join Provisto_Por pp on pp.CodProv = p.CodProv
where pp.CodMat in (
    select CodMat
    from Provisto_Por
    GROUP by CodMat
    HAVING COUNT(distinct CodProv) = 1
)

-- 17. Listar el/los artículo/s de mayor precio.
SELECT *
FROM Articulo
WHERE Precio = (
    SELECT MAX(Precio)
    from Articulo
)

-- 18. Listar el/los artículo/s de menor precio.
SELECT *
FROM Articulo
WHERE Precio = (
    SELECT min(Precio)
    from Articulo
)

-- 19. Listar el promedio de precios de los artículos en cada almacén.
--promedio de precios de los articulos por almacen
SELECT t.Nro, AVG(a.Precio)
from Articulo a
join Tiene t on t.CodArt = a.CodArt
GROUP by t.Nro

-- 20. Listar los almacenes que almacenan la mayor cantidad de artículos.
--1ro almacenes y su cantidad de articulos
SELECT Nro, COUNT(distinct CodArt)
from Tiene
GROUP by Nro
--2do cantidad maxima de articulos almacenados por un almacen
SELECT MAX(A.artPorAlmacen)
FROM (
    SELECT Nro, COUNT(distinct CodArt) as artPorAlmacen
    from Tiene
    GROUP by Nro
) as A
--finalmente
SELECT Nro
from Tiene
GROUP BY Nro
HAVING COUNT(distinct CodArt) = (
    SELECT MAX(A.artPorAlmacen)
    FROM (
        SELECT Nro, COUNT(distinct CodArt) as artPorAlmacen
        from Tiene
        GROUP by Nro
    ) as A
)


-- 21. Listar los artículos compuestos por al menos 2 materiales.
select CodArt, COUNT(distinct CodMat) as cantMateriales
from Compuesto_Por
GROUP by CodArt
HAVING COUNT(distinct CodMat) >= 2

-- 22. Listar los artículos compuestos por exactamente 2 materiales.
select CodArt, COUNT(distinct CodMat) as cantMateriales
from Compuesto_Por
GROUP by CodArt
HAVING COUNT(distinct CodMat) = 2

-- 23. Listar los artículos que estén compuestos con hasta 2 materiales.
select CodArt, COUNT(distinct CodMat) as cantMateriales
from Compuesto_Por
GROUP by CodArt
HAVING COUNT(distinct CodMat) <= 2

-- 24. Listar los artículos compuestos por todos los materiales.
--1ro cantidad total de materiales
SELECT CodArt, COUNT(distinct CodMat) as cantMateriales
from Compuesto_Por 
GROUP by CodArt 
having COUNT(distinct CodMat) = (
    SELECT COUNT(*) as cantTotalMateriales
    from Material
)

-- 25. Listar las ciudades donde existan proveedores que provean todos los materiales
--1ro cantidad total de materiales
select count(*)
from Material

--2do cantidad de materiales provistos por proveedores
SELECT CodProv, COUNT(distinct CodMat)
from Provisto_Por
group by CodProv

--finalemnte 
SELECT Nombre, Ciudad
from Proveedor
WHERE CodProv in (
    SELECT CodProv
    from Provisto_Por
    group by CodProv
    HAVING COUNT(distinct CodMat) = (
        select count(*)
        from Material
    )
)