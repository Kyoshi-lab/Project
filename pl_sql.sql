SET SERVEROUTPUT ON
create or replace trigger tio_u_dateAboF
instead of insert or update
on v_Usager
For each row
declare
dAbo Abonnement.Duree%Type;
FinAbo Usager.DateFinAbo%Type;

Begin
SELECT Duree into dAbo from Abonnement 
where (:NEW.idAbonnement = idAbonnement);
if dAbo = 'Journalier' then
        FinAbo := :New.DateDebutAbo + 1;
elsif dAbo = 'Mensuel' then 
        FinAbo := ADD_MONTHS(:New.DateDebutAbo,1);
elsif dAbo = 'Trimestriel' then 
        FinAbo := ADD_MONTHS(:New.DateDebutAbo,3);
elsif dAbo = 'Annuel' then 
        FinAbo := ADD_MONTHS(:New.DateDebutAbo,12);      
end if;
INSERT INTO Usager VALUES(
    :NEW.idCarte, :NEW.Nom, :NEW.Prenom, :NEW.Age, :NEW.Adresse, :NEW.CreditBonus, :NEW.DateDebutAbo, FinAbo,:NEW.idAbonnement);

end tio_u_dateAboF;
/


CREATE OR REPLACE VIEW v_Usager
AS SELECT idCarte,Nom,Prenom,Age,Adresse,CreditBonus,DateDebutAbo,DateFinAbo,idAbonnement FROM Usager;
insert into v_Usager values(20,'LAROSE','Thomas','25','9,allee Jean rostand 21000 Dijon',null,SYSDATE, null ,4);