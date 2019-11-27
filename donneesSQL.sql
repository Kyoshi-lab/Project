--Abonnement

INSERT INTO Abonnement VALUES(1,'Pass jour','Journalier', 2.50);
INSERT INTO Abonnement VALUES(2,'Pass mensuel','Mensuel', 30.00);
INSERT INTO Abonnement VALUES(3,'Pass trimestre','Trimestriel', 50.00);
INSERT INTO Abonnement VALUES(4,'Pass Année','Annuel', 150.00);

--Usager

INSERT INTO Usager VALUES(1,'Pons','Aline',37,'8 avenue des Trones 21000 Dijon',null,to_date('31/05/2017:12:00:00','dd/mm/yyyy:hh24:mi:ss'), to_date('31/05/2018:12:00:00', 'dd/mm/yyyy:hh24:mi:ss'),4);
INSERT INTO Usager VALUES(2,'Dore','Claudine',35,' 5 Rue d''Arles 21000 Dijon',null,to_date('18/03/2017:15:25:00','dd/mm/yyyy:hh24:mi:ss'), to_date('18/04/2017:15:25:00', 'dd/mm/yyyy:hh24:mi:ss'),2);
INSERT INTO Usager VALUES(3,'Devaux','Valère',21,'2 rue Jean Mac 21000 Dijon',null,to_date('31/08/2017:8:00:00','dd/mm/yyyy:hh24:mi:ss'), to_date('01/11/2017:8:00:00', 'dd/mm/yyyy:hh24:mi:ss'),3);
INSERT INTO Usager VALUES(4,'Pires','Celeste',25,'45 Allee du portillon 21000 Dijon',null,to_date('10/10/2017:10:00:00','dd/mm/yyyy:hh24:mi:ss'), to_date('11/10/2017:10:00:00', 'dd/mm/yyyy:hh24:mi:ss'),1);
INSERT INTO Usager VALUES(5,'Ba','Marc',24,'1 Rue Raymond Soulas 21000 Dijon',null,to_date('12/12/2017:12:00:00','dd/mm/yyyy:hh24:mi:ss'), to_date('12/03/2018:12:00:00', 'dd/mm/yyyy:hh24:mi:ss'),3);
INSERT INTO Usager VALUES(6,'Lemaitre','Margot',20,'15 Rue de la Saintonge 21000 Dijon',null,to_date('15/12/2017:17:00:00','dd/mm/yyyy:hh24:mi:ss'), to_date('15/01/2018:17:00:00', 'dd/mm/yyyy:hh24:mi:ss'),2);
INSERT INTO Usager VALUES(7,'Bernier','Julie',21,'6 Rue Georges Guynemer 21000 Dijon',null,to_date('17/12/2017:9:00:00','dd/mm/yyyy:hh24:mi:ss'), to_date('17/01/2018:12:00:00', 'dd/mm/yyyy:hh24:mi:ss'),2);
INSERT INTO Usager VALUES(8,'Mallet','Vincent',25,'18 Rue du Nil 21000 Dijon',null,to_date('12/12/2017:18:00:00','dd/mm/yyyy:hh24:mi:ss'), to_date('13/12/2018:18:00:00', 'dd/mm/yyyy:hh24:mi:ss'),1);
INSERT INTO Usager VALUES(9,'Riviere','Daniel',29,'34 Boulevard Francois Mitterrand 21000 Dijon',null,to_date('12/06/2017:12:00:00','dd/mm/yyyy:hh24:mi:ss'), to_date('12/06/2018:12:00:00', 'dd/mm/yyyy:hh24:mi:ss'),4);
INSERT INTO Usager VALUES(10,'Leroy','Martin',24,'10 Chemin des Trones 21000 Dijon',null,to_date('08/10/2017:14:00:00','dd/mm/yyyy:hh24:mi:ss'), to_date('08/10/2018:12:00:00', 'dd/mm/yyyy:hh24:mi:ss'),4);

--1Velo

