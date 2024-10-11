use master
go

use EJERCICIO_9
go 

-- Datos para la tabla Persona
INSERT INTO Persona (TipoDoc, NroDoc, Nombre, Direccion, FechaNac, Sexo) VALUES
('DNI', '12345678', 'José Pérez', 'Calle Falsa 123', '1980-05-15', 'M'),
('DNI', '87654321', 'Ana Gómez', 'Avenida Siempreviva 742', '1982-07-30', 'F'),
('DNI', '56789012', 'Carlos Pérez', 'Calle Falsa 123', '2005-03-22', 'M'),
('DNI', '09876543', 'María Pérez', 'Calle Falsa 123', '2008-11-12', 'F'),
('DNI', '34567890', 'Marta López', 'Calle Falsa 123', '1955-10-10', 'F'),
('DNI', '45678901', 'Juan Pérez', 'Calle Falsa 123', '1945-01-01', 'M'),
('DNI', '23456789', 'Luis Pérez', 'Calle Falsa 123', '2020-06-06', 'M');

-- Datos para la tabla Progenitor
INSERT INTO Progenitor (TipoDoc, NroDoc, TipoDocHijo, NroDocHijo) VALUES
('DNI', '12345678', 'DNI', '56789012'),  -- José Pérez -> Carlos Pérez
('DNI', '12345678', 'DNI', '09876543'),  -- José Pérez -> María Pérez
('DNI', '45678901', 'DNI', '12345678'),  -- Juan Pérez -> José Pérez
('DNI', '45678901', 'DNI', '34567890'),  -- Juan Pérez -> Marta López
('DNI', '34567890', 'DNI', '87654321'),  -- Marta López -> Ana Gómez
('DNI', '34567890', 'DNI', '12345678'),  -- Marta López -> José Pérez
('DNI', '56789012', 'DNI', '23456789');  -- Carlos Pérez -> Luis Pérez