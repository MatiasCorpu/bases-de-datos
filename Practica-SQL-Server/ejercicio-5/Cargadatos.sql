use EJERCICIO_5
go

-- Insertar datos en Rubro
INSERT INTO Rubro (CodRubro, NombRubro)
VALUES
(1, 'Acción'),
(2, 'Comedia'),
(3, 'Drama'),
(4, 'Policial');

-- Insertar datos en Pelicula
INSERT INTO Pelicula (CodPel, Titulo, Duracion, Año, CodRubro)
VALUES
(1, 'Rey León', 89, 1994, 1),
(2, 'Terminador 3', 109, 2003, 1),
(3, 'La Vida es Bella', 116, 1997, 2),
(4, 'El Padrino', 175, 1972, 3),
(5, 'El Silencio de los Inocentes', 118, 1991, 4),
(7, 'Interestellar', 80, 2014, 1);

-- Insertar datos en Ejemplar
INSERT INTO Ejemplar (CodEj, CodPel, Estado, Ubicación)
VALUES
(1, 1, 'Libre', 'A1'),
(2, 2, 'Libre', 'A2'),
(3, 3, 'Ocupado', 'A3'),
(4, 4, 'Libre', 'B1'),
(5, 5, 'Ocupado', 'B2'),
(6, 1, 'Ocupado', 'A1'),
(7, 2, 'Libre', 'A2');

-- Insertar datos en Cliente
INSERT INTO Cliente (Cod_Cli, Nombre, Apellido, Dirección, Tel, Email)
VALUES
(1, 'Juan', 'Perez', 'Calle 1', '111-1111', 'juan.perez@example.com'),
(2, 'Maria', 'Gomez', 'Calle 2', '222-2222', 'maria.gomez@example.com'),
(3, 'Carlos', 'Lopez', 'Calle 3', '333-3333', 'carlos.lopez@example.com'),
(4, 'Ana', 'Martinez', 'Calle 4', '444-4444', 'ana.martinez@example.com');

-- Insertar datos en Prestamo
INSERT INTO Prestamo (CodPrest, CodEj, CodPel, CodCli, FechaPrest, FechaDev)
VALUES
(1, 1, 1, 1, '2024-01-01', '2024-01-05'),
(2, 2, 2, 1, '2024-01-06', NULL),
(3, 3, 3, 2, '2024-01-07', '2024-01-10'),
(4, 4, 4, 3, '2024-02-01', '2024-02-05'),
(5, 5, 5, 3, '2024-02-06', NULL),
(6, 6, 1, 4, '2024-03-01', '2024-03-05'),
(7, 7, 2, 4, '2024-03-06', NULL),
(8, 1, 1, 1, '2024-03-07', '2024-03-10'),
(9, 2, 2, 1, '2024-03-11', '2024-03-15'),
(10, 1, 1, 4, '2024-04-01', NULL);
