use master
go

CREATE DATABASE EJERCICIO_5_R
go

use EJERCICIO_5_R
go


-- Creación de estructuras.
CREATE TABLE GaleriaDeArte
(
    id int primary key,
    nombre varchar(50),
    disponible varchar(50),
    calle varchar(50),
    nro
        varchar(50),
    localidad varchar(50)
);
CREATE TABLE Autor
(
    id INT PRIMARY KEY,
    nya varchar(50),
    fech_nacimiento DATE
);
CREATE TABLE TipoDeObra
(
    id int primary key,
    descripcion varchar(50)
);
CREATE TABLE Obra
(
    id int primary key,
    nombre varchar(50),
    material varchar(50),
    idTipo int,
    idAutor int,
    FOREIGN KEY (idTipo ) REFERENCES TipoDeObra(id),
    FOREIGN KEY (idAutor ) REFERENCES Autor(id)
);
CREATE TABLE Tematica
(
    id int primary key,
    descripción varchar(50)
);
CREATE TABLE Exposicion
(
    idGaleria int ,
    idObra int ,
    idTematica int ,
    fecha date,
    sala int,
    PRIMARY KEY(idGaleria, idObra, idTematica, fecha),
    FOREIGN KEY (idGaleria ) REFERENCES GaleriaDeArte (id),
    FOREIGN KEY (idObra ) REFERENCES TipoDeObra(id),
    FOREIGN KEY (idTematica ) REFERENCES Tematica(id)
);
