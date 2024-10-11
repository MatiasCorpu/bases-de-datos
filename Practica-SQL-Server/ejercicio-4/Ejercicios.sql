use EJERCICIO_4
go
/*
Persona (dni, nomPersona, telefono)
Empresa (nomEmpresa, telefono)
Vive (dni, calle, ciudad)
Trabaja (dni, nomEmpresa, salario, feIngreso, feEgreso)
Situada_En(nomEmpresa, ciudad)
Supervisa (dniPer, dniSup)
*/

-- a. Encontrar el nombre de todas las personas que trabajan en la empresa “Banelco”.
SELECT p.nomPersona
FROM Persona p 
join Trabaja t on t.dni = p.dni
WHERE t.nomEmpresa LIKE 'Banelco'

-- b. Localizar el nombre y la ciudad de todas las personas que trabajan para la empresa “Telecom”.
SELECT p.nomPersona, v.ciudad
FROM Persona p 
join Trabaja t on t.dni = p.dni
join Vive v on v.dni = p.dni
WHERE t.nomEmpresa LIKE 'Telecom'

-- c. Buscar el nombre, calle y ciudad de todas las personas que trabajan para la empresa “Paulinas” y ganan más de $1500.
SELECT p.nomPersona,v.calle , v.ciudad
FROM Persona p 
join Trabaja t on t.dni = p.dni
join Vive v on v.dni = p.dni
WHERE t.nomEmpresa LIKE 'Paulinas'
and t.salario > 1500

-- d. Encontrar las personas que viven en la misma ciudad en la que se halla la empresa en donde trabajan.
SELECT p.nomPersona, v.ciudad, t.nomEmpresa, s.ciudad
from Persona p
join Vive v on v.dni = p.dni
join Trabaja t on t.dni = p.dni
join Situada_En s on s.nomEmpresa = t.nomEmpresa
WHERE v.ciudad = s.ciudad

-- e. Hallar todas las personas que viven en la misma ciudad y en la misma calle que su supervisor.
SELECT vP.dni, vP.calle, vp.ciudad, vs.dni, vs.calle, vs.ciudad
from Vive vP 
join Supervisa s on s.dniPer = vp.dni
join Vive vS on s.dniSup = vS.dni
WHERE vS.ciudad = vP.ciudad and vS.calle = vP.calle

-- f. Encontrar todas las personas que ganan más que cualquier empleado de la empresa “Clarín”.
--1ro maximo sueldo de un empleado de clarin
SELECT MAX(salario) as salarioMax
from Trabaja 
WHERE nomEmpresa LIKE 'Clar_n'

--2do finalmente
SELECT p.nomPersona, t.salario
from Persona p 
join Trabaja t on t.dni = p.dni
WHERE t.salario > (
    SELECT MAX(salario) as salarioMax
    from Trabaja 
    WHERE nomEmpresa LIKE 'Clar_n'
)

-- g. Localizar las ciudades en las que todos los trabajadores que vienen en ellas ganan más de $1700.

--1ro cantidad de trabajadores por ciudad
SELECT ciudad, COUNT(dni)
from Vive
GROUP by ciudad

--2do cantidad de trabajadores por ciudad que cobran mas de  1700
SELECT A.ciudad, COUNT(A.dni)
from (
    select v.ciudad, t.dni, MAX(t.salario) as salarioMax
    from Trabaja t
    join Vive v on v.dni = t.dni
    GROUP BY v.ciudad, t.dni
    HAVING MAX(t.salario) > 1700
) as A
GROUP by A.ciudad

--3ro finalmente
SELECT ciudad, COUNT(dni)
from Vive
GROUP by ciudad
INTERSECT
SELECT A.ciudad, COUNT(A.dni)
from (
    select v.ciudad, t.dni, MAX(t.salario) as salarioMax
    from Trabaja t
    join Vive v on v.dni = t.dni
    GROUP BY v.ciudad, t.dni
    HAVING MAX(t.salario) > 1700
) as A
GROUP by A.ciudad



-- h. Listar los primeros empleados que la compañía “Sony” contrató.
SELECT *
from Trabaja
WHERE nomEmpresa LIKE 'Sony'
and feIngreso = (
    SELECT MIN(feIngreso)
    from Trabaja 
    WHERE nomEmpresa LIKE 'Sony'
)

-- i. Listar los empleados que hayan ingresado en mas de 4 Empresas en el periodo 01-01-2000 y 31-03-2004 y que no hayan tenido menos de 5 supervisores

--1ro empleados que hayan ingresado en mas de 4 empresas en el periodo
SELECT dni, COUNT(feIngreso) as cantIngresos
from Trabaja
where feIngreso BETWEEN '01-01-2000' and '31-03-2004'
GROUP by dni

--2do que hayan tenido mas o igual de 5 supervisores
SELECT dniPer, COUNT(dniSup)
from Supervisa 
GROUP by dniPer
HAVING COUNT(dniSup) >= 5

--3ro finalmente
SELECT dni
from Trabaja
where feIngreso BETWEEN '01-01-2000' and '31-03-2004'
GROUP by dni
INTERSECT
SELECT dniPer
from Supervisa 
GROUP by dniPer
HAVING COUNT(dniSup) >= 5