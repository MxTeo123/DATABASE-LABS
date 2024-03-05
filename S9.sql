--case, decode 
--case este o functie, iar decode e o functie, fac cam acelasi lucru
--genereaza niste coloane, functioneaza similar cu if then

--Sa se majoreze sal angajatilor in functie de coloana id_functie 
select id_angajat, nume, id_functie, salariul, salariul*decode(id_functie, 'SA_MAN', 1.2,
'SA_REP', 1.1*salariul, 1.05)salariu_majorat from angajati;

--case 1
select id_angajat, nume, id_functie, salariul, salariul*case id_functie
when 'SA_MAN' then 1.2
when 'SA_REP' then 1.1
else 1.05 end sal_maj from angajati;

--case 2
select id_angajat, nume, id_functie, salariul, salariul*case 
when id_functie='SA_MAN' then 1.2
when id_functie='SA_REP' then 1.1
else 1.05 end sal_maj from angajati;

--sa se realizeze o clasificare a veniturilor angajatilor in functie de
--salariu si comision, astfel...
select nume, salariul, comision, case when salariul>10000 then 'venituri mari'
when comision is not null then 'venituri medii'
else 'venituri mici' end clasificare_venit from angajati;

update angajati
set salariul=salariul*case 
when id_functie='SA_MAN' then 1.2
when id_functie='SA_REP' then 1.1
else 1.05 end;


rollback;

--vom face un clasament al departamentelor in functie de nr ang din fiecare departament
select a.id_departament, case when count(id_angajat) >20 then 'top1'
when count(id_angajat) between 15 and 20 then 'top2'
when count(id_angajat) between 10 and 14 then 'top3'
when count(id_angajat) between 5 and 9 then 'top4'
else 'top5' end clasament, count(id_angajat)
from angajati a, departamente dep
where a.id_departament=dep.id_departament --daca comentam aceastya linie, facem produs cartezian
group by a.id_departament, denumire_departament;

--sa se acrode un spor de conducere in functie de nivelul ierarhic al fiecarui ang
--level 

select nume, level, decode(level, 1, 500, 2, 300, 0) spor,
decode(level, 1, 500, 2, 300, 0) +salariul salariu_cu_spor, salariul
from angajati 
connect by prior id_angajat=id_manager
start with id_angajat=100 order by 2;

-- sa se acorde un spor de vechime angajatilor astfel
-- cei care au peste 20 de ani sa primeasca 2000
-- cei care au intre 15-20 de ani sa primeasca 1500
-- cei care au 10-14 sa primeasca 1200
--ceilalti 500

select nume, extract(year from sysdate)-extract(year from data_angajare) vechime,
case when extract(year from sysdate)-extract(year from data_angajare)>20 then 2000
when extract(year from sysdate)-extract(year from data_angajare)between 15 and 20 then 1500
when extract(year from sysdate)-extract(year from data_angajare) between 10 and 14 then 100
else 500 end spor_vechime
from angajati;



select case when id_functie in ('SA_MAN' , 'SA_REP') then 'Sales'
when id_functie like '%IT%'  then 'IT'
else 'Altii' end categorii,sum(salariul) 
from angajati
group by case when id_functie in ('SA_MAN' , 'SA_REP') then 'Sales'
when id_functie like '%IT%'  then 'IT'
else 'Altii' end order by 2 desc;

--sa se calc vanzarile totale pe anotimpuri
select case when extract(month from data) in (3,4,5) then 'primavara'
when extract(month from data) in (6,7,8) then 'vara'
when extract(month from data) in (9,10,11) then 'toamna'
else 'iarna' end anotimp, sum(pret*cantitate) vanzari_totale
from comenzi c, rand_comenzi r
where c.id_comanda=r.id_comanda
group by case when extract(month from data) in (3,4,5) then 'primavara'
when extract(month from data) in (6,7,8) then 'vara'
when extract(month from data) in (9,10,11) then 'toamna'
else 'iarna' end;

--union, intersect, minus 
select id_angajat id, prenume, id_departament
from angajati
where prenume='Kevin'
union  --union elimina duplicatele, folosim union all sa ne arate si dupliatele
select id_client, prenume_client, null
from clienti
where prenume_client='Kevin';

--afisam angajatii care nu au comision
select nume, salariul*(1+nvl(comision, 0)) venit, comision
from angajati
intersect
select nume, salariul, comision
from angajati;


--ce e in prima si nu in a doua
select nume, salariul*(1+nvl(comision, 0)) venit, comision
from angajati
minus
select nume, salariul, comision
from angajati;



