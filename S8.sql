--structuri ierarhice sau arborescente
select level, sys_connect_by_path( , ), connect_by_root(), connect_by_isleaf,
connect_by_iscycle, alte coloane, expresii
from sursa datelor(o tabelamai multe tabeleun alt select)
[where conditii]
connect by [nocycle] [prior] coloana_tip_copil=[prior] coloana_tip_parinte
[start with nod_radacina]; 
[order siblings by...];

select id_angajat, nume, level, connect_by_root(nume)
from angajati
connect by prior id_angajat= id_manager
start with id_angajat=108;

select lpad(' ',level) nume
from angajati
connect by prior id_angajat=id_manager
start with id_angajat=100
order siblings by nume;
--start with id_manager is null;

select id_angajat, nume, level, sys_connect_by_path(id_functie, '-') arbore, level-1
from angajati
connect by prior id_angajat=id_manager
start with id_angajat =100;

select id_angajat, nume, level, id_departament
from angajati 
where level=(select max(level) from angajati connect by prior id_angajat=id_manager)
connect by prior id_angajat=id_manager
start with id_angajat =100;


select id_angajat, nume, level, id_departament, connect_by_isleaf
from angajati 
where connect_by_isleaf=1 --frunzele, pt a vedea cele intermediare punem =0
connect by prior id_angajat=id_manager
start with id_angajat =100;

select id_angajat, nume, level, id_departament, connect_by_isleaf, connect_by_iscycle
from angajati 
where connect_by_isleaf=1 
connect by nocycle prior id_angajat=id_manager
start with id_angajat =100;

update angajati
set id_manager = (select id_angajat from angajati where nume='Lorentz')
where id_angajat=100;

rollback;

select id_angajat, nume, level, a.id_departament, denumire_departament
from angajati a, departamente d
where a.id_departament=d.id_departament --frunzele, pt a vedea cele intermediare punem =0
connect by prior id_angajat=a.id_manager
start with id_angajat =100;


--sa se afiseze numele angajatilor din departamentul 90 si suma 
--salariilor lor si a subalternilor lor 
select nume, sum(salariul)
from (select connect_by_root(nume) nume, salariul 
from angajati 
connect by id_manager=prior id_angajat
start with id_departament = 90) --subcerere in from 
group by nume;

