--1
create table Dep(
id number(7) primary key,
denumire varchar2(25)
);

--2
select * from departamente;
insert into dep select id_departament, denumire_departament from departamente;

--3
create table Ang(
    id number(7) primary key,
    prenume varchar2(25),
    nume varchar2(25),
    dep_id number(7),
    constraint fk_dep FOREIGN KEY (dep_id) references dep(id)
);

--4
alter table Ang 
add Varsta number(2);

--5
alter table Ang2
add constraint varsta_min check(Varsta>=18)
add constraint varsta_max check(Varsta<66);

--6
alter table Ang
drop constraint varsta_min
drop constraint varsta_max;

--7
alter table Ang2
modify nume varchar2(30);

--8
rename  Ang to Ang2;

--9
select *from angajati;
create table salariati as select * from angajati;
select * from salariati;

--10

insert into salariati (id_angajat, prenume, nume, email, telefon, data_angajare, id_functie, salariul, comision,id_manager,
id_departament) values( 1,'Steven', 'King', 'Skong', '555.123.4567', to_date('17-06-1987','dd-mm-yyyy'),'AD_PRES', 24000, 0.1, 0,90);

insert into salariati (id_angajat, prenume, nume, email, telefon, data_angajare, id_functie, salariul, comision,id_manager,
id_departament) values( 2,'Neena', 'Koch', 'NKOCH', '555.123.4568', to_date('21-09-1989','dd-mm-yyyy'),'AD_PRES', 17000, 0.1, 100,90);

insert into salariati (id_angajat, prenume, nume, email, telefon, data_angajare, id_functie, salariul, comision,id_manager,
id_departament) values( 3,'Lex', 'Han', 'LHAAN', '555.123.4569', to_date('13-01-1993','dd-mm-yyyy'),'AD_VP', 17000, 0.2, 0,90);


--11
update salariati
set prenume='JOHN'
where id_angajat=3;

--12
update salariati
set email='JHAAN'
where id_angajat=3;

--13
update salariati 
set salariul=1.1*salariul
where salariul <20000;

--14
update salariati 
set id_functie='AD_PRES'
where id_angajat=2;

--15
update salariati
set comision=(select comision from salariati where id_angajat=3)
where id_angajat=2;
select * from salariati;

--16
delete from salariati 
where id_angajat=1;
