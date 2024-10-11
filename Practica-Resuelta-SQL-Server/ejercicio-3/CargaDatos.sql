use EJERCICIO_3_R
go

INSERT INTO escuela (CodEscuela, Nombre, Direccion) VALUES ('1', 'Escuela 1', 'Famosos');
INSERT INTO escuela (CodEscuela, Nombre, Direccion) VALUES ('2', 'Escuela 2', 'Oficialistas');
INSERT INTO escuela (CodEscuela, Nombre, Direccion) VALUES ('3', 'Escuela 3', 'Opositores');
INSERT INTO escuela (CodEscuela, Nombre, Direccion) VALUES ('4', 'Escuela 4', 'Hermanos');

INSERT INTO alumno(DNI, Apellido, Nombre, CodEscuela) VALUES ('1', 'Fort', 'Ricardo', '1');
INSERT INTO alumno(DNI, Apellido, Nombre, CodEscuela) VALUES ('2', 'Marcelo', 'Tinelli', '1');
INSERT INTO alumno(DNI, Apellido, Nombre, CodEscuela) VALUES ('3', 'Moria', 'Casan', '1');
INSERT INTO alumno(DNI, Apellido, Nombre, CodEscuela) VALUES ('4', 'Cristina', 'Fernandez','2');
INSERT INTO alumno(DNI, Apellido, Nombre, CodEscuela) VALUES ('5', 'Anibal', 'Fernandez','2');
INSERT INTO alumno(DNI, Apellido, Nombre, CodEscuela) VALUES ('6', 'Amado', 'Boudou', '2');
INSERT INTO alumno(DNI, Apellido, Nombre, CodEscuela) VALUES ('7', 'Ricardo', 'Alfonsin','3');
INSERT INTO alumno(DNI, Apellido, Nombre, CodEscuela) VALUES ('8', 'Elisa', 'Carrio', '3');
INSERT INTO alumno(DNI, Apellido, Nombre, CodEscuela) VALUES ('9', 'Hermes', 'Binner', '3');
INSERT INTO alumno(DNI, Apellido, Nombre, CodEscuela) VALUES ('10', 'Guido', 'Tinelli', '4');
INSERT INTO alumno(DNI, Apellido, Nombre, CodEscuela) VALUES ('11', 'Hugo', 'Tinelli', '4');
INSERT INTO alumno(DNI, Apellido, Nombre, CodEscuela) VALUES ('12', 'Alberto', 'Fernandez','4');
INSERT INTO alumno(DNI, Apellido, Nombre, CodEscuela) VALUES ('13', 'Silvia', 'Fernandez','4');
INSERT INTO alumno(DNI, Apellido, Nombre, CodEscuela) VALUES ('14', 'Ricardo', 'Tinelli','4');

INSERT INTO hermano_de (DniAlumno, DniHermano) VALUES ('2', '10');
INSERT INTO hermano_de (DniAlumno, DniHermano) VALUES ('2', '11');
INSERT INTO hermano_de (DniAlumno, DniHermano) VALUES ('2', '14');
INSERT INTO hermano_de (DniAlumno, DniHermano) VALUES ('5', '12');
INSERT INTO hermano_de (DniAlumno, DniHermano) VALUES ('4', '13');
INSERT INTO hermano_de (DniAlumno, DniHermano) VALUES ('10', '2');
INSERT INTO hermano_de (DniAlumno, DniHermano) VALUES ('10', '11');
INSERT INTO hermano_de (DniAlumno, DniHermano) VALUES ('10', '14');
INSERT INTO hermano_de (DniAlumno, DniHermano) VALUES ('11', '2');
INSERT INTO hermano_de (DniAlumno, DniHermano) VALUES ('11', '10');
INSERT INTO hermano_de (DniAlumno, DniHermano) VALUES ('11', '14');
INSERT INTO hermano_de (DniAlumno, DniHermano) VALUES ('14', '2');
INSERT INTO hermano_de (DniAlumno, DniHermano) VALUES ('14', '10');
INSERT INTO hermano_de (DniAlumno, DniHermano) VALUES ('14', '11');

INSERT INTO alimento (IdAlimento, Descripcion, Marca) VALUES ('1', 'Hamburguesa', 'Patty');
INSERT INTO alimento (IdAlimento, Descripcion, Marca) VALUES ('2', 'Milanesa', 'Granja del Sol');
INSERT INTO alimento (IdAlimento, Descripcion, Marca) VALUES ('3', 'Salchicha', 'Vienisima');

INSERT INTO almuerza_en (DniAlumno, IdAlimento, CodEscuela) VALUES ('4', '1', '1');
INSERT INTO almuerza_en (DniAlumno, IdAlimento, CodEscuela) VALUES ('5', '1', '3');
INSERT INTO almuerza_en (DniAlumno, IdAlimento, CodEscuela) VALUES ('4', '2', '4');
INSERT INTO almuerza_en (DniAlumno, IdAlimento, CodEscuela) VALUES ('1', '3', '1');
INSERT INTO almuerza_en (DniAlumno, IdAlimento, CodEscuela) VALUES ('1', '1', '4');
INSERT INTO almuerza_en (DniAlumno, IdAlimento, CodEscuela) VALUES ('2', '1', '1');
INSERT INTO almuerza_en (DniAlumno, IdAlimento, CodEscuela) VALUES ('3', '1', '1');
INSERT INTO almuerza_en (DniAlumno, IdAlimento, CodEscuela) VALUES ('12', '2', '4');
INSERT INTO almuerza_en (DniAlumno, IdAlimento, CodEscuela) VALUES ('13', '2', '4');
INSERT INTO almuerza_en (DniAlumno, IdAlimento, CodEscuela) VALUES ('10', '1', '3');
INSERT INTO almuerza_en (DniAlumno, IdAlimento, CodEscuela) VALUES ('7', '1', '3');
INSERT INTO almuerza_en (DniAlumno, IdAlimento, CodEscuela) VALUES ('8', '2', '3');
INSERT INTO almuerza_en (DniAlumno, IdAlimento, CodEscuela) VALUES ('9', '3', '3');