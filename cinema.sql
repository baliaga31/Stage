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
SELECT titre, duree/60 as dureeH, duree%60 as dureeM from film where duree is not NULL;

-- 