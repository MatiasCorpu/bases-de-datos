use master
go

create DATABASE EJERCICIO_13
go

use EJERCICIO_13
go 

CREATE TABLE Nivel (
    codigo INT PRIMARY KEY,
    descripcion VARCHAR(100)
);

CREATE TABLE Medición (
    fecha DATE,
    hora TIME,
    métrica VARCHAR(50),
    temperatura DECIMAL(8,2),
    presión DECIMAL(8,2),
    humedad DECIMAL(8,2),
    nivel INT,
    FOREIGN KEY (nivel) REFERENCES Nivel(codigo),
    PRIMARY KEY (fecha, hora, métrica)
);
