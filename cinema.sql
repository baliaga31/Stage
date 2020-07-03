SELECT * from film;


-- Selection
-- Operateur : = != <> < <= >= >
SELECT * from film where annee >= 2010;
SELECT * from film where num_film = 5;
SELECT * from film where annee <> 2011;
SELECT * from film where annee between 1996 and 2004;

-- Logical combinator : not and or
SELECT * from film where not (annee between 1996 and 2004);
SELECT * from film where annee < 1996 or annee > 2004;
SELECT * from film where annee <= 1970 and genre = 'Western';
SELECT * from individu where date_naissance is not NULL;

-- Predicat avec matching de texte
SELECT * from film where titre like 'K%';
SELECT * from film where titre like '_a%'

-- manipulation de texte
select prenom || ' ' || nom as fullname from individu;
SELECT upper(nom), lower(prenom) from individu;
SELECT substr(titre, 3) from film;
SELECT titre, length(titre) as long_titre from film;

-- calcul numerique :
Select titre, duree, duree/60, duree%60 from film where duree is not NULL;

--- Temporal data
SELECT * from individu WHERE date_naissance is not NULL;
set LANG = fr_FR
set DATESTYLE = SQL, DMY;
set LC_TIME = fr_FR
SELECT * from individu WHERE date_naissance is not NULL;
SELECT prenom, nom, to_char(date_naissance, 'day Mon DD"th" YYYY') from individu WHERE individu is not NULL;
SELECT prenom, nom, to_char(date_naissance, 'TMday DD TMmon YYYY') from individu WHERE individu is not NULL;

SELECT prenom, nom, extract(year from date_naissance) as annee_naissance 
from individu 
WHERE date_naissance is not NULL;

SELECT CURRENT_DATE;

SELECT 
	*, 
	extract(year from current_date) - extract(year from date_naissance) as annee_naissance 
from individu 
WHERE date_naissance is not NULL;

SELECT 
	count (*) as nb_film, 
	count(duree) as nb_duree, 
	round(avg(duree), 2) as avg_duree 
from film 
where annee between 1990 and 2000;

SELECT 
	count (*) as nb_film, 
	count(duree) as nb_duree, 
	round(avg(duree), 2) as avg_duree,
	sum(duree) as tot_duree
from film 
where annee between 2020 and 2029;

SELECT 
	count (*) as nb_film, 
	count(duree) as nb_duree, 
	round(avg(duree), 2) as avg_duree,
	coalesce(sum(duree),0) as tot_duree
from film 
where annee between 2020 and 2029;

SELECT
	count(*) as nb_film,
	count(annee) as nb_annee
	count(distinct annee) as nb_annee_uniq
from film;

-- Titre et nombre d'annee des films
SELECT annee, count(*) as nb_film, round(avg(duree),2) as moyenne_duree_film from film
	Group By annee
	Order by annee DESC;
	
SELECT *
from film
Order by annee DESC, titre;

-- regrouper les films par realisateurs

SELECT  
	annee,
	num_real,
	sum(duree) as duree_totale
from film 
group by num_real, annee
order by annee DESC;

SELECT
	annee,
	genre,
	count(num_film) as nombre_film,
	coalesce(round(avg(duree),2),0) as duree_moyenne_film
from film
group by genre, annee
order by annee;

SELECT max(count(num_film))
from film
group by num_real;


SELECT max(nb_film) as max_nb_real
from (SELECT count(num_film) as nb_film
from film
group by num_real) nbs;

SELECT num_real, count(num_film) as nb_film
from film
group by num_real
having count(num_film) = (
	select max(nb_film as max_nb_real
	from (select count9)))