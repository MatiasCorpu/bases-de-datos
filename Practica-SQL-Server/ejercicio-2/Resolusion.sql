USE EJERCICIO_2
GO

/*
Proveedor (NroProv, NomProv, Categoria, CiudadProv)
Articulo  (NroArt, Descripcion, CiudadArt, Precio)
Cliente   (NroCli, NomCli, CiudadCli)
Pedido    (NroPed, NroArt, NroCli, NroProv, FechaPedido, Cantidad, PrecioTotal)
Stock     (NroArt, fecha, cantidad)
*/

--0. Liste todos los proveedores
SELECT *
from Proveedor

--0.1. Liste los proveedores de la ciudad San Justo
SELECT *
from Proveedor
WHERE CiudadProv like 'San Justo'

--0.2. Liste los proveedores de Laferrere y de categoria 'cat2'
SELECT *
from Proveedor
WHERE CiudadProv LIKE 'Laferrere' and Categoria LIKE 'cat2'

--0.3. Liste los proveedores de San Justo o de categoria 'cat4'
SELECT *
from Proveedor
WHERE CiudadProv LIKE 'Laferrere' or Categoria LIKE 'cat4'

--1. Hallar el codigo (nroProv) de los proveedores que proveen el articulo a146.
select distinct p.NroProv
from Articulo a 
join Pedido p on p.NroArt = a.NroArt
WHERE a.Descripcion LIKE 'a146'

--2. Hallar los clientes (nomCli) que solicitan articulos provistos por p015.
SELECT distinct pd.NroCli
from Proveedor p
join Pedido pd on pd.NroProv = p.NroProv
WHERE p.NomProv LIKE 'p015'

--3. Hallar los clientes que solicitan algun item provisto por proveedores con categoria mayor que 4.
SELECT distinct NroCli
from Pedido p 
join Proveedor pr on pr.NroProv = p.NroProv
WHERE pr.Categoria > 4

--4. Hallar los pedidos en los que un cliente de Rosario solicita articulos producidos en la ciudad de Mendoza.
select distinct c.NroCli
from Pedido p 
join Cliente c on c.NroCli = p.NroCli
join Articulo a on a.NroArt = p.NroArt
where c.CiudadCli LIKE 'Rosario' and a.CiudadArt LIKE 'Mendoza'

--5. Hallar los pedidos en los que el cliente c23 solicita articulos solicitados por el cliente c30.             

SELECT p.NroPed, p.NroProv
from Pedido p
join Cliente c on c.NroCli = p.NroCli
where NroArt in (
    select distinct p.NroArt
    from Cliente c
    join Pedido p on p.NroCli = c.NroCli
    WHERE c.NomCli LIKE 'c30'
)
and c.NomCli LIKE 'c23'


--6.0. Hallar los proveedores que suministran todos los articulos
select NroProv
from Pedido
GROUP by NroProv
HAVING COUNT(distinct NroArt) = (
    SELECT count(*)
    from Articulo
)

--6.1. Hallar los proveedores que suministran todos los articulos cuyo precio es superior al precio promedio de todos los art.
--1ro precio promedio de todos los articulos
SELECT AVG(Precio)
from Articulo

--2do articulos con el precio superior al precio promedio
SELECT count(*)
from Articulo
WHERE Precio > (
    SELECT AVG(Precio)
    from Articulo
)

--3ro cantidad de articulos por proveedor cuyo precio es superior al precio promedio
SELECT p.NroProv, COUNT(distinct p.NroArt)
from Pedido p 
join Articulo a on a.NroArt = p.NroArt
WHERE a.Precio > (
    SELECT AVG(Precio)
    from Articulo
)
group by p.NroProv

--4 finalmente
SELECT p.NroProv, COUNT(distinct p.NroArt)
from Pedido p 
join Articulo a on a.NroArt = p.NroArt
WHERE a.Precio > (
    SELECT AVG(Precio)
    from Articulo
)
group by p.NroProv
HAVING COUNT(distinct p.NroArt) = (
    SELECT count(*)
    from Articulo
    WHERE Precio > (
        SELECT AVG(Precio)
        from Articulo
    )
)

