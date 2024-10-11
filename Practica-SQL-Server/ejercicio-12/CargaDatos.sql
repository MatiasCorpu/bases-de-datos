use EJERICICIO_12
go

-- Insertar datos en la tabla Proveedor
INSERT INTO Proveedor (CodProv, RazonSocial, FechaInicio) VALUES
(1, 'Proveedor A', '2020-01-01'),
(2, 'Proveedor B', '2019-05-15'),
(3, 'Proveedor C', '2018-08-20');

-- Insertar datos en la tabla Producto
INSERT INTO Producto (CodProd, Descripcion, CodProv, StockActual) VALUES
(1, 'Producto 1', 1, 50),
(2, 'Producto 2', 2, 0),
(3, 'Producto 3', 3, 30),
(4, 'Producto 4', 1, 0),
(5, 'Producto 5', 2, 20);

-- Insertar datos en la tabla Stock
INSERT INTO Stock (Nro, Fecha, CodProd, Cantidad) VALUES
(1, '2024-01-01', 1, 50),
(2, '2024-01-02', 2, 0),
(3, '2024-01-03', 3, 30),
(4, '2024-01-04', 4, 0),
(5, '2024-01-05', 5, 20);
