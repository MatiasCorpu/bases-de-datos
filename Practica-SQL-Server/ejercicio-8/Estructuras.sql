use master
go
-- Crear la base de datos
CREATE DATABASE EJERCICIO_8;
GO


-- Usar la base de datos recién creada
USE EJERCICIO_8;
GO

-- Creación de la tabla Frecuenta
CREATE TABLE Frecuenta (
    persona VARCHAR(50),
    bar VARCHAR(50),
    PRIMARY KEY (persona, bar)
);

-- Creación de la tabla Sirve
CREATE TABLE Sirve (
    bar VARCHAR(50),
    cerveza VARCHAR(50),
    PRIMARY KEY (bar, cerveza)
);

-- Creación de la tabla Gusta
CREATE TABLE Gusta (
    persona VARCHAR(50),
    cerveza VARCHAR(50),
    PRIMARY KEY (persona, cerveza)
);