--6.2. Hallar los proveedores que suministran todos los articulos cuyo precio es superior al precio promedio de los articulos que se producen en La Plata.
SELECT p.NroProv, COUNT(distinct p.NroArt)
from Pedido p 
join Articulo a on a.NroArt = p.NroArt
WHERE a.Precio > (
    SELECT AVG(Precio)
    from Articulo
    where CiudadArt LIKE 'La Plata'
)
group by p.NroProv
HAVING COUNT(distinct p.NroArt) = (
    SELECT count(*)
    from Articulo
    WHERE Precio > (
        SELECT AVG(Precio)
        from Articulo
        where CiudadArt LIKE 'La Plata'
    )
)

--7. Hallar la cantidad de articulos diferentes provistos por cada proveedor que provee a todos los clientes de Junin.

--1ro cantidad de clientes de junin
select COUNT(*)
from Cliente
WHERE CiudadCli like 'jun_n'

--2do proveedores y la cantidad de clientes de junin que suministran
select NroProv, COUNT(distinct c.NroCli)
from Pedido p 
join Cliente c on c.NroCli = p.NroCli
WHERE c.CiudadCli LIKE 'jun_n'
GROUP by NroProv

--3ro proveedores que proveen a todos los clientes de junin
select NroProv
from Pedido p 
join Cliente c on c.NroCli = p.NroCli
WHERE c.CiudadCli LIKE 'jun_n'
GROUP by NroProv
HAVING COUNT(distinct c.NroCli) = (
    select COUNT(*)
    from Cliente
    WHERE CiudadCli like 'jun_n'
)

--4 finalmente 
select distinct p.NroProv,  a.NroArt
from Articulo a 
join Pedido p on p.NroArt = a.NroArt
WHERE p.NroProv in (
    select NroProv
    from Pedido p 
    join Cliente c on c.NroCli = p.NroCli
    WHERE c.CiudadCli LIKE 'jun_n'
    GROUP by NroProv
    HAVING COUNT(distinct c.NroCli) = (
        select COUNT(*)
        from Cliente
        WHERE CiudadCli like 'jun_n'
    )
)

--8. Hallar los nombres de los proveedores cuya categoria sea mayor que la de todos los proveedores que proveen el articulo cuaderno.

--1ro categoria mayor de los proveedores que proveen el articulo cuaderno
SELECT MAX(p.Categoria)
from Proveedor p 
join Pedido pd on pd.NroProv = p.NroProv
join Articulo a on a.NroArt = pd.NroArt
WHERE a.Descripcion LIKE 'cuaderno'

--2do finalmente
SELECT *
from Proveedor 
WHERE Categoria > (
    SELECT MAX(p.Categoria)
    from Proveedor p 
    join Pedido pd on pd.NroProv = p.NroProv
    join Articulo a on a.NroArt = pd.NroArt
    WHERE a.Descripcion LIKE 'cuaderno'
)

--9. Hallar los proveedores que han provisto mas de 1000 unidades entre los articulos 1 y 100
SELECT NroProv, sum(distinct Cantidad)
from Pedido
WHERE NroArt BETWEEN 1 and 100
group by NroProv
having sum(distinct Cantidad) > 1000

--10. Listar la cantidad y el precio total de cada articulo que han pedido los Clientes a sus proveedores entre las fechas 01-01-2004 y 31-03-2004 (se requiere visualizar Cliente, Articulo, Proveedor, Cantidad y Precio).
SELECT NroCli, NroArt, sum(Cantidad) , sum(PrecioTotal)
from Pedido
where FechaPedido BETWEEN '01-01-2004' and '31-03-2004'
GROUP by NroCli, NroArt


