use master
go

create database EJERCICIO_3_R
go

use EJERCICIO_3_R
go

/*
ALUMNO(dni, apellido, nombre, escuela)
HERMANO_DE(dniAlum, dniHno)
ESCUELA (cod, nombre, direccion)
ALIMENTO(id, descripcion, marca)
ALMUERZA_EN(dniAlum, idAlimento, codEscuela)
*/

--Scripts Creación de Tablas:
create table Alumno
(
    DNI int not null primary key,
    Apellido varchar(50),
    Nombre
        varchar(50),
    CodEscuela int
);
create table Hermano_De
(
    DniAlumno int not null,
    DniHermano int not null,
    constraint
PK_Hermano_De primary key(DniAlumno, DniHermano)
);
create table Escuela
(
    CodEscuela int not null primary key,
    Nombre varchar(50),
    Direccion
        varchar(255)
);
create table Alimento
(
    IdAlimento int not null primary key,
    Descripcion varchar(50),
    Marca varchar(50)
);
create table Almuerza_En
(
    DniAlumno int not null,
    IdAlimento int not null,
    CodEscuela
        int,
    constraint PK_Almuerza_En primary key(DniAlumno, IdAlimento)
);
go
