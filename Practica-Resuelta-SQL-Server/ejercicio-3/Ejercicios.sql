use EJERCICIO_3_R
go


--a) Listar a todos los alumnos que asisten a escuelas donde no sirven alimentos y almuerzan en otro establecimiento
--1ro todos los alumnos que asisten a escuelas donde no sireven alimentos
SELECT DNI
from Alumno
WHERE CodEscuela not in (
    select distinct CodEscuela
    from Almuerza_En
)

--1ro alumnos que almuerzan en otro establecimiento
SELECT a.DNI
from Alumno a
JOIN Almuerza_En al on al.DniAlumno = a.DNI
WHERE a.CodEscuela <> al.CodEscuela

--3ro junto todo
SELECT *
from Alumno
WHERE DNI in (
    SELECT DNI
    from Alumno
    WHERE CodEscuela not in (
        select distinct CodEscuela
        from Almuerza_En
    )
    INTERSECT
    SELECT a.DNI
    from Alumno a
    JOIN Almuerza_En al on al.DniAlumno = a.DNI
    WHERE a.CodEscuela <> al.CodEscuela
)


--b) Mostrar todas las escuelas que sirven alimentos a todos sus alumnos que no tienen más de dos hermanos

--1ro alumnos que no tinen mas de 2 hermanos
SELECT *
from Alumno
WHERE DNI not in (
    select DniAlumno
    from Hermano_De
    GROUP by DniAlumno
    having count(distinct DniHermano) > 2
)

SELECT DISTINCT CodEscuela
from Almuerza_En
WHERE CodEscuela not in (
    select distinct a.CodEscuela 
    from Alumno a 
    WHERE not exists (
        select *
        from Almuerza_En al 
        join Alumno a2 on a2.DNI = al.DniAlumno
        WHERE dni not in (
            select DniAlumno
            from Hermano_De
            GROUP by DniAlumno
            having count(distinct DniHermano) > 2
        )
        and a.DNI = al.DniAlumno
        and a.CodEscuela = al.CodEscuela
    )
)

/*
ALUMNO(dni, apellido, nombre, escuela)
HERMANO_DE(dniAlum, dniHno)
ESCUELA (cod, nombre, direccion)
ALIMENTO(id, descripcion, marca)
ALMUERZA_EN(dniAlum, idAlimento, codEscuela)
*/