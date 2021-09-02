create database projectSql;
go
use projectSql;
create table mutation(Id_mutation int primary key , Code_mutation int, Date_mutation datetime, Nature_mutation varchar(255), Valeur_foncier decimal )
go
go
create table Departement(Id_departement varchar(255) primary key,Num_departement varchar(255) )

create table TypeVoie(Code_type_voie int primary key, Type_voie varchar(255))
go
create table CodeVoie(Id_voie int primary key, codeVoie varchar(255), Nom_de_voie varchar(255))
go
create table Section(Id_section int primary key, Section_nom varchar(255))
go
create table Plans(Id_plan int primary key, Num_plan int, Id_section int, 
FOREIGN KEY (Id_section)
        REFERENCES Section (Id_section)
        ON DELETE CASCADE
        ON UPDATE CASCADE
)
go
create table Locale(Id_local int primary key, Type_local varchar(255))
go
create table Commune(Code_pastal int, Commune varchar(255), Code_commune int, Id_commune int  primary key,Section_prefix varchar(255), Id_departement varchar(255),
FOREIGN KEY (Id_departement)
        REFERENCES Departement (Id_departement)
        ON DELETE CASCADE
        ON UPDATE CASCADE)
go
create table Caracter_local(Id_local int, surfface_reel_bati decimal, nbr_piece_principale int, FOREIGN KEY (Id_local)
        REFERENCES Locale (Id_local)
        ON DELETE CASCADE
        ON UPDATE CASCADE)
go
create table Lot(Num_de_lot int primary key, Lot int, Surfface_carre_du_first_lot decimal, Nbr_de_lot int, Id_plan int,
FOREIGN KEY (Id_plan)
        REFERENCES Plans (Id_plan)
        ON DELETE CASCADE
        ON UPDATE CASCADE
)
go
create table Adresse(id_adresse int primary key, B_T_Q varchar(255), Num_voie int, Id_voie int, Code_type_voie int, Id_commune int,
id_mutation int, id_local int,
FOREIGN KEY (id_mutation)
        REFERENCES mutation (Id_mutation)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
		FOREIGN KEY (Id_commune)
        REFERENCES Commune (Id_commune)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
		FOREIGN KEY (Id_voie)
        REFERENCES CodeVoie (Id_voie)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
		FOREIGN KEY (Num_voie)
        REFERENCES TypeVoie (Code_type_voie)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
		FOREIGN KEY (id_local)
        REFERENCES Locale (Id_local)
        ON DELETE CASCADE
        ON UPDATE CASCADE
)
ALTER TABLE Locale
ADD Num_de_lot int,
		FOREIGN KEY (Num_de_lot)
        REFERENCES Lot (Num_de_lot)
        ON DELETE CASCADE
        ON UPDATE CASCADE
;
select*from Commune
Drop table CodeVoie