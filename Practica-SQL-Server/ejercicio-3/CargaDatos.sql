use EJERCICIO_3
GO

INSERT INTO Proveedor (idProveedor, nombre, respdCivil, cuit)
VALUES 
(1, 'Proveedor A', 'Responsabilidad 1', '20-11111111-1'),
(2, 'Proveedor B', 'Responsabilidad 2', '20-22222222-2');

INSERT INTO Producto (idProducto, nombre, descrip, estado, idProveedor)
VALUES 
(1, 'Producto 1', 'Descripción 1', 'en stock', 1),
(2, 'Producto 2', 'Descripción 2', 'en stock', 1),
(3, 'Producto 3', 'Descripción 3', 'agotado', 2),
(4, 'Producto 4', 'Descripción 4', 'en stock', 2),
(5, 'Producto 5', 'Descripción 5', 'en stock', 1);

INSERT INTO Dirección (idDir, idPers, calle, nro, piso, dpto)
VALUES 
(1, 1, 'Calle 1', '123', '1', 'A'),
(2, 2, 'Calle 2', '456', '2', 'B'),
(3, 3, 'Calle 3', '789', '3', 'C');

INSERT INTO Cliente (idCliente, nombre, respIVA, CUIL)
VALUES 
(1, 'Cliente A', 'IVA Responsable Inscripto', '20-33333333-3'),
(2, 'Cliente B', 'Monotributista', '20-44444444-4');

INSERT INTO Vendedor (idEmpleado, nombre, apellido, DNI)
VALUES 
(1, 'Vendedor A', 'Apellido A', '12345678'),
(2, 'Vendedor B', 'Apellido B', '87654321');

INSERT INTO Venta (nroFactura, idCliente, fecha, idVendedor)
VALUES 
(1, 1, '2024-05-01', 1),
(2, 1, '2024-05-02', 1),
(3, 2, '2024-05-03', 2),
(4, 2, '2024-05-04', 2);

INSERT INTO Detalle_venta (nroFactura, nro, idProducto, cantidad, precioUnitario)
VALUES 
(1, 1, 1, 100, 10.00),
(1, 2, 2, 150, 20.00),
(2, 1, 3, 200, 30.00),
(2, 2, 4, 250, 40.00),
(3, 1, 1, 300, 10.00),
(3, 2, 5, 350, 50.00),
(4, 1, 2, 400, 20.00),
(4, 2, 4, 450, 40.00);
