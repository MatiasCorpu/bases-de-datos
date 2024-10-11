use EJERCICIO_4_R
go

--Inserción de datos:
INSERT INTO pais (pais) VALUES ('Argentina');
INSERT INTO pais (pais) VALUES ('USA');
INSERT INTO pais (pais) VALUES ('Uruguay');
INSERT INTO pais (pais) VALUES ('España');
INSERT INTO pais (pais) VALUES ('Alemania');
INSERT INTO pais (pais) VALUES ('Suiza');

INSERT INTO banco (id, nombre, pais) VALUES ('1', 'Banco Nacion', 'Argentina');
INSERT INTO banco (id, nombre, pais) VALUES ('2', 'Banco Montevideo', 'Uruguay');
INSERT INTO banco (id, nombre, pais) VALUES ('3', 'Banco Ciudad', 'Argentina');
INSERT INTO banco (id, nombre, pais) VALUES ('4', 'City Bank', 'USA');
INSERT INTO banco (id, nombre, pais) VALUES ('5', 'Switzerland Bank', 'Suiza');
INSERT INTO banco (id, nombre, pais) VALUES ('6', 'BBVA', 'España');

INSERT INTO moneda (id, descripcion, valorOro, valorPetroleo) VALUES ('AR', 'Peso Argentino','2', '1');
INSERT INTO moneda (id, descripcion, valorOro, valorPetroleo) VALUES ('UY', 'Peso Uruguayo','5', '2.5');
INSERT INTO moneda (id, descripcion, valorOro, valorPetroleo) VALUES ('US', 'Dolar', '1','.5');
INSERT INTO moneda (id, descripcion, valorOro, valorPetroleo) VALUES ('EU', 'Euro', '2', '1');

INSERT INTO persona (pasaporte, codigoFiscal, nombre) VALUES ('1', '1234', 'Bill Gates');
INSERT INTO persona (pasaporte, codigoFiscal, nombre) VALUES ('2', '12112', 'Carlos Slim');
INSERT INTO persona (pasaporte, codigoFiscal, nombre) VALUES ('3', '2325', 'Lionel Messi');
INSERT INTO persona (pasaporte, codigoFiscal, nombre) VALUES ('4', '01243', 'Diego Maradona');

INSERT INTO cuenta (monto, idBanco, idMoneda, idPersona) VALUES ('100000', '4', 'US', '1');
INSERT INTO cuenta (monto, idBanco, idMoneda, idPersona) VALUES ('20000', '5', 'EU', '1');
INSERT INTO cuenta (monto, idBanco, idMoneda, idPersona) VALUES ('15000', '2', 'US', '1');
INSERT INTO cuenta (monto, idBanco, idMoneda, idPersona) VALUES ('50000', '4', 'US', '2');
INSERT INTO cuenta (monto, idBanco, idMoneda, idPersona) VALUES ('35000', '5', 'US', '2');
INSERT INTO cuenta (monto, idBanco, idMoneda, idPersona) VALUES ('2000', '1', 'AR', '3');
INSERT INTO cuenta (monto, idBanco, idMoneda, idPersona) VALUES ('10000', '4', 'US', '3');
INSERT INTO cuenta (monto, idBanco, idMoneda, idPersona) VALUES ('15000', '5', 'US', '3');
INSERT INTO cuenta (monto, idBanco, idMoneda, idPersona) VALUES ('15000', '5', 'US', '4');

INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('1', 'US', '1', '1');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('2', 'US', '1', '1');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('3', 'US', '1', '1');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('4', 'US', '1', '1');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('5', 'US', '1', '1');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('6', 'US', '1', '1');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('1', 'EU', '2', '2');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('2', 'EU', '2', '2');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('3', 'EU', '3', '3');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('4', 'EU', '2', '2');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('5', 'EU', '2.2','2.2');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('6', 'EU', '2.2','2.5');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('1', 'AR', '5', '5');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('3', 'AR', '5.5','5.5');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('2', 'AR', '7', '7');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('1', 'UY', '3', '3');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('2', 'UY', '2', '2');