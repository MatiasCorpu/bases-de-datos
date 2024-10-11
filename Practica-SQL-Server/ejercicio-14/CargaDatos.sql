use EJERCICIO_14
go

-- Insertar datos en la tabla Cliente
INSERT INTO Cliente (NroCliente, RazonSocial)
VALUES 
(1, 'Cliente A'),
(2, 'Cliente B'),
(3, 'Cliente C');

-- Insertar datos en la tabla Servicio
INSERT INTO Servicio (NroServicio, Descripción, Precio)
VALUES 
(1, 'Servicio 1', 50.00),
(2, 'Servicio 2', 75.00),
(3, 'Servicio 3', 100.00);

-- Insertar datos en la tabla Festejo
INSERT INTO Festejo (NroFestejo, Descripción, fecha, nrocliente)
VALUES 
(1, 'Festejo 1', '2024-01-01', 1),
(2, 'Festejo 2', '2024-02-15', 2),
(3, 'Festejo 3', '2024-03-20', 3);

-- Insertar datos en la tabla Contrata
INSERT INTO Contrata (NroFestejo, Item, NroServicio, HDesde, HHasta)
VALUES 
(1, 1, 1, '10:00:00', '12:00:00'),
(1, 2, 2, '14:00:00', '16:00:00'),
(2, 1, 2, '09:00:00', '11:00:00'),
(3, 1, 3, '12:00:00', '15:00:00');

