use master
go

create DATABASE EJERCICIO_5
go

use EJERCICIO_5
go

-- Tabla Rubro
CREATE TABLE Rubro (
    CodRubro INT PRIMARY KEY,
    NombRubro VARCHAR(255) NOT NULL
);

-- Tabla Pelicula
CREATE TABLE Pelicula (
    CodPel INT PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    Duracion INT, -- duración en minutos
    Año INT,
    CodRubro INT,
    FOREIGN KEY (CodRubro) REFERENCES Rubro(CodRubro)
);

-- Tabla Ejemplar
CREATE TABLE Ejemplar (
    CodEj INT PRIMARY KEY,
    CodPel INT,
    Estado VARCHAR(10) CHECK (Estado IN ('Libre', 'Ocupado')),
    Ubicación VARCHAR(255),
    FOREIGN KEY (CodPel) REFERENCES Pelicula(CodPel)
);

-- Tabla Cliente
CREATE TABLE Cliente (
    Cod_Cli INT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Apellido VARCHAR(255) NOT NULL,
    Dirección VARCHAR(255),
    Tel VARCHAR(20),
    Email VARCHAR(255)
);

-- Tabla Prestamo
CREATE TABLE Prestamo (
    CodPrest INT PRIMARY KEY,
    CodEj INT,
    CodPel INT,
    CodCli INT,
    FechaPrest DATE,
    FechaDev DATE,
    FOREIGN KEY (CodEj) REFERENCES Ejemplar(CodEj),
    FOREIGN KEY (CodPel) REFERENCES Pelicula(CodPel),
    FOREIGN KEY (CodCli) REFERENCES Cliente(Cod_Cli)
);

