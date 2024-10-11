use EJERCICIO_8
go


/*
Frecuenta (persona, bar)
Sirve (bar, cerveza)
Gusta (persona, cerveza)
*/

-- 1. Frecuentan solamente bares que sirven alguna cerveza que les guste.
SELECT distinct f.bar, g.persona
from Frecuenta f
join Gusta g on g.persona = f.persona
join Sirve s on s.cerveza = g.cerveza

-- 2. No frecuentan ningún bar que sirva alguna cerveza que les guste.
SELECT *
from Frecuenta f
where NOT EXISTS (
    SELECT distinct *
    from Gusta g
    join Sirve s on g.cerveza = s.cerveza
    WHERE f.persona = g.persona and f.bar = s.bar
)

-- 3. Frecuentan solamente los bares que sirven todas las cervezas que les gustan.



SELECT f.persona, f.bar
FROM Frecuenta f
WHERE NOT EXISTS (
    SELECT *
    FROM Gusta g
    WHERE f.persona = g.persona
    AND NOT EXISTS (
        SELECT 1
        FROM Sirve s
        WHERE f.bar = s.bar AND g.cerveza = s.cerveza
    )
);


-- 4. Frecuentan solamente los bares que NO sirven ninguna de las cervezas que NO les gusta.
SELECT f.persona, f.bar
FROM Frecuenta f
WHERE NOT EXISTS (
    SELECT 1
    FROM Gusta g
    WHERE f.persona = g.persona
    AND EXISTS (
        SELECT 1
        FROM Sirve s
        WHERE f.bar = s.bar AND g.cerveza = s.cerveza
    )
);

--dame los bares que no sirven lo que no me gusta