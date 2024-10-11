use EJERCICIO_3
go

/*
Producto (idProducto, nombre, descrip, estado, idProveedor )
Proveedor (idProveedor, nombre, respdCivil, cuit)
Dirección ( idDir, idPers, calle, nro, piso, dpto )
Cliente (idCliente, nombre, respIVA, CUIL)
Vendedor (idEmpleado, nombre, apellido, DNI)
Venta (nroFactura, idCliente, fecha, idVendedor )
Detalle_venta(nroFactura,nro,idProducto, cantidad, precioUnitario)
*/


-- 1. Indique la cantidad de productos que tiene la empresa.
select count(*)
from producto

-- 2. Indique la cantidad de productos en estado 'en stock' que tiene la empresa.
select count(*)
from Producto
where estado LIKE 'en stock'

-- 3. Indique los productos que nunca fueron vendidos.
select p.nombre, p.descrip
from Producto p 
left join Detalle_venta d on d.idProducto = p.idProducto
where d.idProducto is NULL 

-- 4. Indique la cantidad de unidades que fueron vendidas de cada producto.
select idProducto, SUM(cantidad)
from Detalle_venta 
GROUP by idProducto

-- 5. Indique cual es la cantidad promedio de unidades vendidas de cada producto.
select idProducto, avg(cantidad)
from Detalle_venta 
GROUP by idProducto

-- 6. Indique quien es el vendedor con mas ventas realizadas.
--1ro cantidad de productos vendidos por vendedor
select v.idVendedor, SUM(d.cantidad)
from Venta v
join Detalle_venta d on d.nroFactura = v.nroFactura
GROUP by v.idVendedor

--2do saco el maximo de lo anterior
select MAX(aux.cantVentas)
from (
    select v.idVendedor, SUM(d.cantidad) as cantVentas
    from Venta v
    join Detalle_venta d on d.nroFactura = v.nroFactura
    GROUP by v.idVendedor
) as aux

--3ro finalmente
select v.idVendedor, SUM(d.cantidad) as cantVentas
from Venta v
join Detalle_venta d on d.nroFactura = v.nroFactura
GROUP by v.idVendedor
HAVING SUM(d.cantidad) = (
    select MAX(aux.cantVentas)
    from (
        select v.idVendedor, SUM(d.cantidad) as cantVentas
        from Venta v
        join Detalle_venta d on d.nroFactura = v.nroFactura
        GROUP by v.idVendedor
    ) as aux
)

-- 7. Indique todos los productos de lo que se hayan vendido más de 15.000 unidades.
select idProducto, SUM(cantidad)
from Detalle_venta 
GROUP by idProducto
HAVING SUM(cantidad) > 15000

-- 8. Indique quien es el vendedor con mayor volumen de ventas.
SELECT *
from Vendedor
where idEmpleado in(
    SELECT idVendedor
    from Venta
    GROUP by idVendedor
    having COUNT(nroFactura) = (
        SELECT MAX([cant de ventas]) as [mayor cantidad de ventas]
        from (
            select idVendedor, COUNT(nroFactura) as [cant de ventas]
            from Venta
            group by idVendedor
        )as aux
    )
)