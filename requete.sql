--Having, group by, order by, count, max, min,intersect,minus, join
--1
--Liste des usagers ayant un crédit bonus > 1 heure
SELECT nom,prenom from Usager where creditBonus >60;
--2
--Liste des points d'attache en panne
SELECT idPointAtt from PointAttache where EnService = 'En panne';
--3
--Modifier l'état d'une station 
UPDATE Station set Etat='Fermée' where idStation=1;
--4
--Suppression des usagers n'ayant pas renouvelé leur abonnement 
Delete from Usager where DateFinAbo<SYSDATE;
--5
--Liste des usagers dont le prix de l'abonnement est supérieur à 40 euros
SELECT Nom,prenom from Usager 
    JOIN Abonnement on Abonnement.idAbonnement = Usager.idAbonnement
    WHERE prix>40;
--6
--nombre de personnes possédant un crédit bonus
SELECT count(idCarte) from Usager where creditBonus>1;
--7
--Liste des personnes triées par le prix de leur abonnement
SELECT Nom, prenom, prix from usager 
    JOIN Abonnement on Abonnement.idAbonnement = Usager.idAbonnement
    order by Prix Asc;
--8
--Usager qui n'ont pas encore fait de trajet aujourd'hui
--méthode not in
SELECT Nom, Prenom from Usager
    WHERE idCarte not in(Select idCarte from trajet 
                        where idDate_A =SYSDATE);

--méthode <> ALL
SELECT Nom, Prenom from Usager
    WHERE idCarte <> ALL(Select idCarte from trajet 
                        where idDate_A =SYSDATE);
--10
--Renvoie les utilisateurs en fonction de la duree totale de leur trajet
SELECT Usager.idCarte, sum(duree)
    from Usager
    JOIN Trajet on Trajet.idCarte= Usager.idCarte;
   GROUP BY Usager.idCarte;
--11
--Renvoie les utilisateurs dont la durée totale de leur trajet est supérieur à 100
SELECT Usager.idCarte, sum(duree)
    from Usager
    JOIN Trajet on Trajet.idCarte= Usager.idCarte
   GROUP BY Usager.idCarte
   HAVING sum(duree) >100;

--12
--Permet de donner l'âge moyen des usagers
SELECT (trunc(AVG(SYSDATE-DateNaissance))/365) AS age_moyen FROM Usager;

--13
--Ressort tous les vélos attaché à un point d'attache
select idvelo
from pointAttache
MINUS
select idvelo
from pointAttache
where idvelo is null;

--14
--Usagers n'ayant jamais fait le trajet entre les deux stations
select nom, prenom
from usager
where not exists(select *
                from trajet
                where idBorneA =2 and idBorneB = 3
                and trajet.idCarte = usager.idCarte);

--15
--Usager qui ont déja utilisé ces vélos
select idCarte,Nom,Prenom
from utilise_velo
where idvelo = 2 
intersect (
    select idCarte,Nom,Prenom  from utilise_velo
    where idvelo=20);

--16
--Usager classé en fonction de la facture la plus haute
SELECT Nom, prenom, min(Facture) from usager
    group by Nom,Prenom
    order by min(Facture) desc;

--17
--Suppression des trajets vieux de plus de 2 ans

Delete from Trajet where idDate_B <ADD_MONTHS(SYSDATE, -24);