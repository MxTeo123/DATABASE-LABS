notite seminar 4

-- = comentariu pe o singura linie
/*  ... */ == comentariu pe mai multe linii

--1) insert into nume_tabela (lista cu atribute/coloane) values (lista cu valori);
(lista cu atribute/coloane) == poate lipsi
commit== devine permanent;
rollback=
 
&= este o alta metoda de inserare; o sa avem o fereastra pop up unde adaugam acolo de ex: nume,id,email,etc;
daca rulam commit,noua inresare devine permanenta;
--3)insert into nume_tabela_destinatie select */coloane from nume_tabela_sursa; == adaugam mai multe inregistrari deodata
insert into salariati1 select * from angajati where id_departament = 80;== preluam inregistrarile din angajati in care avem id departament = 80;
select count(*) from salariati1; == arata cate inregistrari sunt in tabela;
select count(prenume) from angajati
where prenume= 'John'; == ne arata cate prenume john exista in tabela;
--pentru comentarii
-- utilizam --

select * from angajati;
select * from salariati;
select * from salariati1;
/*rulam o singura comanda cu tasta f9
rulam mai multe comenzi sql(script) cu ajutorul taste f5 */

-- sintaxa comenzii insert(adaugam inregistrari)
--1) insert into nume_tabela [(lista cu atribute/coloane)] values (lista cu valori);

insert into salariati1 (id_angajat,prenume,email,nume) values (2, 'Mihai' ,'mihai@ase.ro' , 'Costache');
rollback;
--anulam o comanda de tip LMD sau putem orice tranzactie ,adica o succesiune de comenzi;
commit;
-- salvam modificarea,adica adaugarea inregistrarii in tabela salariati1;
--2)adaugam valori cu operatorul de substitutie = &;
insert into salariati1 (id_angajat,prenume,id_functie) values(&id,'&prenume','&functie');

--alta metoda de insert
--3)insert into nume_tabela_destinatie select */coloane from nume_tabela_sursa;
insert into salariati1 select * from angajati where id_departament = 80;

--update == actualizam inregistrari/valori;
/*update nume_tabela
set nume_coloana = valoare_noua
where conditie*/

update salariati1
set salariul=6000
where id_angajat=1;

update salariati1
set salariul=salariul *1.05;

--delete= pentru stergerea inregistrarilor
--delete from  nume_tabela  (sterge toate inregistrarile)
--delete from nume_tabela [where conditie] = sterge doar cateva inregistrari
delete from salariati1
where nume like 'A%';
commit;

select *from salariati1;
select count(*) from salariati1
where prenume= 'John';
select count(prenume) from angajati
where prenume= 'John';

--merge == face fie insert,fie update;
-- ex: aveam 35 de inregistrari in salariati1,din care 3 au fost adaugati de noi(Gigel,Mihai,Dorel), 34 preluati din angajati
-- si din care am sters 2 din cei 34
--107 inregistrari in tabele angajati;
MERGE INTO salariati1 USING angajati 
ON (salariati1.id_angajat = angajati.id_angajat)
WHEN MATCHED THEN 
UPDATE SET salariati1.salariul=angajati.salariul
WHEN NOT MATCHED THEN
INSERT  (id_angajat, nume, salariul) VALUES 
(angajati.id_angajat, angajati.nume, angajati.salariul);
select * from salariati1;
commit;
