use EJERCICIO_11
go

-- 2. Realice los INSERTs necesarios para cargar en las tablas creadas en el punto anterior los datos de 5 clientes, 10 peliculas (y tablas relacionadas a estas) y al menos 15 alquileres.

INSERT INTO Genero(id, NombGenero) VALUES
(1, 'Accion'),
(2, 'Comedia'),
(3, 'Drama'),
(4, 'Terror'),
(5, 'Ciencia Ficcion');

INSERT INTO Director (Id, NyA) VALUES
(1, 'Steven Spielberg'),
(2, 'Christopher Nolan'),
(3, 'Quentin Tarantino'),
(4, 'Martin Scorsese'),
(5, 'Alfred Hitchcock');

INSERT INTO Pelicula (CodPel, Titulo, Duracion, CodGenero, IdDirector) VALUES
(1, 'Pelicula 1', 120, 1, 1),
(2, 'Pelicula 2', 110, 2, 2),
(3, 'Pelicula 3', 130, 3, 3),
(4, 'Pelicula 4', 140, 4, 4),
(5, 'Pelicula 5', 150, 5, 5),
(6, 'Pelicula 6', 90, 1, 2),
(7, 'Pelicula 7', 100, 2, 3),
(8, 'Pelicula 8', 110, 3, 4),
(9, 'Pelicula 9', 120, 4, 5),
(10, 'Pelicula 10', 130, 5, 1);

INSERT INTO Ejemplar (nroEj, CodPel, Estado) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 0),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 0),
(8, 8, 1),
(9, 9, 1),
(10, 10, 0),
(11, 1, 1),
(12, 2, 1),
(13, 3, 1),
(14, 4, 1),
(15, 5, 1);

INSERT INTO Cliente (CodCli, NyA, Direccion, Tel, Email) VALUES
(1, 'Juan Perez', 'Calle 1', '123456789', 'juanperez@example.com'),
(2, 'Ana Gomez', 'Calle 2', '987654321', 'anagomez@example.com'),
(3, 'Luis Martinez', 'Calle 3', '456123789', 'luismartinez@example.com'),
(4, 'Maria Lopez', 'Calle 4', '789456123', 'marialopez@example.com'),
(5, 'Carlos Sanchez', 'Calle 5', '321654987', 'carlossanchez@example.com');

INSERT INTO Alquiler (id, NroEj, CodPel, CodCli, FechaAlq, FechaDev) VALUES
(1, 1, 1, 1, '2024-01-01', '2024-01-10'),
(2, 2, 2, 2, '2024-01-02', '2024-01-11'),
(3, 3, 3, 3, '2024-01-03', '2024-01-12'),
(4, 4, 4, 4, '2024-01-04', '2024-01-13'),
(5, 5, 5, 5, '2024-01-05', '2024-01-14'),
(6, 6, 6, 1, '2024-01-06', '2024-01-15'),
(7, 7, 7, 2, '2024-01-07', '2024-01-16'),
(8, 8, 8, 3, '2024-01-08', '2024-01-17'),
(9, 9, 9, 4, '2024-01-09', '2024-01-18'),
(10, 10, 10, 5, '2024-01-10', '2024-01-19'),
(11, 11, 1, 1, '2024-01-11', '2024-01-20'),
(12, 12, 2, 2, '2024-01-12', '2024-01-21'),
(13, 13, 3, 3, '2024-01-13', '2024-01-22'),
(14, 14, 4, 4, '2024-01-14', '2024-01-23'),
(15, 15, 5, 5, '2024-01-15', '2024-01-24');

