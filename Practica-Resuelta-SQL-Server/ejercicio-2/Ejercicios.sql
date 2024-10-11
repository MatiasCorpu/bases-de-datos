use EJERCICIO_1_R
go

--1. Listar los nombres de los proveedores de la ciudad de La Plata.
SELECT Nombre
FROM Proveedor
WHERE Ciudad LIKE 'La Plata'

--2. Listar los números de artículos cuyo precio sea inferior a $10.
SELECT codArt
from Articulo
WHERE Precio <10

--3. Listar los responsables de los almacenes.
SELECT Responsable
FROM Almacen

--4. Listar los códigos de los materiales que provea el proveedor 3 y no los provea el proveedor 5.
SELECT CodMat
FROM Provisto_Por 
WHERE CodProv LIKE '3' and CodMat NOT IN (
    SELECT CodMat
    FROM Provisto_Por
    WHERE CodProv LIKE '5'
)

--5. Listar los números de almacenes que almacenan el artículo 1.
SELECT Nro
FROM Tiene
WHERE CodArt LIKE '1'

--6. Listar los proveedores de Pergamino que se llamen Pérez
SELECT *
FROM Proveedor
where Nombre LIKE '%P_rez%' and Ciudad LIKE 'Pergamino'

--7. Listar los almacenes que contienen los artículos 1 y los artículos 2 (ambos).
SELECT Nro
from Tiene
where CodArt LIKE '1'
INTERSECT
SELECT Nro
from Tiene
where CodArt LIKE '2'

--otra forma
SELECT Nro
from Tiene
where CodArt LIKE '1' AND Nro in (
    SELECT Nro
    from Tiene
    where CodArt LIKE '2'
)

--8. Listar los artículos que cuesten más de $100 o que estén compuestos por el material 1.
SELECT a.CodArt
from Articulo a join Compuesto_Por c on a.CodArt = c.CodArt
WHERE a.Precio > 100 or c.CodMat LIKE '1'

