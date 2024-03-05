--alte obiecte din BD
1)view- tabele virtuale;
2)index-indecsi;
3)sequences-secvente;
4)synonyme-sinonime;
--1)
create or replace view...;
create sequence...;
create synonym...;

create or replace view v_ang50 as select * from angajati where id_departament=50;
--with read only; -- nu ne lasa sa modificam
--with check option; ne lasa sa modificam( in cazul nostru, nu permite modificari in afara departamentului 50)
select * from v_ang50;
update v_ang50
set salariul = salariul + 100
where id_angajat =187;
rollback;

select * from v_ang50 where extract(month from data_angajare) in (7,8);

create or replace view v_rand_comenzi as select id_comanda, pret*cantitate valoare
from rand_comenzi;

select * from v_rc;
set valoare= valoare+1;

--create [bitmap] index nume_index on nume_tabela(nume_coloana);
--bitmap e optional, harta de biti
--index b-tree

select * from angajati where salariul between 5000 and 6000;
--apasatm f10 apare un plan de executie
drop index ang_sal;
create index ang_sal on angajati(salariul);
select * from user_indexes where table_name='PRODUSE';
select * from produse where categorie='hardware6';
create bitmap index prod_cat on produse(categorie);

--stergem un view drop view v_rc;

--o secventa care genereaza valori
create sequence my_seq start with 1 increment by 1 maxvalue 100 nocycle;

select * from comenzi;
insert into comenzi values(my_seq.nextval, sysdate, 'direct',101,0,153);

select my_seq.currval from dual;

alter sequence my_seq increment by 10;
alter sequence my_seq maxvalue 100000;

drop sequence my_seq;


create synonim rc for rand_comenzi
select * from rc;

---------------------------------------------------------------------
-- alte obiecte din bd
-- view - tabele virtuale
-- index - indecsi
-- sequences - secvente
-- synonyme - sinonime

--create or replace view...;
--create index...;
--create sequence...;
--create synonyme...;

create or replace view v_ang50 as select * from angajati where id_departament = 50
--with read only;
with check option;

select * from v_ang50;

-- cand se face update la view se modifica de fapt tabela, nu view ul
-- daca este read-only nu se poate face update
-- daca este cu check only se pot face modificari doar in conditia in care nu se iese din view (de ex nu este permis mutarea angajatilor la alt departament)
update v_ang50
set salariul = salariul + 100
where id_angajat = 187;
rollback;

select * from v_ang50 where extract(month from data_angajare) in (7,8);

-- in view neaparat trebuie dat alias la coloanele compuse cu expresii
create or replace view v_rc as select id_comanda, pret*cantitate valoare from rand_comenzi;
select * from v_rc;

-- create [bitmap] index nume_index on nume_tabela(nume_coloana);
-- index b-tree

select * from angajati where salariul between 2000 and 30000;
create index ang_sal on angajati(salariul);
select * from user_indexes where table_name = 'ANGAJATI';

drop view v_rc;
drop index ang_sal;

select * from produse where categorie = 'hardware6';
select * from user_indexes where table_name = 'PRODUSE';

create index prod_cat on produse(categorie);
drop index prod_cat;

create sequence my_seq start with 1 increment by 1 maxvalue 100 nocycle;

select * from comenzi;
insert into comenzi values (my_seq.nextval, sysdate, 'direct', 101, 0, 153);

select my_seq.currval from dual;
alter sequence my_seq increment by 10;
alter sequence my_seq maxvalue 1000;
drop sequence my_seq;

create synonym rc for rand_comenzi;
select * from rc;