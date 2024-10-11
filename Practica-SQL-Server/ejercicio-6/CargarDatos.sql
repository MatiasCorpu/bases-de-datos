use EJERCICIO_6
go

-- Insertar datos en Vuelo
INSERT INTO Vuelo (NroVuelo, Desde, Hasta, Fecha)
VALUES
(1004, 'A', 'F', '2024-05-04'),
(1005, 'A', 'D', '2024-05-05'),
(1006, 'B', 'D', '2024-05-06'),
(1007, 'C', 'G', '2024-05-07'),
(1008, 'H', 'C', '2024-05-08'),
(1009, 'B', 'C', '2024-05-09'),
(1010, 'C', 'F', '2024-05-10'),
(1011, 'A', 'B', '2024-05-11'),
(1012, 'B', 'D', '2024-05-12');

-- Insertar datos en Avion_utilizado
INSERT INTO Avion_utilizado (NroVuelo, TipoAvion, NroAvion)
VALUES
(1004, 'Boeing 747', 5),
(1005, 'Boeing 777', 6),
(1006, 'Airbus A320', 7),
(1007, 'Boeing 737', 8),
(1008, 'Airbus A380', 9),
(1009, 'Boeing 747', 10),
(1010, 'Airbus A350', 11),
(1011, 'Boeing 777', 12),
(1012, 'Airbus A320', 13);

-- Insertar datos en Info_pasajeros
INSERT INTO Info_pasajeros (NroVuelo, Documento, Nombre, Origen, Destino)
VALUES
(1004, '99999999E', 'Laura Fernandez', 'A', 'F'),
(1005, '88888888F', 'Miguel Sanchez', 'A', 'D'),
(1006, '77777777G', 'Pedro Jimenez', 'B', 'D'),
(1007, '66666666H', 'Sandra Martinez', 'C', 'G'),
(1008, '55555555I', 'Luis Gomez', 'H', 'C'),
(1009, '44444444J', 'Ana Lopez', 'B', 'C'),
(1010, '33333333K', 'Tomas Perez', 'C', 'F'),
(1011, '22222222L', 'Elena Garcia', 'A', 'B'),
(1012, '11111111M', 'Mario Ortiz', 'B', 'D'),
(1004, '00000000N', 'Julian Vega', 'A', 'F'),
(1005, '12121212O', 'Nora Diaz', 'A', 'D'),
(1006, '23232323P', 'Diego Torres', 'B', 'D');


--nueva carga de datos
-- Insertar datos adicionales en Vuelo
INSERT INTO Vuelo (NroVuelo, Desde, Hasta, Fecha)
VALUES
(1013, 'A', 'B', '2024-05-13'),
(1014, 'B', 'D', '2024-05-14'),
(1015, 'A', 'D', '2024-05-15'),
(1016, 'A', 'D', '2024-05-16');

-- Insertar datos adicionales en Avion_utilizado
INSERT INTO Avion_utilizado (NroVuelo, TipoAvion, NroAvion)
VALUES
(1013, 'Boeing 737', 14),
(1014, 'Boeing 777', 15),
(1015, 'Airbus A320', 16),
(1016, 'Boeing 747', 17);

-- Insertar datos adicionales en Info_pasajeros
INSERT INTO Info_pasajeros (NroVuelo, Documento, Nombre, Origen, Destino)
VALUES
(1013, '12345678A', 'Carlos Lopez', 'A', 'B'),
(1014, '12345678A', 'Carlos Lopez', 'B', 'D'),
(1015, '87654321B', 'Ana Perez', 'A', 'D'),
(1016, '98765432C', 'Jose Garcia', 'A', 'D');



--mas carga de datos

-- Insertar datos en Vuelo
INSERT INTO Vuelo (NroVuelo, Desde, Hasta, Fecha)
VALUES
(1001, 'A', 'B', '2024-05-01'),
(1002, 'B', 'D', '2024-05-02'),
(1003, 'A', 'D', '2024-05-03'),
(1004, 'C', 'F', '2024-05-04'),
(1005, 'B', 'E', '2024-05-05'),
(1006, 'A', 'F', '2024-05-06');

-- Insertar datos en Avion_utilizado
INSERT INTO Avion_utilizado (NroVuelo, TipoAvion, NroAvion)
VALUES
(1001, 'Boeing 737', 1),
(1002, 'Boeing 777', 2),
(1003, 'Airbus A320', 3),
(1004, 'Boeing 747', 4),
(1005, 'Boeing 737', 5),
(1006, 'Boeing 777', 6);

-- Insertar datos en Info_pasajeros
INSERT INTO Info_pasajeros (NroVuelo, Documento, Nombre, Origen, Destino)
VALUES
(1001, '12345678A', 'Carlos Lopez', 'A', 'B'),
(1002, '12345678A', 'Carlos Lopez', 'B', 'D'),
(1003, '87654321B', 'Ana Perez', 'A', 'D'),
(1004, '11111111C', 'Jose Garcia', 'C', 'F'),
(1005, '22222222D', 'Laura Martinez', 'B', 'E'),
(1006, '33333333E', 'Pedro Sanchez', 'A', 'F');


--otra
-- Insertar datos en Vuelo
INSERT INTO Vuelo (NroVuelo, Desde, Hasta, Fecha)
VALUES
(2001, 'A', 'B', '2024-05-01'),
(2002, 'B', 'D', '2024-05-02'),
(2003, 'A', 'D', '2024-05-03'),
(2004, 'A', 'C', '2024-05-04'),
(2005, 'C', 'D', '2024-05-05');

-- Insertar datos en Avion_utilizado
INSERT INTO Avion_utilizado (NroVuelo, TipoAvion, NroAvion)
VALUES
(2001, 'Boeing 737', 1),
(2002, 'Boeing 777', 2),
(2003, 'Airbus A320', 3),
(2004, 'Boeing 747', 4),
(2005, 'Airbus A380', 5);

-- Insertar datos en Info_pasajeros
INSERT INTO Info_pasajeros (NroVuelo, Documento, Nombre, Origen, Destino)
VALUES
(2001, '12345678A', 'Carlos Lopez', 'A', 'B'),
(2002, '12345678A', 'Carlos Lopez', 'B', 'D'),
(2003, '87654321B', 'Ana Perez', 'A', 'D'),
(2004, '23456789C', 'Maria Gomez', 'A', 'C'),
(2005, '23456789C', 'Maria Gomez', 'C', 'D');
