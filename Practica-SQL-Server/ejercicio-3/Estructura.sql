use master 
go

create DATABASE EJERCICIO_3
GO

use EJERCICIO_3
go


-- Crear tabla Proveedor
CREATE TABLE Proveedor (
    idProveedor INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    respdCivil VARCHAR(255),
    cuit VARCHAR(20) NOT NULL
);

-- Crear tabla Producto
CREATE TABLE Producto (
    idProducto INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descrip TEXT,
    estado VARCHAR(50),
    idProveedor INT,
    FOREIGN KEY (idProveedor) REFERENCES Proveedor(idProveedor)
);

-- Crear tabla Dirección
CREATE TABLE Dirección (
    idDir INT PRIMARY KEY,
    idPers INT NOT NULL,
    calle VARCHAR(255) NOT NULL,
    nro VARCHAR(10) NOT NULL,
    piso VARCHAR(10),
    dpto VARCHAR(10)
);

-- Crear tabla Cliente
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    respIVA VARCHAR(50),
    CUIL VARCHAR(20) NOT NULL
);

-- Crear tabla Vendedor
CREATE TABLE Vendedor (
    idEmpleado INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    DNI VARCHAR(20) NOT NULL
);

-- Crear tabla Venta
CREATE TABLE Venta (
    nroFactura INT PRIMARY KEY,
    idCliente INT,
    fecha DATE NOT NULL,
    idVendedor INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idVendedor) REFERENCES Vendedor(idEmpleado)
);

-- Crear tabla Detalle_venta
CREATE TABLE Detalle_venta (
    nroFactura INT,
    nro INT,
    idProducto INT,
    cantidad INT NOT NULL,
    precioUnitario DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (nroFactura, nro),
    FOREIGN KEY (nroFactura) REFERENCES Venta(nroFactura),
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);
