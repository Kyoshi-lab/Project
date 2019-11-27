DROP TABLE Abonnement CASCADE CONSTRAINTS;
DROP TABLE Usager CASCADE CONSTRAINTS;
DROP TABLE Velo CASCADE CONSTRAINTS;
DROP TABLE Agent CASCADE CONSTRAINTS;
DROP TABLE Camionette CASCADE CONSTRAINTS;
DROP TABLE Borne CASCADE CONSTRAINTS;
DROP TABLE Station CASCADE CONSTRAINTS;
DROP TABLE PointAttache CASCADE CONSTRAINTS;
DROP TABLE repare_velo CASCADE CONSTRAINTS;
DROP TABLE repartit_velo CASCADE CONSTRAINTS;
DROP TABLE utilise_velo CASCADE CONSTRAINTS;
DROP TABLE Trajet CASCADE CONSTRAINTS;
DROP TABLE Distance CASCADE CONSTRAINTS;


CREATE TABLE Abonnement(
	idAbonnement integer PRIMARY KEY NOT NULL,
	Type varchar(50),
	Duree varchar(20),
	Prix number(5,2));

CREATE TABLE Usager(
	idCarte integer PRIMARY KEY NOT NULL,
	Nom varchar(20) NOT NULL,
	Prenom varchar(20) NOT NULL,
	Age integer NOT NULL,
	Adresse varchar(50) NOT NULL,
	CreditBonus integer,
	DateDebutAbo DATE NOT NULL,
	DateFinAbo DATE ,
	idAbonnement integer NOT NULL CONSTRAINT fk_Abonnement REFERENCES Abonnement); 

CREATE TABLE Velo(
	idVelo integer PRIMARY KEY NOT NULL,
	Etat varchar(20) NOT NULL,
	CONSTRAINT valeur_velo_etat
	CHECK (Etat in ('Disponible','Non disponible', 'En reparation')));

CREATE TABLE Agent(
	idAgent integer PRIMARY KEY NOT NULL,
	Nom varchar(20) NOT NULL,
	Prenom varchar(20) NOT NULL);

CREATE TABLE Camionette(
	idCamion integer PRIMARY KEY NOT NULL,
	Secteur varchar(50) NOT NULL,
	Capacite integer NOT NULL,
	CONSTRAINT valeur_Camion_Secteur
	CHECK (Secteur in ('Centre','Nord-ouest','Nord-est','Sud-ouest','Sud-est')));

CREATE TABLE Station(
	idStation integer PRIMARY KEY NOT NULL,
	nom varchar(20) NOT NULL,
	Secteur varchar(50) NOT NULL,
	Etat varchar(10) NOT NULL,
	Saturation varchar(20) NOT NULL,
	Bonus number(1) NOT NULL,
	CONSTRAINT valeur_Station_etat
	CHECK (Etat in ('Ouvert','Fermée')),
	CONSTRAINT valeur_Station_secteur
	CHECK (Secteur in ('Centre','Nord-ouest','Nord-est','Sud-ouest','Sud-est')),
	CONSTRAINT valeur_Station_saturage
	CHECK (Saturation in ('Sature','normal','vide')),
	CONSTRAINT valeur_Station_Bonus
	CHECK (Bonus in(0,1)));

CREATE TABLE Borne(
	idBorne integer PRIMARY KEY NOT NULL,
	idStation integer NOT NULL 
	CONSTRAINT fk_Station_Borne REFERENCES Station);

CREATE TABLE PointAttache(
	idPointAtt integer PRIMARY KEY NOT NULL,
	Etat varchar(20) NOT NULL,
	EnService varchar(20) NOT NULL,
	idVelo integer  
	CONSTRAINT fk_Velo_PointAttache REFERENCES Velo,
	idStation integer NOT NULL CONSTRAINT fk_Station_PointAttache
	REFERENCES Station,
	CONSTRAINT valeur_pointAttache_etat
	CHECK (Etat in ('Vert','Rouge','Eteint')),
	CONSTRAINT valeur_pointAttache_enService
	CHECK (EnService in ('Fonctionnel','En panne','Station Fermee')));


CREATE TABLE repare_velo(
	idAgent integer NOT NULL CONSTRAINT fk_agent_repare REFERENCES Agent,
	idVelo integer NOT NULL CONSTRAINT fk_velo_repare REFERENCES Velo,
	PRIMARY KEY (idAgent,idVelo));


CREATE TABLE repartit_velo(
	idCamion integer NOT NULL CONSTRAINT fk_camion_repartit REFERENCES Camionette,
	idVelo integer NOT NULL CONSTRAINT fk_velo_repartit REFERENCES Velo,
	PRIMARY KEY (idCamion,idVelo));
	
	

CREATE TABLE utilise_velo(
	idCarte integer NOT NULL CONSTRAINT fk_Usager_utilise REFERENCES Usager,
	idVelo integer NOT NULL CONSTRAINT fk_velo_utilise REFERENCES Velo,
	PRIMARY KEY (idCarte,idVelo));
	
	

CREATE TABLE Trajet(
	idCarte integer NOT NULL CONSTRAINT fk_trajet_Usager  REFERENCES Usager,
	idDate_A timestamp NOT NULL,
	idDate_B timestamp NOT NULL,
	Duree timestamp NOT NULL,
	PRIMARY KEY (idCarte,idDate_A,idDate_B));

CREATE TABLE Distance(
	idStationA integer NOT NULL CONSTRAINT fk_distance_StationA REFERENCES Station,
	idStationB integer NOT NULL CONSTRAINT fk_distance_StationB REFERENCES Station,
	Distance integer NOT NULL,
	PRIMARY KEY (idStationA, idStationB));



