INSERT INTO Velo VALUES(1,'Disponible');
INSERT INTO Velo VALUES(2,'Disponible');
INSERT INTO Velo VALUES(3,'Disponible');
INSERT INTO Velo VALUES(4,'En reparation');
INSERT INTO Velo VALUES(5,'Disponible');
INSERT INTO Velo VALUES(6,'Non disponible');
INSERT INTO Velo VALUES(7,'Disponible');
INSERT INTO Velo VALUES(8,'Disponible');
INSERT INTO Velo VALUES(9,'Disponible');
INSERT INTO Velo VALUES(10,'En reparation');
INSERT INTO Velo VALUES(11,'Disponible');
INSERT INTO Velo VALUES(12,'Disponible');
INSERT INTO Velo VALUES(13,'Disponible');
INSERT INTO Velo VALUES(14,'Non disponible');
INSERT INTO Velo VALUES(15,'En reparation');
INSERT INTO Velo VALUES(16,'Disponible');
INSERT INTO Velo VALUES(17,'Disponible');
INSERT INTO Velo VALUES(18,'Disponible');
INSERT INTO Velo VALUES(19,'Disponible');
INSERT INTO Velo VALUES(20,'Disponible');
INSERT INTO Velo VALUES(21,'En reparation');
INSERT INTO Velo VALUES(22,'Disponible');
INSERT INTO Velo VALUES(23,'Disponible');
INSERT INTO Velo VALUES(24,'Disponible');
INSERT INTO Velo VALUES(25,'Non disponible');
INSERT INTO Velo VALUES(26,'En reparation');
INSERT INTO Velo VALUES(27,'Disponible');
INSERT INTO Velo VALUES(28,'Disponible');
INSERT INTO Velo VALUES(29,'Non disponible');
INSERT INTO Velo VALUES(30,'Disponible');
INSERT INTO Velo VALUES(31,'En reparation');

--Agent 

INSERT INTO Agent VALUES(1,'Diaz','Cameron');
INSERT INTO Agent VALUES(2,'Nikolai','Vlad');
INSERT INTO Agent VALUES(3,'Chantome','Florent');

--Camionette

INSERT INTO Camionette VALUES(1,'Centre',20);
INSERT INTO Camionette VALUES(2,'Nord-ouest',30);
INSERT INTO Camionette VALUES(3,'Sud-est',20);
INSERT INTO Camionette VALUES(4,'Nord-est',20);
INSERT INTO Camionette VALUES(5,'Sud-ouest',20);

--Station

INSERT INTO Station VALUES(1,'Jean-Garnier','Centre','Ouvert','normal',0);
INSERT INTO Station VALUES(2,'Poincarre','Sud-ouest','Ouvert','normal',0);
INSERT INTO Station VALUES(3,'Republique','Nord-ouest','Ouvert','normal',1);
INSERT INTO Station VALUES(4,'Auditorium','Sud-est','Ouvert','normal',1);
INSERT INTO Station VALUES(5,'Erasme','Nord-est','Fermée','normal',0);

--Borne

INSERT INTO Borne VALUES(1,3);
INSERT INTO Borne VALUES(2,2);
INSERT INTO Borne VALUES(3,5);
INSERT INTO Borne VALUES(4,1);
INSERT INTO Borne VALUES(5,4);


--PointAttache

INSERT INTO PointAttache VALUES(1,'Rouge','Fonctionnel',1,1);
INSERT INTO PointAttache VALUES(2,'Rouge','Fonctionnel',2,1);
INSERT INTO PointAttache VALUES(3,'Eteint','Fonctionnel',null,1);
INSERT INTO PointAttache VALUES(4,'Eteint','Fonctionnel',null,1);
INSERT INTO PointAttache VALUES(5,'Rouge','Fonctionnel',3,1);
INSERT INTO PointAttache VALUES(6,'Eteint','Fonctionnel',null,1);
INSERT INTO PointAttache VALUES(7,'Eteint','Fonctionnel',null,1);
INSERT INTO PointAttache VALUES(8,'Rouge','En panne',null,1);
INSERT INTO PointAttache VALUES(9,'Rouge','En panne',null,1);

INSERT INTO PointAttache VALUES(10,'Eteint','Fonctionnel',null,2);
INSERT INTO PointAttache VALUES(11,'Eteint','Fonctionnel',null,2);
INSERT INTO PointAttache VALUES(12,'Eteint','Fonctionnel',null,2);
INSERT INTO PointAttache VALUES(13,'Rouge','Fonctionnel',5,2);
INSERT INTO PointAttache VALUES(14,'Rouge','Fonctionnel',7,2);
INSERT INTO PointAttache VALUES(15,'Rouge','Fonctionnel',8,2);
INSERT INTO PointAttache VALUES(16,'Rouge','Fonctionnel',9,2);
INSERT INTO PointAttache VALUES(17,'Rouge','Fonctionnel',11,2);
INSERT INTO PointAttache VALUES(18,'Rouge','Fonctionnel',12,2);
INSERT INTO PointAttache VALUES(19,'Rouge','Fonctionnel',13,2);

