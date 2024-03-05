functiile predefinite
1. single row->la nivel de inregistrare
2. group by->returneaza un singur rezultat pentru mai multe inregistrari

1.1 functii de siruri de caractere: concat, lower, upper, initcap, length, substr,instr,...

substr(nume,1,3)
		nume-sirul
		1-ch de unde incepe
		3-pana unde 
			ex: king->kin

instr(nume,a)->pozitia pe care gasim litera respectiva

1.2 functii pt val. numerice: round, trunc, mid, abs, power, sign...

	sign(salariu):  1-poz
			0-nul	
			-1-neg

1.3 f de date calendaristice extract, months, between, addmonths,next_day, cast_day, sysdate


1.4 functii de conversie to_date, to_char, to_number	

1.5 functiipt tratarea valorilor lipsa(NULL); NULL, NVL, NVL2, NULLIF, COALESCE
		Coalesce(returneaza primul param care nu e null)

