drop database tovos5;
CREATE DATABASE tovos5;
\c tovos5;

-- =====================
-- Côté manager
-- =====================
-- Gestion utilisateur
CREATE SEQUENCE seq_dg START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_manager START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_rh START WITH 1 INCREMENT BY 1;

-- Table Dg
CREATE TABLE Dg(
   id_dg VARCHAR(50) DEFAULT 'dg' || LPAD(NEXTVAL('seq_dg')::text, 6, '0'),
   email VARCHAR(500),
   mdp VARCHAR(500),
   PRIMARY KEY(id_dg)
);

-- Table Manager
CREATE TABLE Manager(
   idManager VARCHAR(50) DEFAULT 'MNGR' || LPAD(NEXTVAL('seq_manager')::text, 6, '0'),
   email VARCHAR(500),
   mdp VARCHAR(500),
   PRIMARY KEY(idManager)
);

-- Table RH
CREATE TABLE RH(
   idRh VARCHAR(50) DEFAULT 'RH' || LPAD(NEXTVAL('seq_rh')::text, 6, '0'),
   email VARCHAR(500),
   mdp VARCHAR(500),
   PRIMARY KEY(idRh)
);

-- =====================
-- Gestion annonce
CREATE SEQUENCE seq_departement START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_poste START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_contrat START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_besoin START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_besoinvalide START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_question START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_reponse START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_annonce START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_diplome START WITH 1 INCREMENT BY 1;

-- Table Diplome
CREATE TABLE Diplome(
   id_diplome VARCHAR(50) DEFAULT 'DPLM' || LPAD(NEXTVAL('seq_diplome')::text, 6, '0'),
   nomDiplome VARCHAR(50) NOT NULL UNIQUE,
   ranking INT,
   PRIMARY KEY(id_diplome)
);

-- Table Departement
CREATE TABLE Departement(
   id_departement VARCHAR(50) DEFAULT 'DPRTM' || LPAD(NEXTVAL('seq_departement')::text, 6, '0'),
   nomDepartement VARCHAR(250),
   PRIMARY KEY(id_departement)
);

-- Table Poste
CREATE TABLE Poste(
   idPoste VARCHAR(50) DEFAULT 'PSTE' || LPAD(NEXTVAL('seq_poste')::text, 6, '0'),
   nomPoste VARCHAR(250),
   id_departement VARCHAR(50) NOT NULL,
   PRIMARY KEY(idPoste),
   FOREIGN KEY(id_departement) REFERENCES Departement(id_departement)
);

-- Table Contrat
CREATE TABLE Contrat(
   idContrat VARCHAR(50) DEFAULT 'CNTR' || LPAD(NEXTVAL('seq_contrat')::text, 6, '0'),
   typeContrat VARCHAR(250),
   abreviation VARCHAR(50),
   PRIMARY KEY(idContrat)
);

-- Table Besoin
CREATE TABLE Besoin(
   idBesoin VARCHAR(50) DEFAULT 'BSN' || LPAD(NEXTVAL('seq_besoin')::text, 6, '0'),
   nombre_employe INT,
   description VARCHAR(500),
   annee_experience INT,
   dateBesoin DATE,
   idManager VARCHAR(50) NOT NULL,
   id_diplome VARCHAR(50) NOT NULL,
   idContrat VARCHAR(50) NOT NULL,
   idPoste VARCHAR(50) NOT NULL,
   PRIMARY KEY(idBesoin),
   FOREIGN KEY(idManager) REFERENCES Manager(idManager),
   FOREIGN KEY(id_diplome) REFERENCES Diplome(id_diplome),
   FOREIGN KEY(idContrat) REFERENCES Contrat(idContrat),
   FOREIGN KEY(idPoste) REFERENCES Poste(idPoste)
);

-- Table Besoin Valide
CREATE TABLE BesoinValide(
   idBesoinValide VARCHAR(50) DEFAULT 'BSNVLD' || LPAD(NEXTVAL('seq_besoinvalide')::text, 6, '0'),
   dateValidationRH DATE,
   checkRH BOOLEAN DEFAULT FALSE,
   averageNoteQcm INT,
   dateValidationDG DATE,
   checkDG BOOLEAN DEFAULT FALSE,
   statutPostulation BOOLEAN DEFAULT FALSE,
   idBesoin VARCHAR(50) NOT NULL,
   PRIMARY KEY(idBesoinValide),
   FOREIGN KEY(idBesoin) REFERENCES Besoin(idBesoin)
);

-- Table Question
CREATE TABLE Question(
   idQuestion VARCHAR(50) DEFAULT 'QSTN' || LPAD(NEXTVAL('seq_question')::text, 6, '0'),
   question TEXT NOT NULL UNIQUE,
   dateCreation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   idBesoin VARCHAR(50) NOT NULL,
   PRIMARY KEY(idQuestion),
   FOREIGN KEY(idBesoin) REFERENCES Besoin(idBesoin)
);

-- Table Reponse
CREATE TABLE Reponse(
   idReponse VARCHAR(50) DEFAULT 'RPNS' || LPAD(NEXTVAL('seq_reponse')::text, 6, '0'),
   reponse VARCHAR(500),
   vraiFaux BOOLEAN,
   idQuestion VARCHAR(50),
   PRIMARY KEY(idReponse),
   FOREIGN KEY(idQuestion) REFERENCES Question(idQuestion)
);

