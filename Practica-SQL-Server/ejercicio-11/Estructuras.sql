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

CREATE TABLE Genero(
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

CREATE TABLE Ejemplar(
    nroEj int PRIMARY KEY,
    CodPel int,
    Estado BIT, -- 1 para Disponible, 0 para No disponible
    FOREIGN KEY (CodPel) REFERENCES Pelicula(CodPel)
);

CREATE TABLE Cliente(
    CodCli int PRIMARY KEY, 
    NyA varchar(100), 
    Direccion varchar(150), 
    Tel varchar(20), 
    Email varchar(100), 
    Borrado BIT DEFAULT 0 -- 1 para Sí, 0 para No (Default)
);

CREATE TABLE Alquiler(
    id int PRIMARY KEY,
    NroEj int,
    CodPel int,
    CodCli int,
    FechaAlq DATE, 
    FechaDev DATE,
    FOREIGN KEY (NroEj) REFERENCES Ejemplar(NroEj),
    FOREIGN KEY (CodPel) REFERENCES Pelicula(CodPel),
    FOREIGN KEY (CodCli) REFERENCES Cliente(CodCli)
);



-- 3. Agregue el atributo “Anio” en la tabla Película.
ALTER TABLE Pelicula
ADD Anio INT;


-- 4. Actualice la tabla película para que incluya el Anio de lanzamiento de las películas en stock.
UPDATE Pelicula
SET Anio = 2020
WHERE CodPel = 1;

UPDATE Pelicula
SET Anio = 2019
WHERE CodPel = 2;

UPDATE Pelicula
SET Anio = 2018
WHERE CodPel = 3;

UPDATE Pelicula
SET Anio = 2017
WHERE CodPel = 4;

UPDATE Pelicula
SET Anio = 2021
WHERE CodPel = 5;

UPDATE Pelicula
SET Anio = 2022
WHERE CodPel = 6;

UPDATE Pelicula
SET Anio = 2016
WHERE CodPel = 7;

UPDATE Pelicula
SET Anio = 2015
WHERE CodPel = 8;

UPDATE Pelicula
SET Anio = 2023
WHERE CodPel = 9;

UPDATE Pelicula
SET Anio = 2014
WHERE CodPel = 10;

-- 5. Queremos que al momento de eliminar una película se eliminen todos los ejemplares de la misma. Realice una CONSTRAINT para esta tarea.
alter TABLE Ejemplar
ADD CONSTRAINT FK_Ejemplar_Pelicula
FOREIGN KEY (CodPel) REFERENCES Pelicula(CodPel)
ON DELETE CASCADE;

-- 6. Queremos que exista un borrado de lógico y no físico de clientes, realice un TRIGGER que usando el atributo “Borrado” haga esta tarea.


/*

CREATE TRIGGER NombreDelTrigger
ON NombreDeLaTabla
FOR INSERT, UPDATE, DELETE
AS
BEGIN
    -- Cuerpo del trigger
END;

*/
/*
drop trigger BorradoLogicoCliente

CREATE TRIGGER BorradoLogicoCliente
ON Cliente
INSTEAD OF DELETE
AS
BEGIN
    UPDATE Cliente
    SET Borrado = 1
    WHERE CodCli in (
        SELECT CodCli
        FROM deleted
    )
END;
*/

select *
from Cliente

DELETE
FROM Cliente
WHERE CodCli = 1;

select *
from Cliente

-- 7. Elimine las películas de las que no se hayan alquilado ninguna copia.

DELETE
from Pelicula
WHERE CodPel NOT IN (
    select distinct CodPel
    from Alquiler
)


-- 8. Elimine los clientes sin alquileres.

DELETE
from Cliente
where CodCli not in (
    select distinct CodCli
    from Alquiler
)
