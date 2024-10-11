/*
Dado el siguiente esquema:

Request (NoRequest, IP, Fecha, Hora, IDMetodo)
Page (IP, WebPage, IDAmbiente)
Método (ID, Clase, Metodo)
Ambiente (ID, Descripción)


Nota: El ambiente podrá ser Desarrollo, Testing o Producción. La función date() devuelve la fecha actual.
Si se resta un valor entero a la función, restará días. El ejercicio consiste en indicar qué enunciado dio
origen a cada una de las consultas:


1)

Select P.IP, count(distinct fecha), count(distinct IDMetodo), max(fecha)
From Page P -> selecciona  pagina
Inner join Request R on P.IP=R.IP -> junta las coincidencias de request ip y page ip
Group by P.IP -> agrupa por page ip

--> rta = se obtine la ip de las paginas que se hicieron request junto con la cantidad distintas de dias que le hicieron solicitudes y la cantidad de metodos usados en cada page 

2)
Select *
From Ambiente A
Where id not in (
    Select idambiente -> se selecciona los ambientes de la page que no se le hizo ninguna solicitud en la ultima semana 
    From Page P
    Where not exists (
        Select 1
        From Request R
        Where R.IP=P.IP and fecha>= date()-7
    )
)

--> rta = si una pagina en el ambiente no ha tenido solicitudes en los ultimos 7 dias, entonces seleccione esos ambientes


3)
Select Fecha, count(*)
From Request R
Where hora between ‘00:00’ and ‘04:00’ 
and not exists(
    select 1
    from Page P
    inner join Ambiente A on P.IDAmbiente = A.ID
    where R.IP=P.IP AND A.Descripcion=’Desarrollo’ 
)
Group by fecha -> agrupa por fecha
Having count(*) >= 10

--> rta = selecciona la fecha junto en la que se hizo mas de 9 solicitudes entre las [00:00, 4:00] y que no fueron hechas a paginas que tienen ambientes de desarrollo

4)
Select W.WebPage, A.Descripcion, max(R.fecha), ‘S’ = es una constante
From Request R -> de las solicitudes
Inner join WebPage W on R.IP=W.IP -> solicitedes a la web
Inner join Ambiente A on A.id=W.IDAmbiente -> soliciudes a la web y su Ambiente 
Where R.Fecha>=date()-7 and W.Webpage like ‘www%’ -> cuando la solicitud se haya hecho en los ultimos 7 dias y web empiece por www...
Group by W.WebPage, A.Descripcion -> agrupa por web y descripcion
Having count(distinct fecha)>=7 -> solo cuando la cantidad de fechas distintas sea mayor a 7

--> rta = selecciona la web y su descripcion junto a la fecha mas reciente en que se hizo solicitudes en los ultimos 7 dias, cuando la web empice por www... y cuando la cantidad de dias distintos en la cual se accedio a la web sea mayor a 7


5)
Select W.WebPage, A.Descripcion, max(case when R2.fecha is null then ‘01/01/1900’ else R2.fecha end), ‘N’
From WebPage W
Left join (
    Select IP, max(fecha)
    From Request R
    Group by IP 
)
R2 on R2.IP = W.IP
Where W.Webpage like ‘ftp%’
and not exists (
    Select 1
    from Request R
    where R.IP=W.IP and R.Fecha>=date()-7
    group by R.IP
    having count(*)>=7
)
Group by W.WebPage, A.Descripcion

--obtiene la web que tuvo la solicitud mas reciente, si no coincide pone NULL a la derecha
--cuando la web empiza por 'ftp'
--y no exista (paginas que se hayan hecho solicitudes en los ultimos 7 dias y que esas colicitudes sean como minimo 7)

-->rta = obtiene web, descripcion, y la fecha mas reciente(en caso de que fecha= NULL -> se coloca '01/01/1900' y si no se deja la mas reciente que esta) y una constante.
De la web que tuvo la solicitud mas reciente, cuando la web empieza por 'ftp' y cuando no haya tenido mas de 7 solicitudes en los ultimos 7 dias


Request (NoRequest, IP, Fecha, Hora, IDMetodo)
Page (IP, WebPage, IDAmbiente)
Método (ID, Clase, Metodo)
Ambiente (ID, Descripción)


6)
insert into Page
select IP, ‘Web ‘ + IDMetodo, ‘?’
from request R
where not exists (
    Select 1 
    from Page P
    where R.IP=P.IP
)
and IDMetodo in (
    select ID
    from Metodo
)
and fecha>=date()-30


--insertar en la tabla Page
--seleciona request selecciona la IP, 
--cuando no exista request en la tabla page
--y cuando la pagina tenga un metodo
--y que se haya hecho en los ultimos 30 dias

-->rta = inserta en la tabla Page la IP, 'Web+IDMetodo', '?'.
de aquellas paginas que tenga algun metodo y que no hayan hecho ninguana solicitud en los ultimos 30 dias 


*/