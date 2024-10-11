use master
GO

CREATE DATABASE EJERCICIO_9
GO

use EJERCICIO_9
go

CREATE TABLE Persona (
    TipoDoc VARCHAR(50) NOT NULL,
    NroDoc VARCHAR(50) NOT NULL,
    Nombre VARCHAR(255) NOT NULL,
    Direccion VARCHAR(255),
    FechaNac DATE,
    Sexo CHAR(1),
    PRIMARY KEY (TipoDoc, NroDoc)
);

CREATE TABLE Progenitor (
    TipoDoc VARCHAR(50) NOT NULL,
    NroDoc VARCHAR(50) NOT NULL,
    TipoDocHijo VARCHAR(50) NOT NULL,
    NroDocHijo VARCHAR(50) NOT NULL,
    PRIMARY KEY (TipoDoc, NroDoc, TipoDocHijo, NroDocHijo),
    FOREIGN KEY (TipoDoc, NroDoc) REFERENCES Persona(TipoDoc, NroDoc),
    FOREIGN KEY (TipoDocHijo, NroDocHijo) REFERENCES Persona(TipoDoc, NroDoc)
);
