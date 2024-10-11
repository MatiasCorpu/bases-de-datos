/*
use master
drop database EJERCICIO_2

*/
USE MASTER

CREATE DATABASE EJERCICIO_2
go

USE EJERCICIO_2
GO

/*
Proveedor (NroProv, NomProv, Categoria, CiudadProv)
Art�culo  (NroArt, Descripci�n, CiudadArt, Precio)
Cliente   (NroCli, NomCli, CiudadCli)
Pedido    (NroPed, NroArt, NroCli, NroProv, FechaPedido, Cantidad, PrecioTotal)
Stock     (NroArt, fecha, cantidad)

*/

CREATE TABLE Proveedor
(
NroProv INT IDENTITY(1,1) PRIMARY KEY,
NomProv VARCHAR(20) NOT NULL,
Categoria VARCHAR(20),
CiudadProv VARCHAR(20)
)

CREATE TABLE Articulo
(
NroArt INT IDENTITY(1,1) not null ,
Descripcion VARCHAR(20),
CiudadArt  VARCHAR(20),
Precio DECIMAL(10,4),
PRIMARY KEY  (NroArt)
)

CREATE TABLE Cliente
(
NroCli INT IDENTITY(1,1) not null,
NomCli  VARCHAR(20), 
CiudadCli VARCHAR(20),
CONSTRAINT PK_Cliente PRIMARY KEY (NroCli)
)

CREATE TABLE Pedido    (
NroPed INT IDENTITY(1,1) not null, 
NroArt INT , 
NroCli INT , 
NroProv INT, 
FechaPedido DATETIME, 
Cantidad INT , 
PrecioTotal DECIMAL(10,4),
PRIMARY KEY  (NroPed)

)

--poner las claves foraneas en las tablas
ALTER TABLE Pedido
ADD CONSTRAINT FK_PedidoArticulo
FOREIGN KEY (NroArt) REFERENCES Articulo(NroArt);

ALTER TABLE Pedido
ADD CONSTRAINT FK_PedidoCliente
FOREIGN KEY (NroCli) REFERENCES Cliente(NroCli);


ALTER TABLE Pedido
ADD CONSTRAINT FK_PedidoProveedor
FOREIGN KEY (NroProv) REFERENCES Proveedor(NroProv);

--crear tabla Stock

CREATE TABLE Stock     
(NroArt  INT NOT NULL FOREIGN KEY REFERENCES Articulo(NroArt), 
fecha DATETIME NOT NULL, 
cantidad INT 
--CONSTRAINT FK_StockArticulo FOREIGN KEY (NroArt)     REFERENCES Articulo(NroArt)
)

ALTER TABLE Stock
ADD CONSTRAINT PK_Stock PRIMARY KEY (NroArt,fecha);