--11. Idem anterior y que ademas la Cantidad sea mayor o igual a 1000 o el Precio sea mayor a $1000
SELECT NroCli, NroArt, sum(Cantidad) , sum(PrecioTotal)
from Pedido
where FechaPedido BETWEEN '01-01-2004' and '31-03-2004'
GROUP by NroCli, NroArt
HAVING sum(Cantidad) >= 1000 or sum(PrecioTotal) > 1000

--12. Listar la descripcion de los articulos en donde se hayan pedido en el dia mas del stock existente para ese mismo dia.

--1ro cantidad de articulos pedidos en el dia
select NroArt, cast(FechaPedido as date), sum(Cantidad)
from Pedido 
GROUP by NroArt, cast(FechaPedido as date)

--2do stock existente en el dia
select p.NroArt, cast(s.fecha as date), sum(s.cantidad)
from Pedido p 
join Stock s on s.NroArt = p.NroArt
GROUP by p.NroArt, cast(s.fecha as date)

--finalemte
SELECT *
from (
    select NroArt, cast(FechaPedido as date) as dia, sum(Cantidad) as cant
    from Pedido 
    GROUP by NroArt, cast(FechaPedido as date)
) as T 
left join Stock s on s.NroArt = t.NroArt and s.fecha = t.dia
WHERE t.cant > s.cantidad


--13. Listar los datos de los proveedores que hayan pedido de todos los articulos en un mismo dia. Verificar solo en el ultimo mes de pedidos.

SELECT NroProv, cast(FechaPedido as date), COUNT(distinct NroArt)
from Pedido
WHERE FechaPedido BETWEEN DATEADD(MONTH, -1, GETDATE()) and GETDATE()
GROUP by NroProv,cast(FechaPedido as date)
having COUNT(distinct NroArt) = (
    select COUNT(*)
    from Articulo
)


--14. Listar los proveedores a los cuales no se les haya solicitado ningun articulo en el ultimo mes, pero si se les haya pedido en el mismo mes del año anterior.

--1ro proveedores que no se le haya solicitado ningun articulo en el ultimo mes
SELECT NroProv
from Proveedor
WHERE NroProv not in (
    select distinct NroProv
    from Pedido
    where FechaPedido >= DATEADD(MONTH, -1, GETDATE())
    and FechaPedido <= GETDATE()
)

--2do proveedores que si se les haya pedido en el mismo mes del año pasado
SELECT NroProv
from Pedido
WHERE FechaPedido >= DATEADD(YEAR, -1, DATEADD(MONTH, -1, GETDATE()))
and FechaPedido <= DATEADD(YEAR, -1, GETDATE())

--3ro finalmente
SELECT NroProv
from Proveedor
WHERE NroProv not in (
    select distinct NroProv
    from Pedido
    where FechaPedido >= DATEADD(MONTH, -1, GETDATE())
    and FechaPedido <= GETDATE()
)
INTERSECT
SELECT NroProv
from Pedido
WHERE FechaPedido >= DATEADD(YEAR, -1, DATEADD(MONTH, -1, GETDATE()))
and FechaPedido <= DATEADD(YEAR, -1, GETDATE())


--15. Listar los nombres de los clientes que hayan solicitado m�s de un art�culo cuyo precio sea superior a $100 y que correspondan a proveedores de Capital Federal. Por ejemplo, se considerar� si se ha solicitado el art�culo a2 y a3, pero no si solicitaron 5 unidades del articulo a2.

--1ro clientes que hallan solicitado mas de un articulo con el precio > 100
SELECT c.NroCli, c.NomCli
from Cliente c 
join Pedido p on p.NroCli = c.NroCli
join Articulo a on a.NroArt = p.NroArt
join Proveedor pr on pr.NroProv = p.NroProv
WHERE pr.CiudadProv LIKE 'Capital Federal' and a.Precio > 100
group by c.NroCli, c.NomCli
HAVING COUNT(distinct p.NroArt) >= 2
