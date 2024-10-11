use EJERCICIO_13
go

-- Inserciones en la tabla Nivel
INSERT INTO Nivel (codigo, descripcion) VALUES (1, 'Bajo');
INSERT INTO Nivel (codigo, descripcion) VALUES (2, 'Medio');
INSERT INTO Nivel (codigo, descripcion) VALUES (3, 'Alto');
INSERT INTO Nivel (codigo, descripcion) VALUES (4, 'Muy bajo');
INSERT INTO Nivel (codigo, descripcion) VALUES (5, 'Muy alto');

drop TABLE Nivel

-- Inserciones en la tabla Medición con el formato de fecha y hora compatible con SQL Server
INSERT INTO Medicion (fecha, hora, metrica, temperatura, presión, humedad, nivel)
VALUES 
(DATEADD(DAY, -12, GETDATE()), '12:00:00', 'M1', 25.0, 1010.2, 40.0, 1),
(DATEADD(DAY, -11, GETDATE()), '12:00:00', 'M1', 26.0, 1011.2, 45.0, 2),
(DATEADD(DAY, -10, GETDATE()), '12:00:00', 'M1', 27.0, 1012.2, 50.0, 3),
(DATEADD(DAY, -12, GETDATE()), '14:00:00', 'M2', 28.0, 1013.2, 55.0, 1),
(DATEADD(DAY, -11, GETDATE()), '14:00:00', 'M2', 29.0, 1014.2, 60.0, 2),
(DATEADD(DAY, -10, GETDATE()), '14:00:00', 'M2', 30.0, 1015.2, 65.0, 3),
(DATEADD(DAY, -9, GETDATE()), '12:00:00', 'M1', 28.5, 1013.5, 42.0, 1),
(DATEADD(DAY, -8, GETDATE()), '12:00:00', 'M1', 29.0, 1014.0, 43.0, 2),
(DATEADD(DAY, -7, GETDATE()), '12:00:00', 'M1', 30.0, 1015.0, 44.0, 3),
(DATEADD(DAY, -9, GETDATE()), '14:00:00', 'M2', 31.0, 1016.0, 66.0, 1),
(DATEADD(DAY, -8, GETDATE()), '14:00:00', 'M2', 32.0, 1017.0, 67.0, 2),
(DATEADD(DAY, -7, GETDATE()), '14:00:00', 'M2', 33.0, 1018.0, 68.0, 3);


drop TABLE Medicion