INSERT INTO PointAttache VALUES(20,'Eteint','Fonctionnel',null,3);
INSERT INTO PointAttache VALUES(21,'Eteint','Fonctionnel',null,3);
INSERT INTO PointAttache VALUES(22,'Rouge','Fonctionnel',16,3);
INSERT INTO PointAttache VALUES(23,'Eteint','Fonctionnel',null,3);
INSERT INTO PointAttache VALUES(24,'Rouge','Fonctionnel',17,3);
INSERT INTO PointAttache VALUES(25,'Eteint','Fonctionnel',null,3);
INSERT INTO PointAttache VALUES(26,'Rouge','Fonctionnel',18,3);
INSERT INTO PointAttache VALUES(27,'Eteint','Fonctionnel',null,3);
INSERT INTO PointAttache VALUES(28,'Eteint','Fonctionnel',null,3);
INSERT INTO PointAttache VALUES(29,'Rouge','Fonctionnel',19,3);

INSERT INTO PointAttache VALUES(30,'Rouge','Fonctionnel',20,4);
INSERT INTO PointAttache VALUES(31,'Rouge','Fonctionnel',22,4);
INSERT INTO PointAttache VALUES(32,'Rouge','Fonctionnel',23,4);
INSERT INTO PointAttache VALUES(33,'Rouge','Fonctionnel',24,4);
INSERT INTO PointAttache VALUES(34,'Rouge','Fonctionnel',27,4);
INSERT INTO PointAttache VALUES(35,'Rouge','Fonctionnel',28,4);
INSERT INTO PointAttache VALUES(36,'Rouge','Fonctionnel',30,4);
INSERT INTO PointAttache VALUES(37,'Rouge','En panne',null,4);
INSERT INTO PointAttache VALUES(38,'Eteint','Fonctionnel',null,4);
INSERT INTO PointAttache VALUES(39,'Eteint','Fonctionnel',null,4);

INSERT INTO PointAttache VALUES(40,'Rouge','Station Fermee',null,5);
INSERT INTO PointAttache VALUES(41,'Rouge','Station Fermee',null,5);
INSERT INTO PointAttache VALUES(42,'Rouge','Station Fermee',null,5);
INSERT INTO PointAttache VALUES(43,'Rouge','Station Fermee',null,5);
INSERT INTO PointAttache VALUES(44,'Rouge','Station Fermee',null,5);
INSERT INTO PointAttache VALUES(45,'Rouge','Station Fermee',null,5);
INSERT INTO PointAttache VALUES(46,'Rouge','Station Fermee',null,5);
INSERT INTO PointAttache VALUES(47,'Rouge','Station Fermee',null,5);
INSERT INTO PointAttache VALUES(48,'Rouge','Station Fermee',null,5);
INSERT INTO PointAttache VALUES(49,'Rouge','Station Fermee',null,5);

--repare velo

INSERT INTO repare_velo VALUES(1,4);
INSERT INTO repare_velo VALUES(2,10);
INSERT INTO repare_velo VALUES(3,15);
INSERT INTO repare_velo VALUES(1,21);
INSERT INTO repare_velo VALUES(2,26);
INSERT INTO repare_velo VALUES(3,31);

--utilise velo

INSERT INTO utilise_velo VALUES(1,6);
INSERT INTO utilise_velo VALUES(5,14);
INSERT INTO utilise_velo VALUES(6,25);
INSERT INTO utilise_velo VALUES(9,29);

--distance

INSERT INTO Distance VALUES(1,2,300);
INSERT INTO Distance VALUES(1,3,300);
INSERT INTO Distance VALUES(1,4,300);
INSERT INTO Distance VALUES(1,5,300);

INSERT INTO Distance VALUES(2,3,600);
INSERT INTO Distance VALUES(2,4,300);
INSERT INTO Distance VALUES(2,5,600);

INSERT INTO Distance VALUES(3,4,600);
INSERT INTO Distance VALUES(3,5,300);

INSERT INTO Distance VALUES(4,5,600);