-- Table annonce
CREATE TABLE Annonce(
   idAnnonce VARCHAR(50) DEFAULT 'ANNC' || LPAD(NEXTVAL('seq_annonce')::text, 6, '0'),
   titre VARCHAR(50),
   datePublication DATE,
   idBesoin VARCHAR(50) NOT NULL UNIQUE,
   PRIMARY KEY(idAnnonce),
   FOREIGN KEY(idBesoin) REFERENCES Besoin(idBesoin)
);






-- =====================
-- Côté candidat
-- =====================
CREATE SEQUENCE seq_candidat START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_candidatrefuse START WITH 1 INCREMENT BY 1;

-- Table Candidat
CREATE TABLE Candidat(
   idCandidat VARCHAR(50) DEFAULT 'CDDT' || LPAD(NEXTVAL('seq_candidat')::text, 6, '0'),
   email VARCHAR(250) UNIQUE,
   nom VARCHAR(500) NOT NULL,
   prenom VARCHAR(500) NOT NULL,
   adresse VARCHAR(250) NOT NULL,
   dtn DATE NOT NULL,   
   id_diplome VARCHAR(50),
   renseignement VARCHAR(500),
   totalAnne_experience INT DEFAULT 0,
   file_path VARCHAR(500) NOT NULL,
   datePostulation DATE DEFAULT CURRENT_DATE,
   PRIMARY KEY(idCandidat),
   FOREIGN KEY(id_diplome) REFERENCES Diplome(id_diplome)
);

-- Table Candidat refuse
CREATE TABLE CandidatRefuse (
   idCandidatRefuse VARCHAR(50) DEFAULT 'RFS' || LPAD(NEXTVAL('seq_candidatrefuse')::text, 6, '0'),
   idCandidat VARCHAR(50) UNIQUE NOT NULL,
   libelle_etape VARCHAR(100),
   FOREIGN KEY(idCandidat) REFERENCES Candidat(idCandidat)
);

-- =====================
-- Gestion score QCM
CREATE SEQUENCE seq_noteqcm START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_entretien START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_essai START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_renouvellement START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_employe START WITH 1 INCREMENT BY 1;

-- Table NoteQcm
CREATE TABLE NoteQcm(
   idNoteQcm VARCHAR(50) DEFAULT 'NTQCM' || LPAD(NEXTVAL('seq_noteqcm')::text, 6, '0'),
   note DECIMAL(15,2),
   dateQcm DATE,
   idAnnonce VARCHAR(50) NOT NULL,
   idCandidat VARCHAR(50) NOT NULL,
   PRIMARY KEY(idNoteQcm),
   FOREIGN KEY(idAnnonce) REFERENCES Annonce(idAnnonce),
   FOREIGN KEY(idCandidat) REFERENCES Candidat(idCandidat)
);

-- Table Entretien
CREATE TABLE Entretien(
   idEntretien VARCHAR(50) DEFAULT 'ETRT' || LPAD(NEXTVAL('seq_entretien')::text, 6, '0'),
   date_entretien DATE,
   statut BOOLEAN,
   pretention DECIMAL(15,2),
   idCandidat VARCHAR(50) UNIQUE NOT NULL,
   PRIMARY KEY(idEntretien),
   FOREIGN KEY(idCandidat) REFERENCES Candidat(idCandidat)
);

-- Table Essai
CREATE TABLE Essai(
   idEssai VARCHAR(50) DEFAULT 'ESSAI' || LPAD(NEXTVAL('seq_essai')::text, 6, '0'),
   periode DATE,
   idCandidat VARCHAR(50) UNIQUE NOT NULL,
   PRIMARY KEY(idEssai),
   UNIQUE(idCandidat),
   FOREIGN KEY(idCandidat) REFERENCES Candidat(idCandidat)
);

-- Table Renouvellement
CREATE TABLE Renouvellement(
   idRenouvellement VARCHAR(50) DEFAULT 'RNVLMT' || LPAD(NEXTVAL('seq_renouvellement')::text, 6, '0'),
   periode INT,
   idCandidat VARCHAR(50) NOT NULL,
   PRIMARY KEY(idRenouvellement),
   UNIQUE(idCandidat),
   FOREIGN KEY(idCandidat) REFERENCES Candidat(idCandidat)
);

-- Table Employe
CREATE TABLE Employe(
   idEmploye VARCHAR(50) DEFAULT 'EMP' || LPAD(NEXTVAL('seq_employe')::text, 6, '0'),
   email VARCHAR(250) UNIQUE,
   nom VARCHAR(500) NOT NULL,
   prenom VARCHAR(500) NOT NULL,
   adresse VARCHAR(250) NOT NULL,
   dtn DATE NOT NULL,   
   date_embauche DATE NOT NULL,
   idPoste VARCHAR(50) UNIQUE NOT NULL,
   idCandidat VARCHAR(50) UNIQUE NOT NULL,
   PRIMARY KEY(idEmploye),
   FOREIGN KEY(idPoste) REFERENCES Poste(idPoste),
   FOREIGN KEY(idCandidat) REFERENCES Candidat(idCandidat)
);

