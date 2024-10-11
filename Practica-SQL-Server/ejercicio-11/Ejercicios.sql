use master 
GO

CREATE DATABASE EJERCICIO_11
GO

use EJERCICIO_11
go 

/*
Película (CodPel, Titulo, Duracion, CodGenero, IdDirector)
Genero (Id, NombGenero)
Director (Id, NyA)
Ejemplar (nroEj, CodPel, Estado)
    {Estado: 1 Disponible, 0 No disponible}
Cliente (CodCli, NyA, Direccion, Tel, Email, Borrado)
    {Borrado: 1 Si, 2 No(Default)}
Alquiler (id, NroEj, CodPel, CodCli, FechaAlq, FechaDev)
*/


-- 1. Realice las sentencias DDL necesarias para crear en SQL una base de datos correspondiente al modelo relacional del enunciado.

CREATE TABLE Genero (
    Id int PRIMARY KEY,
    NombGenero VARCHAR(50)
);

CREATE TABLE Director(
    Id int PRIMARY KEY,
    NyA VARCHAR(100)
);

CREATE TABLE Pelicula (
    CodPel int PRIMARY KEY,
    Titulo varchar(100),
    Duracion int,
    CodGenero int,
    IdDirector int,
    FOREIGN KEY (CodGenero) REFERENCES Genero(Id),
    FOREIGN KEY (IdDirector) REFERENCES Director(Id)
);

CREATE TABLE Ejemplar (
    nroEj int PRIMARY KEY,
    CodPel int,
    Estado INT,
    FOREIGN KEY (CodPel) REFERENCES Pelicula(CodPel)
);

CREATE TABLE Cliente (
    CodCli int primary key, 
    NyA varchar(100), 
    Direccion varchar(150), 
    Tel varchar(20), 
    Email varchar(100), 
    Borrado BIT Default 1,
);

CREATE TABLE Alquiler (
    id int primary key, 
    NroEj int, 
    CodPel int, 
    CodCli int, 
    FechaAlq DATE, 
    FechaDev DATE,
    foreign key (NroEj) references Ejemplar(nroEj),
    foreign key (CodPel) references Pelicula(CodPel),
    foreign key (CodCli) references Cliente(CodCli),
);


-- 3. Agregue el atributo “Anio” en la tabla Película.
alter TABLE Pelicula
ADD Anio int

-- 4. Actualice la tabla película para que incluya el Anio de lanzamiento de las películas en stock.
UPDATE Pelicula
set Anio = 2000
WHERE CodPel = 1

UPDATE Pelicula
set Anio = 2001
WHERE CodPel = 2

UPDATE Pelicula
set Anio = 2002
WHERE CodPel = 3

UPDATE Pelicula
set Anio = 2004
WHERE CodPel = 4

UPDATE Pelicula
set Anio = 2005
WHERE CodPel = 5

UPDATE Pelicula
set Anio = 2006
WHERE CodPel = 6

UPDATE Pelicula
set Anio = 2007
WHERE CodPel = 7

UPDATE Pelicula
set Anio = 2008
WHERE CodPel = 8

UPDATE Pelicula
set Anio = 2009
WHERE CodPel = 9

UPDATE Pelicula
set Anio = 2010
WHERE CodPel = 10

SELECT *
from Pelicula


-- 6. Queremos que exista un borrado de lógico y no físico de clientes, realice un TRIGGER que usando el atributo “Borrado” haga esta tarea.
go
CREATE or alter TRIGGER BorradoLogicoCliente
on Cliente
INSTEAD OF DELETE
AS
BEGIN
    UPDATE Cliente
    SET Borrado = 0
    WHERE CodCli =(
        select CodCli
        from deleted
    )
END
go

DELETE 
from Cliente
where NyA LIKE 'Juan Perez'

SELECT NyA, Borrado
from Cliente


-- 7. Elimine las películas de las que no se hayan alquilado ninguna copia.
DELETE 
from Pelicula
WHERE CodPel not in(
    select distinct CodPel
    from Alquiler
)

-- 8. Elimine los clientes sin alquileres.
DELETE
from Cliente
WHERE CodCli not in(
    select distinct CodCli
    from Cliente
)