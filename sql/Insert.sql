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




-- Insertions Postes
-- =========================
-- Ressources Humaines
-- =========================
-- Poste : Charge de Recrutement
-- =========================

-- Questions pour Charge de Recrutement
-- =========================
-- Question 1
INSERT INTO Question (question) VALUES ('Quelle est la principale mission d''un Charge de Recrutement ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Identifier et attirer les candidats adaptes aux postes', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle est la principale mission d''un Charge de Recrutement ?')),
('Gerer la paie des employes', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle est la principale mission d''un Charge de Recrutement ?')),
('Organiser les evenements marketing', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle est la principale mission d''un Charge de Recrutement ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle est la principale mission d''un Charge de Recrutement ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Charge de Recrutement'));

-- Question 2
INSERT INTO Question (question) VALUES ('Quel outil est le plus utilise pour diffuser une offre d''emploi ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Les sites d''emploi et reseaux sociaux professionnels', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel outil est le plus utilise pour diffuser une offre d''emploi ?')),
('Les notes internes manuscrites', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel outil est le plus utilise pour diffuser une offre d''emploi ?')),
('Les appels telephoniques massifs aux clients', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel outil est le plus utilise pour diffuser une offre d''emploi ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel outil est le plus utilise pour diffuser une offre d''emploi ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Charge de Recrutement'));

-- Question 3
INSERT INTO Question (question) VALUES ('Quelle etape suit immediatement la reception des candidatures ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Le tri et la selection des CV pertinents', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle etape suit immediatement la reception des candidatures ?')),
('La signature du contrat de travail', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle etape suit immediatement la reception des candidatures ?')),
('L''organisation de la fête annuelle de l''entreprise', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle etape suit immediatement la reception des candidatures ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle etape suit immediatement la reception des candidatures ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Charge de Recrutement'));

-- Question 4
INSERT INTO Question (question) VALUES ('Quel critère est essentiel pour selectionner un candidat ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Les competences et experiences correspondant au poste', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel critère est essentiel pour selectionner un candidat ?')),
('La couleur des yeux du candidat', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel critère est essentiel pour selectionner un candidat ?')),
('Le nombre d''amis sur les reseaux sociaux', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel critère est essentiel pour selectionner un candidat ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel critère est essentiel pour selectionner un candidat ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Charge de Recrutement'));

-- Question 5
INSERT INTO Question (question) VALUES ('Quel type d''entretien est couramment utilise pour evaluer un candidat ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Entretien structure ou semi-structure', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel type d''entretien est couramment utilise pour evaluer un candidat ?')),
('Seance de karaoke', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel type d''entretien est couramment utilise pour evaluer un candidat ?')),
('Test de rapidite à la course', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel type d''entretien est couramment utilise pour evaluer un candidat ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel type d''entretien est couramment utilise pour evaluer un candidat ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Charge de Recrutement'));

-- =========================
-- Poste : Assistant RH
-- =========================
ions pour Assistant RH
-- =========================
-- Question 1
INSERT INTO Question (question) VALUES ('Quel est le rôle principal d''un Assistant RH ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Assister le Responsable RH dans la gestion administrative du personnel', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Assistant RH ?')),
('Definir la strategie commerciale de l''entreprise', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Assistant RH ?')),
('Gerer uniquement les stocks de l''entreprise', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Assistant RH ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Assistant RH ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Assistant RH'));

-- Question 2
INSERT INTO Question (question) VALUES ('Quel document l''Assistant RH doit-il souvent preparer ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Les contrats de travail et les attestations d''emploi', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel document l''Assistant RH doit-il souvent preparer ?')),
('Les plans marketing', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel document l''Assistant RH doit-il souvent preparer ?')),
('Les rapports meteorologiques', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel document l''Assistant RH doit-il souvent preparer ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel document l''Assistant RH doit-il souvent preparer ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Assistant RH'));

-- Question 3
INSERT INTO Question (question) VALUES ('Quel logiciel est couramment utilise par un Assistant RH ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Logiciel de gestion du personnel ou SIRH', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel logiciel est couramment utilise par un Assistant RH ?')),
('Logiciel de montage video', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel logiciel est couramment utilise par un Assistant RH ?')),
('Logiciel de retouche photo', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel logiciel est couramment utilise par un Assistant RH ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel logiciel est couramment utilise par un Assistant RH ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Assistant RH'));

-- Question 4
INSERT INTO Question (question) VALUES ('Quelle est l''une des tâches administratives principales ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Mettre à jour les dossiers des employes et gerer les absences', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle est l''une des tâches administratives principales ?')),
('Realiser des campagnes publicitaires', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle est l''une des tâches administratives principales ?')),
('Preparer les menus du restaurant de l''entreprise', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle est l''une des tâches administratives principales ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle est l''une des tâches administratives principales ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Assistant RH'));

-- Question 5
INSERT INTO Question (question) VALUES ('Comment l''Assistant RH peut-il aider lors du recrutement ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('En organisant les entretiens et en communiquant avec les candidats', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Comment l''Assistant RH peut-il aider lors du recrutement ?')),
('En concevant le site web de l''entreprise', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Comment l''Assistant RH peut-il aider lors du recrutement ?')),
('En gerant la comptabilite clients', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Comment l''Assistant RH peut-il aider lors du recrutement ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Comment l''Assistant RH peut-il aider lors du recrutement ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Assistant RH'));


-- =========================
-- Informatique
-- =========================
-- Poste : Developpeur Fullstack
-- =========================
stions pour Developpeur Fullstack
-- Poste : Developpeur Fullstack
-- =========================
-- Question 1
INSERT INTO Question (question) VALUES ('Quel langage est couramment utilise pour le developpement frontend ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('JavaScript', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel langage est couramment utilise pour le developpement frontend ?')),
('Python', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel langage est couramment utilise pour le developpement frontend ?')),
('SQL', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel langage est couramment utilise pour le developpement frontend ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel langage est couramment utilise pour le developpement frontend ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Developpeur Fullstack'));

-- Question 2
INSERT INTO Question (question) VALUES ('Quel framework backend est souvent utilise pour construire des APIs en Node.js ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Express.js', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel framework backend est souvent utilise pour construire des APIs en Node.js ?')),
('React', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel framework backend est souvent utilise pour construire des APIs en Node.js ?')),
('Bootstrap', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel framework backend est souvent utilise pour construire des APIs en Node.js ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel framework backend est souvent utilise pour construire des APIs en Node.js ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Developpeur Fullstack'));

-- Question 3
INSERT INTO Question (question) VALUES ('Quelle base de donnees est souvent utilisee pour les applications web modernes ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('PostgreSQL', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle base de donnees est souvent utilisee pour les applications web modernes ?')),
('Photoshop', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle base de donnees est souvent utilisee pour les applications web modernes ?')),
('Excel', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle base de donnees est souvent utilisee pour les applications web modernes ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle base de donnees est souvent utilisee pour les applications web modernes ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Developpeur Fullstack'));

-- Question 4
INSERT INTO Question (question) VALUES ('Quel concept permet de separer le code frontend et backend ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Architecture client-serveur', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel concept permet de separer le code frontend et backend ?')),
('Gestion des ressources humaines', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel concept permet de separer le code frontend et backend ?')),
('Strategie marketing', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel concept permet de separer le code frontend et backend ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel concept permet de separer le code frontend et backend ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Developpeur Fullstack'));

-- Question 5
INSERT INTO Question (question) VALUES ('Quel outil est utilise pour le contrôle de version du code source ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Git', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel outil est utilise pour le contrôle de version du code source ?')),
('Slack', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel outil est utilise pour le contrôle de version du code source ?')),
('Trello', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel outil est utilise pour le contrôle de version du code source ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel outil est utilise pour le contrôle de version du code source ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Developpeur Fullstack'));

-- =========================
-- Poste : Chef de Projet IT
-- =========================
ns pour Chef de Projet IT
-- =========================
-- Question 1
INSERT INTO Question (question) VALUES ('Quel est le rôle principal d''un Chef de Projet IT ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Planifier, coordonner et superviser les projets IT', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Chef de Projet IT ?')),
('Developper uniquement le code backend', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Chef de Projet IT ?')),
('Gerer le marketing digital de l''entreprise', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Chef de Projet IT ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Chef de Projet IT ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Chef de Projet IT'));

-- Question 2
INSERT INTO Question (question) VALUES ('Quel outil est souvent utilise pour gerer les tâches et le suivi d''un projet IT ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Jira', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel outil est souvent utilise pour gerer les tâches et le suivi d''un projet IT ?')),
('Photoshop', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel outil est souvent utilise pour gerer les tâches et le suivi d''un projet IT ?')),
('Excel uniquement pour les budgets', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel outil est souvent utilise pour gerer les tâches et le suivi d''un projet IT ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel outil est souvent utilise pour gerer les tâches et le suivi d''un projet IT ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Chef de Projet IT'));

-- Question 3
INSERT INTO Question (question) VALUES ('Quelle methodologie agile est souvent utilisee pour les projets IT ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Scrum', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle methodologie agile est souvent utilisee pour les projets IT ?')),
('Waterfall', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle methodologie agile est souvent utilisee pour les projets IT ?')),
('Lean Manufacturing', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle methodologie agile est souvent utilisee pour les projets IT ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle methodologie agile est souvent utilisee pour les projets IT ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Chef de Projet IT'));

-- Question 4
INSERT INTO Question (question) VALUES ('Quel document decrit les exigences et objectifs d''un projet IT ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Cahier des charges', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel document decrit les exigences et objectifs d''un projet IT ?')),
('Plan marketing', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel document decrit les exigences et objectifs d''un projet IT ?')),
('Rapport financier', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel document decrit les exigences et objectifs d''un projet IT ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel document decrit les exigences et objectifs d''un projet IT ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Chef de Projet IT'));

-- Question 5
INSERT INTO Question (question) VALUES ('Quel indicateur permet de mesurer l''avancement d''un projet IT ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Diagramme de Gantt', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel indicateur permet de mesurer l''avancement d''un projet IT ?')),
('Word Cloud', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel indicateur permet de mesurer l''avancement d''un projet IT ?')),
('Budget mensuel', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel indicateur permet de mesurer l''avancement d''un projet IT ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel indicateur permet de mesurer l''avancement d''un projet IT ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Chef de Projet IT'));



-- =========================
-- Finance & Comptabilite
-- =========================
-- Poste : Comptable
-- =========================
ions pour Comptable
-- =========================
-- Question 1
INSERT INTO Question (question) VALUES ('Quel est le rôle principal d''un comptable ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Tenir la comptabilite et produire les etats financiers', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un comptable ?')),
('Gerer le recrutement du personnel', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un comptable ?')),
('Superviser les projets IT', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un comptable ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un comptable ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Comptable'));

-- Question 2
INSERT INTO Question (question) VALUES ('Quel document comptable sert à suivre les entrees et sorties d''argent ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Journal comptable', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel document comptable sert à suivre les entrees et sorties d''argent ?')),
('Plan marketing', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel document comptable sert à suivre les entrees et sorties d''argent ?')),
('Diagramme de Gantt', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel document comptable sert à suivre les entrees et sorties d''argent ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel document comptable sert à suivre les entrees et sorties d''argent ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Comptable'));

-- Question 3
INSERT INTO Question (question) VALUES ('Quelle norme comptable doit être respectee dans les etats financiers ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Normes IFRS', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle norme comptable doit être respectee dans les etats financiers ?')),
('Methode Scrum', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle norme comptable doit être respectee dans les etats financiers ?')),
('Lean Management', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle norme comptable doit être respectee dans les etats financiers ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle norme comptable doit être respectee dans les etats financiers ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Comptable'));

-- Question 4
INSERT INTO Question (question) VALUES ('Quel logiciel est souvent utilise pour la comptabilite en entreprise ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Sage', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel logiciel est souvent utilise pour la comptabilite en entreprise ?')),
('Photoshop', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel logiciel est souvent utilise pour la comptabilite en entreprise ?')),
('Visual Studio Code', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel logiciel est souvent utilise pour la comptabilite en entreprise ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel logiciel est souvent utilise pour la comptabilite en entreprise ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Comptable'));

-- Question 5
INSERT INTO Question (question) VALUES ('Quelle tâche relève d''un comptable ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Preparer la declaration fiscale de l''entreprise', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle tâche relève d''un comptable ?')),
('Organiser les entretiens d''embauche', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle tâche relève d''un comptable ?')),
('Developper l''application mobile de l''entreprise', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle tâche relève d''un comptable ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle tâche relève d''un comptable ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Comptable'));

-- =========================
-- Poste : Tresorier
-- =========================
ions pour Tresorier
-- =========================
-- Question 1
INSERT INTO Question (question) VALUES ('Quel est le rôle principal d''un Tresorier ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Gerer la tresorerie et la liquidite de l''entreprise', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Tresorier ?')),
('Superviser les recrutements RH', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Tresorier ?')),
('Definir la strategie marketing', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Tresorier ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Tresorier ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Tresorier'));

-- Question 2
INSERT INTO Question (question) VALUES ('Quel document permet de suivre les flux de tresorerie ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Plan de tresorerie', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel document permet de suivre les flux de tresorerie ?')),
('Journal des entretiens', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel document permet de suivre les flux de tresorerie ?')),
('Rapport marketing', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel document permet de suivre les flux de tresorerie ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel document permet de suivre les flux de tresorerie ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Tresorier'));

-- Question 3
INSERT INTO Question (question) VALUES ('Quelle operation relève directement du Tresorier ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Optimiser la gestion des liquidites et financements', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle operation relève directement du Tresorier ?')),
('Planifier les campagnes de recrutement', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle operation relève directement du Tresorier ?')),
('Gerer le developpement logiciel', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle operation relève directement du Tresorier ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle operation relève directement du Tresorier ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Tresorier'));

-- Question 4
INSERT INTO Question (question) VALUES ('Quel logiciel est souvent utilise pour la gestion de tresorerie ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('SAP Treasury', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel logiciel est souvent utilise pour la gestion de tresorerie ?')),
('Photoshop', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel logiciel est souvent utilise pour la gestion de tresorerie ?')),
('Visual Studio', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel logiciel est souvent utilise pour la gestion de tresorerie ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel logiciel est souvent utilise pour la gestion de tresorerie ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Tresorier'));

-- Question 5
INSERT INTO Question (question) VALUES ('Quelle tâche quotidienne relève du Tresorier ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Suivre les encaissements et decaissements', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle tâche quotidienne relève du Tresorier ?')),
('Organiser les entretiens d''embauche', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle tâche quotidienne relève du Tresorier ?')),
('Developper les applications internes', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle tâche quotidienne relève du Tresorier ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle tâche quotidienne relève du Tresorier ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Tresorier'));



-- =========================
-- Marketing
-- =========================
-- Poste : Responsable Marketing
-- =========================
ons pour Responsable Marketing
-- =========================
-- Question 1
INSERT INTO Question (question) VALUES ('Quel est le rôle principal d''un Responsable Marketing ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Definir et mettre en œuvre la strategie marketing de l''entreprise', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Responsable Marketing ?')),
('Gerer uniquement la tresorerie de l''entreprise', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Responsable Marketing ?')),
('Recruter le personnel informatique', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Responsable Marketing ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Responsable Marketing ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Responsable Marketing'));

-- Question 2
INSERT INTO Question (question) VALUES ('Quel outil est le plus utilise pour analyser les performances marketing ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Google Analytics', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel outil est le plus utilise pour analyser les performances marketing ?')),
('SAP Treasury', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel outil est le plus utilise pour analyser les performances marketing ?')),
('Microsoft Word', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel outil est le plus utilise pour analyser les performances marketing ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel outil est le plus utilise pour analyser les performances marketing ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Responsable Marketing'));

-- Question 3
INSERT INTO Question (question) VALUES ('Quelle strategie est essentielle pour attirer de nouveaux clients ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Strategie de communication ciblee et campagnes publicitaires', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle strategie est essentielle pour attirer de nouveaux clients ?')),
('Optimiser les flux de tresorerie', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle strategie est essentielle pour attirer de nouveaux clients ?')),
('Gerer les entretiens RH', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle strategie est essentielle pour attirer de nouveaux clients ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle strategie est essentielle pour attirer de nouveaux clients ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Responsable Marketing'));

-- Question 4
INSERT INTO Question (question) VALUES ('Quel indicateur mesure l''efficacite d''une campagne marketing ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Taux de conversion', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel indicateur mesure l''efficacite d''une campagne marketing ?')),
('Nombre de recrutements RH', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel indicateur mesure l''efficacite d''une campagne marketing ?')),
('Liquidite de l''entreprise', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel indicateur mesure l''efficacite d''une campagne marketing ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel indicateur mesure l''efficacite d''une campagne marketing ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Responsable Marketing'));

-- Question 5
INSERT INTO Question (question) VALUES ('Quelle tâche relève directement du Responsable Marketing ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Analyser le marche et proposer des campagnes adaptees', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle tâche relève directement du Responsable Marketing ?')),
('Superviser les flux financiers', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle tâche relève directement du Responsable Marketing ?')),
('Developper le site web de l''entreprise', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle tâche relève directement du Responsable Marketing ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle tâche relève directement du Responsable Marketing ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Responsable Marketing'));

-- =========================
-- Poste : Charge de Communication
-- =========================
tions pour Charge de Communication
-- =========================
-- Question 1
INSERT INTO Question (question) VALUES ('Quel est le rôle principal d''un Charge de Communication ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Gerer la communication interne et externe de l''entreprise', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Charge de Communication ?')),
('Superviser uniquement la comptabilite', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Charge de Communication ?')),
('Recruter le personnel technique', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Charge de Communication ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Charge de Communication ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Charge de Communication'));

-- Question 2
INSERT INTO Question (question) VALUES ('Quel outil est essentiel pour planifier une campagne de communication digitale ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Hootsuite ou Buffer', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel outil est essentiel pour planifier une campagne de communication digitale ?')),
('Excel pour la comptabilite', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel outil est essentiel pour planifier une campagne de communication digitale ?')),
('SAP Treasury', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel outil est essentiel pour planifier une campagne de communication digitale ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel outil est essentiel pour planifier une campagne de communication digitale ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Charge de Communication'));

-- Question 3
INSERT INTO Question (question) VALUES ('Quelle competence est essentielle pour un Charge de Communication ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Maîtriser les outils de communication digitale et redactionnelle', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle competence est essentielle pour un Charge de Communication ?')),
('Analyser les bilans financiers', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle competence est essentielle pour un Charge de Communication ?')),
('Gerer les recrutements RH', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle competence est essentielle pour un Charge de Communication ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle competence est essentielle pour un Charge de Communication ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Charge de Communication'));

-- Question 4
INSERT INTO Question (question) VALUES ('Quel indicateur permet de mesurer l''efficacite d''une campagne de communication ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Le taux d''engagement et la portee des publications', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel indicateur permet de mesurer l''efficacite d''une campagne de communication ?')),
('Le nombre de recrutements RH', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel indicateur permet de mesurer l''efficacite d''une campagne de communication ?')),
('Le chiffre d''affaires comptable', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel indicateur permet de mesurer l''efficacite d''une campagne de communication ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel indicateur permet de mesurer l''efficacite d''une campagne de communication ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Charge de Communication'));

-- Question 5
INSERT INTO Question (question) VALUES ('Quelle tâche relève directement du Charge de Communication ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Rediger les communiques et gerer les reseaux sociaux', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle tâche relève directement du Charge de Communication ?')),
('Superviser la comptabilite de l''entreprise', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle tâche relève directement du Charge de Communication ?')),
('Developper le site web interne', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle tâche relève directement du Charge de Communication ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle tâche relève directement du Charge de Communication ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Charge de Communication'));


-- =========================
-- Commercial & Ventes
-- =========================
-- Poste : Representant Commercial
-- =========================
==
-- Questions pour Representant Commercial
-- =========================
-- Question 1
INSERT INTO Question (question) VALUES ('Quel est le rôle principal d''un Representant Commercial ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Promouvoir et vendre les produits ou services de l''entreprise', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Representant Commercial ?')),
('Gerer uniquement les ressources humaines', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Representant Commercial ?')),
('Superviser la comptabilite de l''entreprise', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Representant Commercial ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Representant Commercial ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Representant Commercial'));

-- Question 2
INSERT INTO Question (question) VALUES ('Quel indicateur mesure la performance d''un Representant Commercial ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Le chiffre d''affaires genere et le nombre de clients acquis', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel indicateur mesure la performance d''un Representant Commercial ?')),
('Le nombre de publications sur les reseaux sociaux', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel indicateur mesure la performance d''un Representant Commercial ?')),
('Le volume des dossiers RH traites', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel indicateur mesure la performance d''un Representant Commercial ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel indicateur mesure la performance d''un Representant Commercial ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Representant Commercial'));

-- Question 3
INSERT INTO Question (question) VALUES ('Quelle competence est essentielle pour un Representant Commercial ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Avoir de bonnes capacites de negociation et de communication', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle competence est essentielle pour un Representant Commercial ?')),
('Maîtriser les logiciels de comptabilite uniquement', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle competence est essentielle pour un Representant Commercial ?')),
('Gerer le recrutement du personnel', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle competence est essentielle pour un Representant Commercial ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle competence est essentielle pour un Representant Commercial ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Representant Commercial'));

-- Question 4
INSERT INTO Question (question) VALUES ('Quelle tâche relève directement du Representant Commercial ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Contacter les clients et conclure des ventes', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle tâche relève directement du Representant Commercial ?')),
('Rediger les contrats RH', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle tâche relève directement du Representant Commercial ?')),
('Superviser la maintenance informatique', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle tâche relève directement du Representant Commercial ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle tâche relève directement du Representant Commercial ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Representant Commercial'));

-- Question 5
INSERT INTO Question (question) VALUES ('Quel outil est utilise par un Representant Commercial pour suivre ses ventes ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Un CRM comme Salesforce ou HubSpot', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel outil est utilise par un Representant Commercial pour suivre ses ventes ?')),
('Un logiciel de PAO pour creer des visuels', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel outil est utilise par un Representant Commercial pour suivre ses ventes ?')),
('Un tableur pour gerer les salaires RH', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel outil est utilise par un Representant Commercial pour suivre ses ventes ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel outil est utilise par un Representant Commercial pour suivre ses ventes ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Representant Commercial'));

-- =========================
-- Poste : Assistant Commercial
-- =========================
-- Questions pour Assistant Commercial
-- =========================
-- Question 1
INSERT INTO Question (question) VALUES ('Quel est le rôle principal d''un Assistant Commercial ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Supporter l''equipe commerciale dans le suivi des clients et des commandes', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Assistant Commercial ?')),
('Gerer uniquement le recrutement du personnel', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Assistant Commercial ?')),
('Superviser la comptabilite de l''entreprise', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Assistant Commercial ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Assistant Commercial ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Assistant Commercial'));

-- Question 2
INSERT INTO Question (question) VALUES ('Quelle tâche quotidienne effectue un Assistant Commercial ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Mettre à jour les informations clients et preparer les commandes', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle tâche quotidienne effectue un Assistant Commercial ?')),
('Rediger les contrats RH', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle tâche quotidienne effectue un Assistant Commercial ?')),
('Developper des applications web', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle tâche quotidienne effectue un Assistant Commercial ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle tâche quotidienne effectue un Assistant Commercial ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Assistant Commercial'));

-- Question 3
INSERT INTO Question (question) VALUES ('Quel outil est souvent utilise par un Assistant Commercial ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Un logiciel de gestion commerciale ou un CRM', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel outil est souvent utilise par un Assistant Commercial ?')),
('Un logiciel de PAO pour creer des visuels marketing', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel outil est souvent utilise par un Assistant Commercial ?')),
('Un logiciel de gestion de paie RH', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel outil est souvent utilise par un Assistant Commercial ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel outil est souvent utilise par un Assistant Commercial ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Assistant Commercial'));

-- Question 4
INSERT INTO Question (question) VALUES ('Quelle competence est essentielle pour un Assistant Commercial ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Organisation et communication pour gerer efficacement les clients et commandes', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle competence est essentielle pour un Assistant Commercial ?')),
('Maîtrise des reseaux sociaux uniquement', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle competence est essentielle pour un Assistant Commercial ?')),
('Competences avancees en comptabilite', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle competence est essentielle pour un Assistant Commercial ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle competence est essentielle pour un Assistant Commercial ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Assistant Commercial'));

-- Question 5
INSERT INTO Question (question) VALUES ('Quel type de rapport un Assistant Commercial peut-il preparer ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Rapports de ventes, suivi des commandes et tableau de performance clients', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel type de rapport un Assistant Commercial peut-il preparer ?')),
('Rapports RH sur les conges et absences', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel type de rapport un Assistant Commercial peut-il preparer ?')),
('Rapports financiers de la tresorerie', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel type de rapport un Assistant Commercial peut-il preparer ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel type de rapport un Assistant Commercial peut-il preparer ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Assistant Commercial'));


-- =========================
-- Production
-- =========================
-- Poste : Superviseur Atelier
-- =========================
ns pour Superviseur Atelier
-- =========================
-- Question 1
INSERT INTO Question (question) VALUES ('Quel est le rôle principal d''un Superviseur Atelier ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Coordonner les operations de production et superviser les equipes', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Superviseur Atelier ?')),
('Gerer la comptabilite de l''entreprise', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Superviseur Atelier ?')),
('Definir la strategie marketing', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Superviseur Atelier ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Superviseur Atelier ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Superviseur Atelier'));

-- Question 2
INSERT INTO Question (question) VALUES ('Quelle tâche quotidienne effectue un Superviseur Atelier ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Suivi des operations de production et gestion des equipes', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle tâche quotidienne effectue un Superviseur Atelier ?')),
('Gerer les campagnes publicitaires', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle tâche quotidienne effectue un Superviseur Atelier ?')),
('Realiser des audits financiers', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle tâche quotidienne effectue un Superviseur Atelier ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle tâche quotidienne effectue un Superviseur Atelier ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Superviseur Atelier'));

-- Question 3
INSERT INTO Question (question) VALUES ('Quel outil est souvent utilise par un Superviseur Atelier ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Logiciels de planification et suivi de production', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel outil est souvent utilise par un Superviseur Atelier ?')),
('Logiciels de gestion de paie', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel outil est souvent utilise par un Superviseur Atelier ?')),
('Logiciels de design graphique', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel outil est souvent utilise par un Superviseur Atelier ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel outil est souvent utilise par un Superviseur Atelier ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Superviseur Atelier'));

-- Question 4
INSERT INTO Question (question) VALUES ('Quelle competence est essentielle pour un Superviseur Atelier ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Organisation et leadership pour gerer efficacement les equipes de production', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle competence est essentielle pour un Superviseur Atelier ?')),
('Maîtrise des reseaux sociaux uniquement', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle competence est essentielle pour un Superviseur Atelier ?')),
('Competences avancees en comptabilite', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle competence est essentielle pour un Superviseur Atelier ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle competence est essentielle pour un Superviseur Atelier ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Superviseur Atelier'));

-- Question 5
INSERT INTO Question (question) VALUES ('Quel type de rapport un Superviseur Atelier peut-il preparer ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Rapports de production, suivi des performances et gestion des equipes', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel type de rapport un Superviseur Atelier peut-il preparer ?')),
('Rapports RH sur les conges et absences', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel type de rapport un Superviseur Atelier peut-il preparer ?')),
('Rapports financiers de la tresorerie', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel type de rapport un Superviseur Atelier peut-il preparer ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel type de rapport un Superviseur Atelier peut-il preparer ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Superviseur Atelier'));

-- =========================
-- Poste : Operateur Machine
-- =========================
 pour Operateur Machine
-- =========================
-- Question 1
INSERT INTO Question (question) VALUES ('Quelle est la principale responsabilite d''un Operateur Machine ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Assurer le fonctionnement correct et la maintenance de la machine', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle est la principale responsabilite d''un Operateur Machine ?')),
('Superviser les equipes de production', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle est la principale responsabilite d''un Operateur Machine ?')),
('Elaborer la strategie marketing', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle est la principale responsabilite d''un Operateur Machine ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle est la principale responsabilite d''un Operateur Machine ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Operateur Machine'));

-- Question 2
INSERT INTO Question (question) VALUES ('Quelle precaution de securite doit respecter un Operateur Machine ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Porter les equipements de protection individuelle et suivre les procedures de securite', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle precaution de securite doit respecter un Operateur Machine ?')),
('Ignorer les protocoles de securite', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle precaution de securite doit respecter un Operateur Machine ?')),
('Definir les plannings RH', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle precaution de securite doit respecter un Operateur Machine ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle precaution de securite doit respecter un Operateur Machine ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Operateur Machine'));

-- Question 3
INSERT INTO Question (question) VALUES ('Comment un Operateur Machine peut-il verifier le bon fonctionnement de la machine ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Effectuer des contrôles reguliers et signaler les anomalies', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Comment un Operateur Machine peut-il verifier le bon fonctionnement de la machine ?')),
('Modifier les horaires des employes', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Comment un Operateur Machine peut-il verifier le bon fonctionnement de la machine ?')),
('Gerer la tresorerie de l''entreprise', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Comment un Operateur Machine peut-il verifier le bon fonctionnement de la machine ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Comment un Operateur Machine peut-il verifier le bon fonctionnement de la machine ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Operateur Machine'));

-- Question 4
INSERT INTO Question (question) VALUES ('Quelle competence technique est essentielle pour un Operateur Machine ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Connaissance des machines et reglages precis', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle competence technique est essentielle pour un Operateur Machine ?')),
('Maîtrise des logiciels de marketing', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle competence technique est essentielle pour un Operateur Machine ?')),
('Expertise en gestion RH', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle competence technique est essentielle pour un Operateur Machine ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle competence technique est essentielle pour un Operateur Machine ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Operateur Machine'));

-- Question 5
INSERT INTO Question (question) VALUES ('Que doit faire un Operateur Machine en cas de panne ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Arrêter la machine et prevenir le responsable pour maintenance', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Que doit faire un Operateur Machine en cas de panne ?')),
('Continuer à utiliser la machine normalement', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Que doit faire un Operateur Machine en cas de panne ?')),
('Ecrire un rapport marketing', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Que doit faire un Operateur Machine en cas de panne ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Que doit faire un Operateur Machine en cas de panne ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Operateur Machine'));



-- =========================
-- Logistique
-- =========================
-- Poste : Gestionnaire Stock
-- =========================
s pour Gestionnaire Stock
-- =========================
-- Question 1
INSERT INTO Question (question) VALUES ('Quelle est la principale responsabilite d''un Gestionnaire Stock ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Gerer les entrees et sorties de stock et assurer leur traçabilite', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle est la principale responsabilite d''un Gestionnaire Stock ?')),
('Gerer uniquement la comptabilite de l''entreprise', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle est la principale responsabilite d''un Gestionnaire Stock ?')),
('Elaborer la strategie marketing', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle est la principale responsabilite d''un Gestionnaire Stock ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle est la principale responsabilite d''un Gestionnaire Stock ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Gestionnaire Stock'));

-- Question 2
INSERT INTO Question (question) VALUES ('Quelle methode est utilisee pour organiser le stock ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('FIFO ou LIFO selon les produits', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle methode est utilisee pour organiser le stock ?')),
('En stockant tout sans ordre', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle methode est utilisee pour organiser le stock ?')),
('En laissant le stock aux employes sans contrôle', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle methode est utilisee pour organiser le stock ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle methode est utilisee pour organiser le stock ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Gestionnaire Stock'));

-- Question 3
INSERT INTO Question (question) VALUES ('Comment le Gestionnaire Stock verifie-t-il la quantite reelle ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('En effectuant des inventaires reguliers', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Comment le Gestionnaire Stock verifie-t-il la quantite reelle ?')),
('En demandant au service marketing de le faire', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Comment le Gestionnaire Stock verifie-t-il la quantite reelle ?')),
('En ignorant les ecarts de stock', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Comment le Gestionnaire Stock verifie-t-il la quantite reelle ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Comment le Gestionnaire Stock verifie-t-il la quantite reelle ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Gestionnaire Stock'));

-- Question 4
INSERT INTO Question (question) VALUES ('Quelle competence technique est essentielle pour un Gestionnaire Stock ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Maîtriser les logiciels de gestion de stock et les procedures logistiques', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle competence technique est essentielle pour un Gestionnaire Stock ?')),
('Savoir rediger des contrats commerciaux', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle competence technique est essentielle pour un Gestionnaire Stock ?')),
('Etre expert en design graphique', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle competence technique est essentielle pour un Gestionnaire Stock ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle competence technique est essentielle pour un Gestionnaire Stock ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Gestionnaire Stock'));

-- Question 5
INSERT INTO Question (question) VALUES ('Que doit faire un Gestionnaire Stock en cas de rupture de stock ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Informer le service achats et planifier un reapprovisionnement', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Que doit faire un Gestionnaire Stock en cas de rupture de stock ?')),
('Ignorer le problème et continuer le travail', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Que doit faire un Gestionnaire Stock en cas de rupture de stock ?')),
('Creer une campagne marketing', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Que doit faire un Gestionnaire Stock en cas de rupture de stock ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Que doit faire un Gestionnaire Stock en cas de rupture de stock ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Gestionnaire Stock'));


-- =========================
-- Poste : Chauffeur-Livreur
-- =========================
 pour Chauffeur-Livreur
-- =========================
-- Question 1
INSERT INTO Question (question) VALUES ('Quel est le rôle principal d''un Chauffeur-Livreur ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Assurer le transport et la livraison des marchandises en toute securite', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Chauffeur-Livreur ?')),
('Gerer les commandes et le stock du magasin', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Chauffeur-Livreur ?')),
('Superviser le service comptabilite', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Chauffeur-Livreur ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Chauffeur-Livreur ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Chauffeur-Livreur'));

-- Question 2
INSERT INTO Question (question) VALUES ('Quelle precaution doit-il prendre avant de prendre le volant ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Verifier l''etat du vehicule et les documents de transport', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle precaution doit-il prendre avant de prendre le volant ?')),
('Ignorer le vehicule et partir immediatement', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle precaution doit-il prendre avant de prendre le volant ?')),
('Demander au client de verifier le vehicule', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle precaution doit-il prendre avant de prendre le volant ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle precaution doit-il prendre avant de prendre le volant ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Chauffeur-Livreur'));

-- Question 3
INSERT INTO Question (question) VALUES ('Que doit-il faire en cas d''accident leger durant la livraison ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Signaler immediatement l''incident à son superieur et remplir le constat', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Que doit-il faire en cas d''accident leger durant la livraison ?')),
('Continuer la livraison sans prevenir personne', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Que doit-il faire en cas d''accident leger durant la livraison ?')),
('Telephoner au client pour se plaindre', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Que doit-il faire en cas d''accident leger durant la livraison ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Que doit-il faire en cas d''accident leger durant la livraison ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Chauffeur-Livreur'));

-- Question 4
INSERT INTO Question (question) VALUES ('Comment optimiser ses trajets de livraison ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Planifier un itineraire efficace et respecter les horaires', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Comment optimiser ses trajets de livraison ?')),
('Choisir l''itineraire au hasard', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Comment optimiser ses trajets de livraison ?')),
('Livrer uniquement les commandes les plus proches', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Comment optimiser ses trajets de livraison ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Comment optimiser ses trajets de livraison ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Chauffeur-Livreur'));

-- Question 5
INSERT INTO Question (question) VALUES ('Quelle règle de securite doit-il respecter lors de la livraison ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Respecter le code de la route et les consignes de securite pour la manipulation des marchandises', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle règle de securite doit-il respecter lors de la livraison ?')),
('Livrer les colis rapidement sans regarder la route', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle règle de securite doit-il respecter lors de la livraison ?')),
('Demander aux clients de porter eux-mêmes les colis dangereux', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle règle de securite doit-il respecter lors de la livraison ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle règle de securite doit-il respecter lors de la livraison ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Chauffeur-Livreur'));


-- =========================
-- Juridique
-- =========================
-- Poste : Avocat Interne
-- =========================
r Avocat Interne
-- =========================
-- Question 1
INSERT INTO Question (question) VALUES ('Quel est le rôle principal d''un Avocat Interne ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Conseiller l''entreprise sur les aspects juridiques et representer ses interêts', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Avocat Interne ?')),
('Gerer les comptes financiers de l''entreprise', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Avocat Interne ?')),
('Superviser les campagnes marketing', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Avocat Interne ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Avocat Interne ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Avocat Interne'));

-- Question 2
INSERT INTO Question (question) VALUES ('Que doit-il faire lorsqu''un contrat comporte des clauses ambiguës ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Analyser les clauses, conseiller l''entreprise et proposer des modifications', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Que doit-il faire lorsqu''un contrat comporte des clauses ambiguës ?')),
('Signer le contrat sans verification', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Que doit-il faire lorsqu''un contrat comporte des clauses ambiguës ?')),
('Demander au departement marketing de decider', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Que doit-il faire lorsqu''un contrat comporte des clauses ambiguës ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Que doit-il faire lorsqu''un contrat comporte des clauses ambiguës ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Avocat Interne'));

-- Question 3
INSERT INTO Question (question) VALUES ('Quelle action doit-il entreprendre en cas de litige avec un fournisseur ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Representer l''entreprise legalement et proposer une solution amiable ou judiciaire', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle action doit-il entreprendre en cas de litige avec un fournisseur ?')),
('Ignorer le litige', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle action doit-il entreprendre en cas de litige avec un fournisseur ?')),
('Confier le litige au service comptable', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle action doit-il entreprendre en cas de litige avec un fournisseur ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle action doit-il entreprendre en cas de litige avec un fournisseur ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Avocat Interne'));

-- Question 4
INSERT INTO Question (question) VALUES ('Comment assurer la conformite legale des activites de l''entreprise ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Verifier regulièrement les reglementations et conseiller sur les procedures internes', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Comment assurer la conformite legale des activites de l''entreprise ?')),
('Ne rien verifier et attendre un contrôle externe', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Comment assurer la conformite legale des activites de l''entreprise ?')),
('Se baser uniquement sur les avis des clients', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Comment assurer la conformite legale des activites de l''entreprise ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Comment assurer la conformite legale des activites de l''entreprise ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Avocat Interne'));

-- Question 5
INSERT INTO Question (question) VALUES ('Quel document est essentiel pour rediger un contrat commercial ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Les termes de l''accord et les obligations legales de chaque partie', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel document est essentiel pour rediger un contrat commercial ?')),
('Le plan marketing de l''entreprise', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel document est essentiel pour rediger un contrat commercial ?')),
('Le registre des employes', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel document est essentiel pour rediger un contrat commercial ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel document est essentiel pour rediger un contrat commercial ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Avocat Interne'));


-- =========================
-- Poste : Conseiller Juridique
-- =========================
ns pour Conseiller Juridique
-- =========================
-- Question 1
INSERT INTO Question (question) VALUES ('Quel est le rôle principal d''un Conseiller Juridique ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Fournir des conseils juridiques et assurer la conformite de l''entreprise', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Conseiller Juridique ?')),
('Gerer les finances de l''entreprise', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Conseiller Juridique ?')),
('Superviser les campagnes marketing', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Conseiller Juridique ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Conseiller Juridique ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Conseiller Juridique'));

-- Question 2
INSERT INTO Question (question) VALUES ('Que doit-il faire en cas de litige avec un partenaire commercial ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Analyser la situation et proposer des solutions legales appropriees', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Que doit-il faire en cas de litige avec un partenaire commercial ?')),
('Ignorer le litige', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Que doit-il faire en cas de litige avec un partenaire commercial ?')),
('Demander au service marketing de decider', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Que doit-il faire en cas de litige avec un partenaire commercial ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Que doit-il faire en cas de litige avec un partenaire commercial ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Conseiller Juridique'));

-- Question 3
INSERT INTO Question (question) VALUES ('Comment assurer la conformite legale des contrats de l''entreprise ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Examiner les contrats et verifier leur conformite aux lois en vigueur', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Comment assurer la conformite legale des contrats de l''entreprise ?')),
('Signer les contrats sans verification', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Comment assurer la conformite legale des contrats de l''entreprise ?')),
('Se baser uniquement sur les suggestions des clients', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Comment assurer la conformite legale des contrats de l''entreprise ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Comment assurer la conformite legale des contrats de l''entreprise ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Conseiller Juridique'));

-- Question 4
INSERT INTO Question (question) VALUES ('Quel document est essentiel pour evaluer les risques juridiques ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Les contrats, accords et reglementations applicables', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel document est essentiel pour evaluer les risques juridiques ?')),
('Les rapports de ventes', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel document est essentiel pour evaluer les risques juridiques ?')),
('Le planning des campagnes marketing', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel document est essentiel pour evaluer les risques juridiques ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel document est essentiel pour evaluer les risques juridiques ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Conseiller Juridique'));

-- Question 5
INSERT INTO Question (question) VALUES ('Que doit-il faire lorsqu''une nouvelle loi impacte l''entreprise ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Informer l''entreprise et adapter les procedures internes en consequence', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Que doit-il faire lorsqu''une nouvelle loi impacte l''entreprise ?')),
('Ignorer la loi et continuer les activites comme avant', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Que doit-il faire lorsqu''une nouvelle loi impacte l''entreprise ?')),
('Confier la decision au service marketing', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Que doit-il faire lorsqu''une nouvelle loi impacte l''entreprise ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Que doit-il faire lorsqu''une nouvelle loi impacte l''entreprise ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Conseiller Juridique'));



-- =========================
-- Recherche & Developpement
-- =========================
-- Poste : Analyste Innovation
-- =========================
====
-- Questions pour Analyste Innovation
-- =========================
-- Question 1
INSERT INTO Question (question) VALUES ('Quel est le rôle principal d''un Analyste Innovation ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Identifier et proposer de nouvelles idees et solutions pour l''entreprise', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Analyste Innovation ?')),
('Gerer le budget marketing', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Analyste Innovation ?')),
('Superviser la production quotidienne', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Analyste Innovation ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Analyste Innovation ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Analyste Innovation'));

-- Question 2
INSERT INTO Question (question) VALUES ('Quelle methodologie un Analyste Innovation peut-il utiliser pour generer des idees ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Brainstorming et Design Thinking', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle methodologie un Analyste Innovation peut-il utiliser pour generer des idees ?')),
('Analyse comptable uniquement', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle methodologie un Analyste Innovation peut-il utiliser pour generer des idees ?')),
('Gestion de la paie', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle methodologie un Analyste Innovation peut-il utiliser pour generer des idees ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle methodologie un Analyste Innovation peut-il utiliser pour generer des idees ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Analyste Innovation'));

-- Question 3
INSERT INTO Question (question) VALUES ('Comment analyser la faisabilite d''une idee innovante ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Evaluer les ressources necessaires et l''impact potentiel sur l''entreprise', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Comment analyser la faisabilite d''une idee innovante ?')),
('Imposer l''idee sans analyse', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Comment analyser la faisabilite d''une idee innovante ?')),
('Se baser uniquement sur l''avis des concurrents', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Comment analyser la faisabilite d''une idee innovante ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Comment analyser la faisabilite d''une idee innovante ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Analyste Innovation'));

-- Question 4
INSERT INTO Question (question) VALUES ('Quel outil est couramment utilise pour suivre les projets d''innovation ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Tableaux Kanban et logiciels de gestion de projets', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel outil est couramment utilise pour suivre les projets d''innovation ?')),
('Calculatrice fiscale uniquement', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel outil est couramment utilise pour suivre les projets d''innovation ?')),
('Agenda papier pour les reunions', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel outil est couramment utilise pour suivre les projets d''innovation ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel outil est couramment utilise pour suivre les projets d''innovation ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Analyste Innovation'));

-- Question 5
INSERT INTO Question (question) VALUES ('Quel indicateur permet de mesurer le succès d''une innovation ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Adoption par les utilisateurs et impact sur le chiffre d''affaires', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel indicateur permet de mesurer le succès d''une innovation ?')),
('Nombre de reunions realisees', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel indicateur permet de mesurer le succès d''une innovation ?')),
('Nombre de mails envoyes', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel indicateur permet de mesurer le succès d''une innovation ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel indicateur permet de mesurer le succès d''une innovation ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Analyste Innovation'));


-- =========================
-- Poste : Technicien de Laboratoire
-- =========================
==========
-- Questions pour Technicien de Laboratoire
-- =========================
-- Question 1
INSERT INTO Question (question) VALUES ('Quel est le rôle principal d''un Technicien de Laboratoire ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Realiser des analyses et tests en laboratoire selon les protocoles', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Technicien de Laboratoire ?')),
('Gerer le service commercial', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Technicien de Laboratoire ?')),
('Superviser les ressources humaines', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Technicien de Laboratoire ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Technicien de Laboratoire ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Technicien de Laboratoire'));

-- Question 2
INSERT INTO Question (question) VALUES ('Quel equipement est essentiel pour un Technicien de Laboratoire ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Microscope et materiel de pipetage', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel equipement est essentiel pour un Technicien de Laboratoire ?')),
('Ordinateur pour gestion des stocks uniquement', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel equipement est essentiel pour un Technicien de Laboratoire ?')),
('Telephone pour les appels clients', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel equipement est essentiel pour un Technicien de Laboratoire ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel equipement est essentiel pour un Technicien de Laboratoire ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Technicien de Laboratoire'));

-- Question 3
INSERT INTO Question (question) VALUES ('Quelle norme de securite doit être respectee dans un laboratoire ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Port de gants, lunettes et respect des protocoles de securite', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle norme de securite doit être respectee dans un laboratoire ?')),
('Ne jamais porter de gants', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle norme de securite doit être respectee dans un laboratoire ?')),
('Oublier les protocoles de manipulation', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle norme de securite doit être respectee dans un laboratoire ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle norme de securite doit être respectee dans un laboratoire ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Technicien de Laboratoire'));

-- Question 4
INSERT INTO Question (question) VALUES ('Comment un Technicien de Laboratoire documente-t-il ses experiences ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('En consignant les protocoles, observations et resultats dans un cahier de laboratoire', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Comment un Technicien de Laboratoire documente-t-il ses experiences ?')),
('En partageant uniquement les resultats par email', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Comment un Technicien de Laboratoire documente-t-il ses experiences ?')),
('En ne notant rien du tout', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Comment un Technicien de Laboratoire documente-t-il ses experiences ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Comment un Technicien de Laboratoire documente-t-il ses experiences ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Technicien de Laboratoire'));

-- Question 5
INSERT INTO Question (question) VALUES ('Quel est l''objectif principal des tests realises par un Technicien de Laboratoire ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Valider des hypothèses scientifiques et garantir la qualite des produits', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel est l''objectif principal des tests realises par un Technicien de Laboratoire ?')),
('Preparer les reunions de direction uniquement', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est l''objectif principal des tests realises par un Technicien de Laboratoire ?')),
('Superviser le marketing des produits', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est l''objectif principal des tests realises par un Technicien de Laboratoire ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel est l''objectif principal des tests realises par un Technicien de Laboratoire ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Technicien de Laboratoire'));



-- Direction Generale
-- =========================
-- Poste : Secretaire de Direction
-- =========================
=
-- Questions pour Secretaire de Direction
-- =========================
-- Question 1
INSERT INTO Question (question) VALUES ('Quel est le rôle principal d''un Secretaire de Direction ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Gerer l''agenda, les communications et assister la direction', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Secretaire de Direction ?')),
('Superviser les finances de l''entreprise', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Secretaire de Direction ?')),
('Developper la strategie commerciale', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Secretaire de Direction ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Secretaire de Direction ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Secretaire de Direction'));

-- Question 2
INSERT INTO Question (question) VALUES ('Quelle competence est essentielle pour un Secretaire de Direction ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Organisation et maîtrise des outils bureautiques', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle competence est essentielle pour un Secretaire de Direction ?')),
('Conduite de machines de production', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle competence est essentielle pour un Secretaire de Direction ?')),
('Gestion de projets IT', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle competence est essentielle pour un Secretaire de Direction ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle competence est essentielle pour un Secretaire de Direction ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Secretaire de Direction'));

-- Question 3
INSERT INTO Question (question) VALUES ('Comment un Secretaire de Direction doit-il gerer les reunions ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Preparer l''ordre du jour et rediger les comptes rendus', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Comment un Secretaire de Direction doit-il gerer les reunions ?')),
('Participer aux tests de laboratoire', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Comment un Secretaire de Direction doit-il gerer les reunions ?')),
('Superviser la logistique des stocks', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Comment un Secretaire de Direction doit-il gerer les reunions ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Comment un Secretaire de Direction doit-il gerer les reunions ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Secretaire de Direction'));

-- Question 4
INSERT INTO Question (question) VALUES ('Quel type de documents le Secretaire de Direction doit-il gerer ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Courriers, emails, comptes rendus et dossiers administratifs', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel type de documents le Secretaire de Direction doit-il gerer ?')),
('Plans de production et inventaires', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel type de documents le Secretaire de Direction doit-il gerer ?')),
('Rapports financiers uniquement', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel type de documents le Secretaire de Direction doit-il gerer ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel type de documents le Secretaire de Direction doit-il gerer ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Secretaire de Direction'));

-- Question 5
INSERT INTO Question (question) VALUES ('Quelle qualite est la plus importante pour un Secretaire de Direction ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Discretion, rigueur et efficacite', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle qualite est la plus importante pour un Secretaire de Direction ?')),
('Creativite artistique', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle qualite est la plus importante pour un Secretaire de Direction ?')),
('Competence en pilotage d''avion', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle qualite est la plus importante pour un Secretaire de Direction ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle qualite est la plus importante pour un Secretaire de Direction ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Secretaire de Direction'));


-- =========================
-- Poste : Conseiller Strategique
-- =========================

-- Questions pour Conseiller Strategique
-- =========================
-- Question 1
INSERT INTO Question (question) VALUES ('Quel est le rôle principal d''un Conseiller Strategique ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Analyser la situation de l''entreprise et proposer des recommandations strategiques', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Conseiller Strategique ?')),
('Superviser la paie des employes', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Conseiller Strategique ?')),
('Gerer uniquement le materiel informatique', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Conseiller Strategique ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel est le rôle principal d''un Conseiller Strategique ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Conseiller Strategique'));

-- Question 2
INSERT INTO Question (question) VALUES ('Quelle competence est essentielle pour un Conseiller Strategique ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Capacite d''analyse, vision globale et aptitude à la prise de decision', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle competence est essentielle pour un Conseiller Strategique ?')),
('Conduite de vehicules lourds', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle competence est essentielle pour un Conseiller Strategique ?')),
('Realisation de tâches administratives de bureau', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle competence est essentielle pour un Conseiller Strategique ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle competence est essentielle pour un Conseiller Strategique ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Conseiller Strategique'));

-- Question 3
INSERT INTO Question (question) VALUES ('Comment un Conseiller Strategique aide-t-il la direction ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('En fournissant des analyses et des recommandations pour orienter les decisions', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Comment un Conseiller Strategique aide-t-il la direction ?')),
('En supervisant la maintenance des machines de production', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Comment un Conseiller Strategique aide-t-il la direction ?')),
('En s''occupant de la comptabilite quotidienne', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Comment un Conseiller Strategique aide-t-il la direction ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Comment un Conseiller Strategique aide-t-il la direction ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Conseiller Strategique'));

-- Question 4
INSERT INTO Question (question) VALUES ('Quel type de documents le Conseiller Strategique utilise-t-il le plus ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Rapports d''activite, analyses financières et etudes de marche', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quel type de documents le Conseiller Strategique utilise-t-il le plus ?')),
('Plans de production et inventaires de stock', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel type de documents le Conseiller Strategique utilise-t-il le plus ?')),
('Manuels techniques pour les machines', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quel type de documents le Conseiller Strategique utilise-t-il le plus ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quel type de documents le Conseiller Strategique utilise-t-il le plus ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Conseiller Strategique'));

-- Question 5
INSERT INTO Question (question) VALUES ('Quelle qualite est la plus importante pour un Conseiller Strategique ?');
-- Reponses
INSERT INTO Reponse (reponse, choix, vraiFaux, idQuestion) VALUES
('Vision, sens de l''analyse et esprit critique', 'A', TRUE, (SELECT idQuestion FROM Question WHERE question='Quelle qualite est la plus importante pour un Conseiller Strategique ?')),
('Competence en pilotage d''avion', 'B', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle qualite est la plus importante pour un Conseiller Strategique ?')),
('Capacite à produire des pièces mecaniques', 'C', FALSE, (SELECT idQuestion FROM Question WHERE question='Quelle qualite est la plus importante pour un Conseiller Strategique ?'));
-- Poste correspondant
INSERT INTO question_poste (idQuestion, idPoste)
VALUES ((SELECT idQuestion FROM Question WHERE question='Quelle qualite est la plus importante pour un Conseiller Strategique ?'), (SELECT idPoste FROM Poste WHERE nomPoste='Conseiller Strategique'));

