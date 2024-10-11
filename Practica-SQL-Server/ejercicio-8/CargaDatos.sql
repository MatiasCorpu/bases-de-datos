use EJERCICIO_8
GO


-- Insertar datos en la tabla Frecuenta
INSERT INTO Frecuenta (persona, bar) VALUES
('Alice', 'BarA'),
('Alice', 'BarB'),
('Bob', 'BarA'),
('Bob', 'BarC'),
('Charlie', 'BarB'),
('Charlie', 'BarC');

-- Insertar datos en la tabla Sirve
INSERT INTO Sirve (bar, cerveza) VALUES
('BarA', 'Cerveza1'),
('BarA', 'Cerveza2'),
('BarB', 'Cerveza1'),
('BarB', 'Cerveza3'),
('BarC', 'Cerveza2'),
('BarC', 'Cerveza4');

-- Insertar datos en la tabla Gusta
INSERT INTO Gusta (persona, cerveza) VALUES
('Alice', 'Cerveza1'),
('Alice', 'Cerveza2'),
('Bob', 'Cerveza1'),
('Bob', 'Cerveza4'),
('Charlie', 'Cerveza3'),
('Charlie', 'Cerveza4');
