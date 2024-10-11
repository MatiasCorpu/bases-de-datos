use master
go

create database EJERCICIO_4
go

use EJERCICIO_4
go

-- Tabla Persona
CREATE TABLE Persona (
    dni VARCHAR(20) PRIMARY KEY,
    nomPersona VARCHAR(255) NOT NULL,
    telefono VARCHAR(20)
);

-- Tabla Empresa
CREATE TABLE Empresa (
    nomEmpresa VARCHAR(255) PRIMARY KEY,
    telefono VARCHAR(20)
);

-- Tabla Vive
CREATE TABLE Vive (
    dni VARCHAR(20),
    calle VARCHAR(255) NOT NULL,
    ciudad VARCHAR(255) NOT NULL,
    PRIMARY KEY (dni, calle, ciudad),
    FOREIGN KEY (dni) REFERENCES Persona(dni)
);

-- Tabla Trabaja
CREATE TABLE Trabaja (
    dni VARCHAR(20),
    nomEmpresa VARCHAR(255),
    salario DECIMAL(10, 2),
    feIngreso DATE,
    feEgreso DATE,
    PRIMARY KEY (dni, nomEmpresa),
    FOREIGN KEY (dni) REFERENCES Persona(dni),
    FOREIGN KEY (nomEmpresa) REFERENCES Empresa(nomEmpresa)
);

-- Tabla Situada_En
CREATE TABLE Situada_En (
    nomEmpresa VARCHAR(255),
    ciudad VARCHAR(255) NOT NULL,
    PRIMARY KEY (nomEmpresa, ciudad),
    FOREIGN KEY (nomEmpresa) REFERENCES Empresa(nomEmpresa)
);

-- Tabla Supervisa
CREATE TABLE Supervisa (
    dniPer VARCHAR(20),
    dniSup VARCHAR(20),
    PRIMARY KEY (dniPer, dniSup),
    FOREIGN KEY (dniPer) REFERENCES Persona(dni),
    FOREIGN KEY (dniSup) REFERENCES Persona(dni)
);
