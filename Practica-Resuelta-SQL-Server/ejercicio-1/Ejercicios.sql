use EJERCICIO_1_R
go


--1. Listar los nombres de los proveedores de la ciudad de La Plata.
SELECT Nombre
from  Proveedor
WHERE Ciudad LIKE 'La Plata'

--2. Listar los números de artículos cuyo precio sea inferior a $10.
SELECT CodArt, Descripcion
from Articulo
WHERE Precio < 10

--3. Listar los responsables de los almacenes.
SElECT Responsable
from Almacen

--4. Listar los códigos de los materiales que provea el proveedor 3 y no los provea el proveedor 5.
SELECT CodMat
FROM Provisto_Por
WHERE CodProv LIKE '3' AND CodMat NOT IN (
    SELECT CodMat --cod materiales QUE provee el 5
    from Provisto_Por
    WHERE CodProv LIKE '5'
)
--otra forma
SELECT CodMat
FROM Provisto_Por
WHERE CodProv LIKE '3'
EXCEPT
SELECT CodMat
from Provisto_Por
WHERE CodProv LIKE '5'

--5. Listar los números de almacenes que almacenan el artículo 1.
SELECT Nro
FROM Tiene
WHERE CodArt LIKE '1'

--6. Listar los proveedores de Pergamino que se llamen Pérez.

SELECT *
FROM Proveedor
WHERE Ciudad LIKE 'Pergamino' and Nombre LIKE '%P_rez%'

--7. Listar los almacenes que contienen los artículos 1 y los artículos 2 (ambos).
SELECT Nro
FROM Tiene
WHERE CodArt LIKE '1'
INTERSECT
SELECT Nro
FROM Tiene
WHERE CodArt LIKE '2'
--otra forma
SELECT Nro
FROM Tiene
WHERE CodArt LIKE '1' AND Nro IN(
        SELECT Nro
        FROM Tiene
        WHERE CodArt LIKE '2'
)

--8. Listar los artículos que cuesten más de $100 o que estén compuestos por el material 1.

SELECT *
FROM Articulo a
join Compuesto_Por c on a.CodArt = c.CodArt
WHERE a.Precio > 100 OR c.CodMat LIKE '1'