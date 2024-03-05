--1
select *from angajati
where salariul>8000 and salariul<10000;

--2
select *from angajati
where id_functie='SA_REP';

--3
select *from angajati
where id_departament in (select id_departament from angajati where initcap(nume)='Smith');

--4
select *from produse
where pret_lista=(select min(pret_lista) from produse);

--5
select * from angajati a, functii f
where a.id_functie=f.id_functie or denumire_functie like '%Account%';

--6
select * from angajati
where email like '_A%' or email like '_B%' or email like '_C%';

--7
select * from angajati 
where telefon like '____123%';

--8
select * from angajati
where data_angajare<to_date('01.01.2018', 'DD.MM.YYYY');

--9
select * from angajati
where data_angajare=to_date('01.2000', 'MM.YYYY');

--10
select a.nume, a.salariul, f.denumire_functie, d.denumire_departament
from functii f, angajati a, departamente d
where a.id_functie=f.id_functie and
a.id_departament=d.id_departament and
a.id_departament =(select id_departament from departamente where denumire_departament like '%IT');

--11
select a.nume, a.salariul, f.denumire_functie, d.denumire_departament
from functii f, angajati a, departamente d
where a.id_functie=f.id_functie and
a.id_departament=d.id_departament and
a.id_departament in(select id_departament from departamente where denumire_departament like '%IT');

--13
select * from produse;

--15
select nume, id_functie , comision, id_departament from angajati
where comision >0;

