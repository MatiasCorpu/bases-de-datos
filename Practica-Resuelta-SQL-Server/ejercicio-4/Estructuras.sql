use master
go

create DATABASE EJERCICIO_4_R
go

use EJERCICIO_4_R
go

--Creación de Tablas
create table Pais
(
    pais char(50) primary key
);
create table Banco
(
    id int primary key,
    nombre varchar(50),
    pais char(50)
);
create table Moneda
(
    id char(2) primary key,
    descripcion varchar(50),
    valorOro decimal(18,3),
    valorPetroleo decimal(18,3)
);
create table Persona
(
    pasaporte char(15) primary key,
    codigoFiscal int,
    nombre varchar(50)
);
create table Cuenta
(
    monto decimal(18,3),
    idBanco int not null,
    idMoneda char(2) not null,
    idPersona char(15) not null,
    constraint PK_Persona primary key(idBanco, idMoneda, idPersona)
);
create table Opera
(
    idBanco int not null,
    idMoneda char(2) not null,
    cambioCompra decimal(18,3),
    cambioVenta decimal(18,3),
    constraint PK_Opera primary key(idBanco,idMoneda)
);