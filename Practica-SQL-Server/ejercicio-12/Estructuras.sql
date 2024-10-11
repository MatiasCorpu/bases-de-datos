use master
go

CREATE DATABASE EJERICICIO_12
go

use EJERICICIO_12
go

CREATE TABLE Proveedor (
    CodProv INT PRIMARY KEY,
    RazonSocial VARCHAR(100),
    FechaInicio DATE
);

CREATE TABLE Producto (
    CodProd INT PRIMARY KEY,
    Descripcion VARCHAR(100),
    CodProv INT,
    StockActual INT,
    FOREIGN KEY (CodProv) REFERENCES Proveedor(CodProv)
);

CREATE TABLE Stock (
    Nro INT PRIMARY KEY,
    Fecha DATE,
    CodProd INT,
    Cantidad INT,
    FOREIGN KEY (CodProd) REFERENCES Producto(CodProd)
);
