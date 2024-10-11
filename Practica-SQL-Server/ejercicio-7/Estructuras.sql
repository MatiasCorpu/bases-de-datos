use master
GO

create DATABASE EJERCICIO_7
GO

use EJERCICIO_7
go


-- Crear la tabla Coche
CREATE TABLE Coche (
    matricula VARCHAR(20) PRIMARY KEY,
    modelo VARCHAR(50),
    año INT
);

-- Crear la tabla Chofer
CREATE TABLE Chofer (
    nroLicencia VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    fecha_ingreso DATE,
    telefono VARCHAR(20)
);

-- Crear la tabla Cliente
CREATE TABLE Cliente (
    nroCliente INT PRIMARY KEY,
    calle VARCHAR(100),
    nro INT,
    localidad VARCHAR(50)
);

-- Crear la tabla Viaje
CREATE TABLE Viaje (
    FechaHoraInicio DATETIME,
    FechaHoraFin DATETIME,
    chofer VARCHAR(20),
    cliente INT,
    coche VARCHAR(20),
    kmTotales DECIMAL(10, 2),
    esperaTotal DECIMAL(10, 2),
    costoEspera DECIMAL(10, 2),
    costoKms DECIMAL(10, 2),
    PRIMARY KEY (FechaHoraInicio, chofer, coche),
    FOREIGN KEY (chofer) REFERENCES Chofer(nroLicencia),
    FOREIGN KEY (cliente) REFERENCES Cliente(nroCliente),
    FOREIGN KEY (coche) REFERENCES Coche(matricula)
);
