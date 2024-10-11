use master 
GO

CREATE DATABASE EJERCICIO_6
GO

use EJERCICIO_6
go

-- Tabla Vuelo
CREATE TABLE Vuelo (
    NroVuelo INT PRIMARY KEY,
    Desde VARCHAR(255) NOT NULL,
    Hasta VARCHAR(255) NOT NULL,
    Fecha DATE NOT NULL
);

-- Tabla Avion_utilizado
CREATE TABLE Avion_utilizado (
    NroVuelo INT,
    TipoAvion VARCHAR(255) NOT NULL,
    NroAvion INT NOT NULL,
    PRIMARY KEY (NroVuelo, NroAvion),
    FOREIGN KEY (NroVuelo) REFERENCES Vuelo(NroVuelo)
);

-- Tabla Info_pasajeros
CREATE TABLE Info_pasajeros (
    NroVuelo INT,
    Documento VARCHAR(20) NOT NULL,
    Nombre VARCHAR(255) NOT NULL,
    Origen VARCHAR(255) NOT NULL,
    Destino VARCHAR(255) NOT NULL,
    PRIMARY KEY (NroVuelo, Documento),
    FOREIGN KEY (NroVuelo) REFERENCES Vuelo(NroVuelo)
);
