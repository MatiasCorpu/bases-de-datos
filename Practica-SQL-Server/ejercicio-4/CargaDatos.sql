use EJERCICIO_4
go

-- Eliminar datos previos
DELETE FROM Supervisa;
DELETE FROM Vive;
DELETE FROM Trabaja;
DELETE FROM Situada_En;
DELETE FROM Empresa;
DELETE FROM Persona;

-- Insertar datos en Persona
INSERT INTO Persona (dni, nomPersona, telefono)
VALUES
('12345678', 'Juan Perez', '111-1111'),
('23456789', 'Maria Lopez', '222-2222'),
('34567890', 'Carlos Diaz', '333-3333'),
('45678901', 'Ana Gomez', '444-4444'),
('56789012', 'Luis Martinez', '555-5555'),
('67890123', 'Laura Fernandez', '666-6666');

-- Insertar datos en Empresa
INSERT INTO Empresa (nomEmpresa, telefono)
VALUES
('Banelco', '777-7777'),
('Telecom', '888-8888'),
('Paulinas', '999-9999'),
('Clarín', '101-1010'),
('Sony', '202-2020');

-- Insertar datos en Vive
INSERT INTO Vive (dni, calle, ciudad)
VALUES
('12345678', 'Calle 1', 'Ciudad A'),
('23456789', 'Calle 2', 'Ciudad B'),
('34567890', 'Calle 3', 'Ciudad A'),
('45678901', 'Calle 4', 'Ciudad C'),
('56789012', 'Calle 5', 'Ciudad B'),
('67890123', 'Calle 6', 'Ciudad D'),
('67890123', 'Calle 1', 'Ciudad A');  -- Laura Fernandez vive en dos lugares

-- Insertar datos en Trabaja
INSERT INTO Trabaja (dni, nomEmpresa, salario, feIngreso, feEgreso)
VALUES
('12345678', 'Banelco', 1200, '2000-01-01', '2002-01-01'),
('23456789', 'Telecom', 1300, '2001-01-01', '2003-01-01'),
('34567890', 'Paulinas', 1600, '2002-01-01', '2004-01-01'),
('45678901', 'Clarín', 1400, '2003-01-01', '2005-01-01'),
('56789012', 'Sony', 1500, '2004-01-01', NULL),
('67890123', 'Sony', 1700, '2005-01-01', NULL),
('12345678', 'Telecom', 1800, '2006-01-01', NULL),
('23456789', 'Paulinas', 2000, '2007-01-01', NULL),
('34567890', 'Sony', 2200, '2008-01-01', NULL),
('45678901', 'Sony', 2500, '2009-01-01', NULL),
('56789012', 'Banelco', 2700, '2010-01-01', NULL);

-- Insertar datos en Situada_En
INSERT INTO Situada_En (nomEmpresa, ciudad)
VALUES
('Banelco', 'Ciudad A'),
('Telecom', 'Ciudad B'),
('Paulinas', 'Ciudad C'),
('Clarín', 'Ciudad A'),
('Sony', 'Ciudad D');

-- Insertar datos en Supervisa
INSERT INTO Supervisa (dniPer, dniSup)
VALUES
('12345678', '23456789'),
('34567890', '45678901'),
('56789012', '67890123'),
('67890123', '12345678'),
('23456789', '34567890');


--mas datos insertados:

-- Insertar nuevos datos en Persona
INSERT INTO Persona (dni, nomPersona, telefono)
VALUES
('78901234', 'Pedro Gonzalez', '777-7777'),
('89012345', 'Sofia Ramirez', '888-8888'),
('90123456', 'Miguel Alvarez', '999-9999'),
('12340987', 'Lucia Mendez', '101-1010'),
('23451987', 'Raul Ortega', '202-2020');

-- Insertar nuevos datos en Trabaja (empleados con más de 4 empleos entre 2000 y 2004)
INSERT INTO Trabaja (dni, nomEmpresa, salario, feIngreso, feEgreso)
VALUES
('78901234', 'Banelco', 1300, '2000-01-01', '2000-12-31'),
('78901234', 'Telecom', 1400, '2001-01-01', '2001-12-31'),
('78901234', 'Paulinas', 1500, '2002-01-01', '2002-12-31'),
('78901234', 'Clarín', 1600, '2003-01-01', '2003-12-31'),
('78901234', 'Sony', 1700, '2004-01-01', '2004-03-31'),

('89012345', 'Banelco', 1100, '2000-02-01', '2000-12-31'),
('89012345', 'Telecom', 1200, '2001-02-01', '2001-12-31'),
('89012345', 'Paulinas', 1300, '2002-02-01', '2002-12-31'),
('89012345', 'Clarín', 1400, '2003-02-01', '2003-12-31'),
('89012345', 'Sony', 1500, '2004-02-01', '2004-03-31');

-- Insertar nuevos datos en Supervisa (empleados con al menos 5 supervisores)
INSERT INTO Supervisa (dniPer, dniSup)
VALUES
('78901234', '12345678'),
('78901234', '23456789'),
('78901234', '34567890'),
('78901234', '45678901'),
('78901234', '56789012'),

('89012345', '12345678'),
('89012345', '23456789'),
('89012345', '34567890'),
('89012345', '45678901'),
('89012345', '56789012');
