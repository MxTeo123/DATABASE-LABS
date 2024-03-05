--pt comentarii
--utilizam --

select * from angajati;
select * from salariati;
select * from salariati;

/* rulam cu tasta f9
rulam mai multe comenzi sql(un script) cu ajutorul tastei f5*/

--sintaxa comenzii insert(ADAUGAM INREGISTRARI)
--insert into nume_tabela [(lista cu coloane/atribute)] values (lista cu valori);

insert into salariati1(id_angajat, prenume, email, nume)values (2, 'Mihai', 'mihai@ase.ro', 'Costache');
rollback;

--anulam o comanda de tip LMD sau putem anula ci tranzactie adica o succesiune de comenzi
commit;
--salvam modficarile
-- adaugam val cu un operatorul de substitutie: '&'

insert into salariati1(id_angajat, prenume, id_functie) values (&id, '&prenume', '&functie');

--insert into nume_tabela_destinatie select */coloane from nume_tabela_sursa
insert into salariati1 select * from angajati where id_departament=80;

--update acualizam inregistrari/valori
/*update nume_tabela
setnume_coloana=valoare_noua
where conditie */

update salariati1
set salariul = 6000
where id_angajat=1;

update salariati1
set salariul=salariul*1.05;

--delete pt stergerea inregistrarilor
--delete from nume_tabela;

delete from salariati1
where nume like 'A%';

commit;

select * from salariati1;
select count(*) from salariati1;

--count numara nr de inregistrari din tabel

select count (*) from angajati
where prenume='John';

--merge face fie insert, fie update
--35 iregis in salariati1 din care 3 au fost adaugati manual(gigel,mihai,dorel), 34 preluati din angajati 
--din care am sters 2
--107 

MERGE INTO salariati1 USING angajati 
ON (salariati.id_angajat = angajati.id_angajat)
WHEN MATCHED THEN 
UPDATE SET salariati.salariul=angajati.salariul
WHEN NOT MATCHED THEN
INSERT  (id_angajat, nume, salariul) VALUES (angajati.id_angajat, angajati.nume, angajati.salariul);

select * from salariati1;

create table dep(
id number(7),
denumire varchar2(25)
);

select * from departamente;

insert into dep select id_departament, denumire_departament from departamente;

--tema word

