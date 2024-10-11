use master
go

create DATABASE EJERCICIO_14
go

use EJERCICIO_14
go

-- Crear tabla Cliente
CREATE TABLE Cliente (
    NroCliente INT PRIMARY KEY,
    RazonSocial VARCHAR(100)
);
-- Crear tabla Festejo
CREATE TABLE Festejo (
    NroFestejo INT PRIMARY KEY,
    descripción VARCHAR(100),
    fecha DATE,
    nrocliente INT,
    FOREIGN KEY (nrocliente) REFERENCES Cliente(NroCliente)
);

-- Crear tabla Servicio
CREATE TABLE Servicio (
    NroServicio INT PRIMARY KEY,
    Descripción VARCHAR(100),
    Precio DECIMAL(10, 2)
);
-- Crear tabla Contrata
CREATE TABLE Contrata (
    NroFestejo INT,
    Item INT,
    NroServicio INT,
    HDesde TIME,
    HHasta TIME,
    PRIMARY KEY (NroFestejo, Item),
    FOREIGN KEY (NroFestejo) REFERENCES Festejo(NroFestejo),
    FOREIGN KEY (NroServicio) REFERENCES Servicio(NroServicio)
);

drop TABLE Contrata

