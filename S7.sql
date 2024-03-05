-- functii de grup(group by functions)â
--  sum, max, min, avg, count, etc.

select * from angajati;

select sum(salariul)fond_total_sal, max(salariul) cel_mai_mare_sal,
count(id_angajat) nr_ang from angajati;


--sal celor vcare au fost angajati dupa 1 ian 2017grupati pe functii

select a.id_functie,denumire_functie, sum(salariul) tot_sal
from angajati a, functii f
where a.id_functie=f.id_functie and data_angajare>to_date('01.01.2017', 'dd.mm.yyyy')
group by a.id_functie, denumire_functie
having sum(salariul) > 10000
order by tot_sal desc;

--sortarea se face fie dupa alias, coloana, poz col in afisare

--sa se afiseze pt fiecare comanda data la care a fost efectuata
--si val tot. a comenzii 

select c.id_comanda, data, sum(pret*cantitate)valoare_totala
from comenzi c, rand_comenzi r 
where c.id_comanda= r.id_comanda and extract(month from data) in (12,1,2)
group by c.id_comanda, data having sum(pret*cantitate)>30000
order by data ;

--coeficientul de corelatie dintre vechime si salariul

select round(corr(salariul, months_between(sysdate, data_angajare)),2) coef_Pearson
from angajati;
--corr(Pearson), corr_s, corr_k(Kendal) si se mdifica

--for update;

--subcereri select intr-un select 
--sa se afiseze angajatii care au aceeasi functie cu cea a angajatului LEE

select * from angajati 
where id_functie in (select id_functie from angajati where initcap(nume)='Smith');

select id_angajat, prenume, id_functie, salariul
from angajati
where salariul<all
(select salariul from angajati
where id_functie='IT_PROG')
and id_functie <>'IT_PROG'

--test sapt 11(9 dec)
--s12 nu poate profa, intram online probabil
--s13 si s14 pt prezentaer proiecte 





