-- Usar la base de datos
USE EJERCICIO_7;
GO

-- Insertar datos en la tabla Coche
INSERT INTO Coche (matricula, modelo, año)
VALUES 
('AAA123', 'Toyota Corolla', 2018),
('BBB456', 'Honda Civic', 2019),
('CCC789', 'Ford Focus', 2020),
('DDD101', 'Chevrolet Cruze', 2021);

-- Insertar datos en la tabla Chofer
INSERT INTO Chofer (nroLicencia, nombre, apellido, fecha_ingreso, telefono)
VALUES 
('LIC123', 'Juan', 'Perez', '2020-01-15', '123456789'),
('LIC456', 'Ana', 'Gomez', '2019-03-10', '987654321'),
('LIC789', 'Carlos', 'Diaz', '2018-07-22', '456789123'),
('LIC101', 'María', 'Lopez', '2021-05-18', '321654987');

-- Insertar datos en la tabla Cliente
INSERT INTO Cliente (nroCliente, calle, nro, localidad)
VALUES 
(1, 'Main St', 123, 'Springfield'),
(2, '2nd St', 456, 'Shelbyville'),
(3, '3rd St', 789, 'Capital City'),
(4, '4th St', 101, 'Ogdenville');

INSERT INTO Viaje (FechaHoraInicio, FechaHoraFin, chofer, cliente, coche, kmTotales, esperaTotal, costoEspera, costoKms)
VALUES 
('20230401 08:00:00', '20230401 09:00:00', 'LIC123', 1, 'AAA123', 50.0, 15.0, 150.0, 500.0),
('20230405 10:00:00', '20230405 11:00:00', 'LIC123', 1, 'BBB456', 30.0, 10.0, 100.0, 300.0),
('20230510 12:00:00', '20230510 13:30:00', 'LIC456', 2, 'AAA123', 60.0, 20.0, 200.0, 600.0),
('20230515 14:00:00', '20230515 15:00:00', 'LIC456', 2, 'CCC789', 40.0, 10.0, 100.0, 400.0),
('20240501 08:00:00', '20240501 09:30:00', 'LIC789', 3, 'AAA123', 70.0, 30.0, 300.0, 700.0),
('20240505 09:00:00', '20240505 10:00:00', 'LIC789', 3, 'BBB456', 20.0, 5.0, 50.0, 200.0),
('20240510 11:00:00', '20240510 12:00:00', 'LIC101', 4, 'CCC789', 55.0, 25.0, 250.0, 550.0),
('20240515 12:00:00', '20240515 13:30:00', 'LIC101', 4, 'DDD101', 80.0, 35.0, 350.0, 800.0),
('20240401 10:00:00', '20240401 11:30:00', 'LIC123', 1, 'DDD101', 45.0, 20.0, 200.0, 450.0),
('20240520 08:00:00', '20240520 09:00:00', 'LIC456', 2, 'AAA123', 60.0, 15.0, 150.0, 600.0),
('20240525 08:00:00', '20240525 09:00:00', 'LIC456', 2, 'BBB456', 35.0, 10.0, 100.0, 350.0);

