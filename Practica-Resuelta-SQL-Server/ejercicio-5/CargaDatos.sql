use master
go

use EJERCICIO_5_R
go


-- Insertando datos.
INSERT INTO GaleriaDeArte
VALUES
    (1, 'Galeria barcelona', '', '', '', ''),
    (2, 'Galeria buenos aires', '', '', '', ''),
    (3, 'Galeria Florencia', '', '', '', ''),
    (4, 'Galeria Recoleta', '', '', '', ''),
    (5, 'Galeria Orfeo', '', '', '', '');


INSERT INTO Autor
VALUES
    (1, 'dali', '1904-05-11'),
    (2, 'picasso', '1881-10-25'),
    (3, 'Joan Miro', '1893-04-20'),
    (4, 'Max Ernst', '1891-04-02'),
    (5, 'Man Ray', '1890-08-27');


INSERT INTO TipoDeObra
VALUES
    (1, 'dadaísmo'),
    (2, 'surrealismo'),
    (3, 'pop art'),
    (4, 'Art Deco'),
    (5, 'Minimalismo');

