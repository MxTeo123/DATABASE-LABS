--selectia e un op unar si se implementeaza cu steluta si se implementeaza cu * si clauza where
select * from angajati where id_departament in (50,80);

--proiectia este un operator unar(are nevoie de o singura tabela) si se implementeaza cu distinct 
select distinct id_functie, salariul 
from angajati;

--jonctiunea 
--tipuri de jonctiune 
--jonctiunea interna 
select id_angajat, nume, prenume, d.id_departament, denumire_departament 
from angajati a, departamente d
where a.id_departament=d.id_departament;

--ANSI
select id_angajat, nume, prenume, d.id_departament, denumire_departament 
from angajati a join departamente d
on a.id_departament=d.id_departament;

--jonctiune externa
select id_angajat, nume, prenume, d.id_departament, denumire_departament 
from angajati a join departamente d
on a.id_departament(+)=d.id_departament;

select id_angajat, nume, prenume, d.id_departament, denumire_departament 
from angajati a right join departamente d
on a.id_departament=d.id_departament;

--jonctiune totala
select id_angajat, nume, prenume, d.id_departament, denumire_departament 
from angajati a full join departamente d
on a.id_departament=d.id_departament;

--self-join 
select a.nume || ' lucreaza pentru ' || m.nume colaborari 
from angajati a, angajati m
where a.id_manager = m.id_angajat ;

select * from angajati;

select r.id_comanda, denumire_produs, p.id_produs 
from rand_comenzi r, produse p
where r.id_produs (+) =p.id_produs;

--subcereri 

select c.id_comanda from produse p, comenzi c, rand_comenzi r
where c.id_comanda=r.id_comanda and r.id_produs=p.id_produs
and c.id_comanda in 
(select id_comanda from produse p, rand_comenzi r 
where denumire_produs='LaserPro 600/6/BW'
and r.id_produs=p.id_produs);

select * from angajati;
--sa se selecteze toti angajatii care sunt colegi cu Greenberg
select * from angajati where id_departament in (select id_departament from angajati
where nume='Smith');
