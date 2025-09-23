-- =====================
-- Côte candidat
-- =====================
-- Insertion pour la table diplome
INSERT INTO diplome (nomDiplome, ranking) VALUES ('CEPE', 1);
INSERT INTO diplome (nomDiplome, ranking) VALUES ('BEPC', 1);
INSERT INTO diplome (nomDiplome, ranking) VALUES ('BACC A1', 1);
INSERT INTO diplome (nomDiplome, ranking) VALUES ('BACC A2', 1);
INSERT INTO diplome (nomDiplome, ranking) VALUES ('BACC D', 1);
INSERT INTO diplome (nomDiplome, ranking) VALUES ('BACC C', 1);
INSERT INTO diplome (nomDiplome, ranking) VALUES ('BACC +1', 2);
INSERT INTO diplome (nomDiplome, ranking) VALUES ('BACC +2', 3);
INSERT INTO diplome (nomDiplome, ranking) VALUES ('LICENCE', 4);
INSERT INTO diplome (nomDiplome, ranking) VALUES ('MASTER', 5);
INSERT INTO diplome (nomDiplome, ranking) VALUES ('DOCTORAT', 6); 

    -- =====================
    -- Côte manager
    -- =====================
    -- Gestion utilisateur
    -- =========================
    -- Insertions pour DG
    -- =====================
    INSERT INTO Dg (email, mdp) VALUES ('dg1@app.work', '1234');
    INSERT INTO Dg (email, mdp) VALUES ('dg2@app.work', '1234');

    -- Insertions pour Manager
    INSERT INTO Manager (email, mdp) VALUES ('manager1@app.work', '1234');
    INSERT INTO Manager (email, mdp) VALUES ('manager2@app.work', '1234');

    -- Insertions pour RH
    INSERT INTO RH (email, mdp) VALUES ('rh1@app.work', '1234');
    INSERT INTO RH (email, mdp) VALUES ('rh2@app.work', '1234');

    -- =====================
    -- Gestion annonce
    -- =========================
    -- Insertions Departement
    -- =========================
    INSERT INTO Departement (nomDepartement) VALUES ('Ressources Humaines');
    INSERT INTO Departement (nomDepartement) VALUES ('Informatique');
    INSERT INTO Departement (nomDepartement) VALUES ('Finance & Comptabilite');
    INSERT INTO Departement (nomDepartement) VALUES ('Marketing');
    INSERT INTO Departement (nomDepartement) VALUES ('Commercial & Ventes');
    INSERT INTO Departement (nomDepartement) VALUES ('Production');
    INSERT INTO Departement (nomDepartement) VALUES ('Logistique');
    INSERT INTO Departement (nomDepartement) VALUES ('Juridique');
    INSERT INTO Departement (nomDepartement) VALUES ('Recherche & Developpement');
    INSERT INTO Departement (nomDepartement) VALUES ('Direction Generale');

    -- =========================
    -- Insertions Poste
    -- =========================
    INSERT INTO Poste (nomPoste, id_departement) VALUES ('Charge de Recrutement', (SELECT id_departement FROM Departement WHERE nomDepartement='Ressources Humaines'));
    INSERT INTO Poste (nomPoste, id_departement) VALUES ('Assistant RH', (SELECT id_departement FROM Departement WHERE nomDepartement='Ressources Humaines'));
    INSERT INTO Poste (nomPoste, id_departement) VALUES ('Developpeur Fullstack', (SELECT id_departement FROM Departement WHERE nomDepartement='Informatique'));
    INSERT INTO Poste (nomPoste, id_departement) VALUES ('Chef de Projet IT', (SELECT id_departement FROM Departement WHERE nomDepartement='Informatique'));
    INSERT INTO Poste (nomPoste, id_departement) VALUES ('Comptable', (SELECT id_departement FROM Departement WHERE nomDepartement='Finance & Comptabilite'));
    INSERT INTO Poste (nomPoste, id_departement) VALUES ('Tresorier', (SELECT id_departement FROM Departement WHERE nomDepartement='Finance & Comptabilite'));
    INSERT INTO Poste (nomPoste, id_departement) VALUES ('Responsable Marketing', (SELECT id_departement FROM Departement WHERE nomDepartement='Marketing'));
    INSERT INTO Poste (nomPoste, id_departement) VALUES ('Charge de Communication', (SELECT id_departement FROM Departement WHERE nomDepartement='Marketing'));
    INSERT INTO Poste (nomPoste, id_departement) VALUES ('Representant Commercial', (SELECT id_departement FROM Departement WHERE nomDepartement='Commercial & Ventes'));
    INSERT INTO Poste (nomPoste, id_departement) VALUES ('Assistant Commercial', (SELECT id_departement FROM Departement WHERE nomDepartement='Commercial & Ventes'));
    INSERT INTO Poste (nomPoste, id_departement) VALUES ('Superviseur Atelier', (SELECT id_departement FROM Departement WHERE nomDepartement='Production'));
    INSERT INTO Poste (nomPoste, id_departement) VALUES ('Operateur Machine', (SELECT id_departement FROM Departement WHERE nomDepartement='Production'));
    INSERT INTO Poste (nomPoste, id_departement) VALUES ('Gestionnaire Stock', (SELECT id_departement FROM Departement WHERE nomDepartement='Logistique'));
    INSERT INTO Poste (nomPoste, id_departement) VALUES ('Chauffeur-Livreur', (SELECT id_departement FROM Departement WHERE nomDepartement='Logistique'));
    INSERT INTO Poste (nomPoste, id_departement) VALUES ('Avocat Interne', (SELECT id_departement FROM Departement WHERE nomDepartement='Juridique'));
    INSERT INTO Poste (nomPoste, id_departement) VALUES ('Conseiller Juridique', (SELECT id_departement FROM Departement WHERE nomDepartement='Juridique'));
    INSERT INTO Poste (nomPoste, id_departement) VALUES ('Analyste Innovation', (SELECT id_departement FROM Departement WHERE nomDepartement='Recherche & Developpement'));
    INSERT INTO Poste (nomPoste, id_departement) VALUES ('Technicien de Laboratoire', (SELECT id_departement FROM Departement WHERE nomDepartement='Recherche & Developpement'));
    INSERT INTO Poste (nomPoste, id_departement) VALUES ('Secretaire de Direction', (SELECT id_departement FROM Departement WHERE nomDepartement='Direction Generale'));
    INSERT INTO Poste (nomPoste, id_departement) VALUES ('Conseiller Strategique', (SELECT id_departement FROM Departement WHERE nomDepartement='Direction Generale'));

    -- Insertions pour la table Contrat
    INSERT INTO Contrat (typeContrat, abreviation) VALUES 
    ('Contrat a Duree Indeterminee', 'CDI'),
    ('Contrat a Duree Determinee', 'CDD'),
    ('Contrat de Stage', 'STG'),
    ('Contrat d''Apprentissage', 'APP'),
    ('Contrat de Freelance', 'FRL');

INSERT INTO Candidat (
    email, 
    nom, 
    prenom, 
    adresse, 
    dtn, 
    id_diplome, 
    renseignement, 
    totalAnne_experience, 
    file_path
) 
VALUES (
    'test@email.com',
    'Dupont',
    'Jean',
    '123 Rue de Paris, 75001 Paris',
    '1990-05-15',
    'DPLM000011',  -- ou remplacez par un id_diplome existant si nécessaire
    'Candidature spontanée',
    5,
    '/chemin/vers/cv_jean_dupont.pdf'
);