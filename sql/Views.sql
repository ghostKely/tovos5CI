
-- ================================================================================================= VIEW MANAGER
-- VIEW POUR AVOIR LA LISTE DES BESOINS CREE PAR MANAGER
CREATE OR REPLACE VIEW v_Besoin AS
SELECT 
    -- Informations du Besoin
    b.idBesoin,
    b.nombre_employe,
    b.description,
    b.annee_experience,
    b.dateBesoin,
    
    -- Informations du Manager
    b.idManager,
    m.email as manager_email,
    
    -- Informations du Diplôme requis
    b.id_diplome,
    d.nomDiplome,
    d.ranking as niveau_diplome,
    
    -- Informations du Poste
    b.idPoste,
    p.nomPoste,
    
    -- Informations du Département
    p.id_departement,
    dep.nomDepartement
FROM Besoin b
-- Jointure pour vérifier la validation
LEFT JOIN BesoinValide bv ON b.idBesoin = bv.idBesoin
-- Jointures avec toutes les tables de référence
INNER JOIN Manager m ON b.idManager = m.idManager
INNER JOIN Diplome d ON b.id_diplome = d.id_diplome
INNER JOIN Poste p ON b.idPoste = p.idPoste
INNER JOIN Departement dep ON p.id_departement = dep.id_departement;

-- LISTE DES BESOINS QUI N'ONT PAS ENCORE DE QUESTIONS
CREATE OR REPLACE VIEW v_besoinsansquestion AS
SELECT 
    -- Informations du Besoin
    b.idBesoin,
    b.nombre_employe,
    b.description,
    b.annee_experience,
    b.dateBesoin,
    
    -- Informations du Manager
    b.idManager,
    m.email as manager_email,
    
    -- Informations du Diplôme requis
    b.id_diplome,
    d.nomDiplome,
    d.ranking as niveau_diplome,
    
    -- Informations du Poste
    b.idPoste,
    p.nomPoste,
    
    -- Informations du Département
    p.id_departement,
    dep.nomDepartement,
    
    -- Statut (pour information)
    'SANS QUESTION' as statut
    
FROM Besoin b
-- Jointure LEFT avec Question pour inclure tous les besoins
LEFT JOIN Question q ON b.idBesoin = q.idBesoin
-- Jointures INNER avec les autres tables
INNER JOIN Manager m ON b.idManager = m.idManager
INNER JOIN Diplome d ON b.id_diplome = d.id_diplome
INNER JOIN Poste p ON b.idPoste = p.idPoste
INNER JOIN Departement dep ON p.id_departement = dep.id_departement
-- Filtrer seulement les besoins SANS question
WHERE q.idBesoin IS NULL
ORDER BY b.dateBesoin DESC;

-- VIEW POUR AVOIR LE QCM D'UNE DEMANDE DE BESOIN
CREATE OR REPLACE VIEW v_besoinqcm AS
SELECT 
    b.idBesoin,
    b.description AS besoin_description,
    b.nombre_employe,
    b.annee_experience,
    b.dateBesoin,
    q.idQuestion,
    q.question,
    q.dateCreation AS question_date_creation,
    JSON_AGG(
        JSON_BUILD_OBJECT(
            'idReponse', r.idReponse,
            'reponse', r.reponse,
            'vraiFaux', r.vraiFaux
        ) 
        ORDER BY r.idReponse
    ) AS reponses
FROM Besoin b
INNER JOIN Question q ON b.idBesoin = q.idBesoin
LEFT JOIN Reponse r ON q.idQuestion = r.idQuestion
GROUP BY b.idBesoin, b.description, b.nombre_employe, b.annee_experience, b.dateBesoin, q.idQuestion, q.question, q.dateCreation
ORDER BY b.idBesoin, q.idQuestion;

-- ================================================================================================= VIEW RH
-- VIEW POUR AVOIR LA LISTE DES BESOINS ENCORE NON VALIDE PAR RH
CREATE OR REPLACE VIEW v_besoinrh AS
SELECT 
    -- Informations du Besoin
    b.idBesoin,
    b.nombre_employe,
    b.description,
    b.annee_experience,
    b.dateBesoin,
    
    -- Informations du Manager
    b.idManager,
    m.email as manager_email,
    
    -- Informations du Diplôme requis
    b.id_diplome,
    d.nomDiplome,
    d.ranking as niveau_diplome,
    
    -- Informations du Poste
    b.idPoste,
    p.nomPoste,
    
    -- Informations du Département
    p.id_departement,
    dep.nomDepartement,
    
    -- Statut de validation
    bv.idBesoinValide,
    bv.dateValidationrh,
    bv.checkrh
    
FROM Besoin b
-- Jointure pour vérifier la validation
LEFT JOIN BesoinValide bv ON b.idBesoin = bv.idBesoin
-- Jointures avec toutes les tables de référence
INNER JOIN Manager m ON b.idManager = m.idManager
INNER JOIN Diplome d ON b.id_diplome = d.id_diplome
INNER JOIN Poste p ON b.idPoste = p.idPoste
INNER JOIN Departement dep ON p.id_departement = dep.id_departement
-- Filtre pour les besoins non validés ET avec au moins une question
WHERE bv.idBesoin IS NULL
AND EXISTS (
    SELECT 1 
    FROM Question q 
    WHERE q.idBesoin = b.idBesoin
)
ORDER BY b.dateBesoin DESC;

-- ================================================================================================= VIEW DG
-- VIEW QUI DONNE LA LISTE DES BESOINS VALIDES PAR RH
-- CREATE OR REPLACE VIEW v_besoindg AS
-- SELECT 
--     b.idBesoin,
--     b.dateBesoin,
--     d.nomDepartement,
--     b.description,
--     p.nomPoste,
--     b.nombre_employe,
--     b.annee_experience, 
--     di.nomDiplome,
--     bv.dateValidationRH,
--     bv.checkrh,
--     bv.checkdg,
--     bv.averagenoteqcm
-- FROM BesoinValide bv
-- INNER JOIN Besoin b ON bv.idBesoin = b.idBesoin
-- INNER JOIN Poste p ON b.idPoste = p.idPoste
-- INNER JOIN Departement d ON p.id_departement = d.id_departement
-- INNER JOIN Diplome di ON b.id_diplome = di.id_diplome
-- WHERE bv.checkRH = TRUE AND bv.checkDG = FALSE;

--  VIEW POUR AVOIR LA DERNIERE VALIDATION POUR UN BESOIN
CREATE OR REPLACE VIEW v_besoindg AS
SELECT 
    b.idBesoin,
    b.dateBesoin,
    d.nomDepartement,
    b.description,
    p.nomPoste,
    b.nombre_employe,
    b.annee_experience, 
    di.nomDiplome,
    bv.dateValidationRH,
    bv.checkrh,
    bv.checkdg,
    bv.averagenoteqcm,
    bv.idBesoinValide,
    bv.dateValidationDG
FROM Besoin b
INNER JOIN Poste p ON b.idPoste = p.idPoste
INNER JOIN Departement d ON p.id_departement = d.id_departement
INNER JOIN Diplome di ON b.id_diplome = di.id_diplome
INNER JOIN (
    -- Sous-requête pour obtenir la dernière validation de chaque besoin
    SELECT DISTINCT ON (idBesoin) *
    FROM BesoinValide
    ORDER BY idBesoin, dateValidationRH DESC, idBesoinValide DESC
) bv ON b.idBesoin = bv.idBesoin
WHERE bv.checkRH = TRUE 
AND bv.checkDG = FALSE;

-- VIEW POUR AVOIR LA LISTE DES ANNONCES
CREATE OR REPLACE VIEW v_annonce AS
SELECT 
    a.idAnnonce,
    a.titre,
    a.datePublication,
    p.idposte,
    p.nomPoste,
    d.id_diplome,
    d.nomDiplome,
    b.description,
    b.nombre_employe,
    b.annee_experience,
    bv.statutPostulation,
    dep.nomDepartement,
    bv.dateValidationRH,
    bv.dateValidationDG,
    bv.idBesoinValide,
    bv.averagenoteqcm,
    b.idBesoin
FROM Annonce a
INNER JOIN Besoin b ON a.idBesoin = b.idBesoin
INNER JOIN (
    SELECT DISTINCT ON (idBesoin) *
    FROM BesoinValide
    ORDER BY idBesoin, idBesoinValide DESC
) bv ON b.idBesoin = bv.idBesoin
INNER JOIN Poste p ON b.idPoste = p.idPoste
INNER JOIN Diplome d ON b.id_diplome = d.id_diplome
INNER JOIN Departement dep ON p.id_departement = dep.id_departement
WHERE bv.statutPostulation = FALSE;


-- View pour QCM 
CREATE OR REPLACE VIEW v_qcm AS
SELECT 
    q.idquestion,
    q.question,
    q.datecreation,
    q.idbesoin,
    b.nombre_employe,
    b.description AS besoin_description,
    b.annee_experience,
    b.datebesoin,
    b.idmanager,
    b.id_diplome,
    b.idposte,
    r.idreponse,
    r.reponse,
    r.vraifaux
FROM question q
LEFT JOIN besoin b ON q.idbesoin = b.idbesoin
LEFT JOIN reponse r ON q.idquestion = r.idquestion;

CREATE OR REPLACE VIEW v_detailqcm
AS
SELECT 
    nq.idNoteQcm,
    nq.note,
    nq.dateQcm,
    c.idCandidat,
    c.nom AS candidat_nom,
    c.prenom AS candidat_prenom,
    c.email AS candidat_email,
    c.adresse AS candidat_adresse,
    c.dtn AS candidat_naissance,
    c.totalAnne_experience AS candidat_experience,
    c.file_path AS candidat_cv,
    c.datePostulation,
    d.nomDiplome AS candidat_diplome,
    d.ranking AS diplome_ranking,
    a.idAnnonce,
    a.titre AS annonce_titre,
    a.datePublication AS annonce_date_pub,
    b.idBesoin,
    b.nombre_employe,
    b.description AS besoin_description,
    b.annee_experience AS besoin_experience,
    b.dateBesoin
FROM NoteQcm nq
JOIN Candidat c ON nq.idCandidat = c.idCandidat
LEFT JOIN Diplome d ON c.id_diplome = d.id_diplome
JOIN Annonce a ON nq.idAnnonce = a.idAnnonce
JOIN Besoin b ON a.idBesoin = b.idBesoin;

    -- VIEW POUR AVOIR LA LISTE DES CANDIDATS AYANT UN ENTRETIEN
    -- drop view v_candidatentretien;
    CREATE OR REPLACE VIEW v_candidatentretien AS
    SELECT 
        c.idCandidat,
        c.nom,
        c.prenom,
        c.email,
        c.adresse,
        c.dtn,
        -- Diplôme du candidat
        d_candidat.id_diplome,
        d_candidat.nomDiplome AS diplome_candidat,
        d_candidat.ranking AS ranking_diplome_candidat,
        -- Diplôme requis pour l'annonce
        d_requis.nomDiplome AS diplome_requis,
        d_requis.ranking AS ranking_diplome_requis,
        c.totalAnne_experience,
        c.file_path,
        c.datePostulation,
        c.renseignement,
        
        -- Informations de l'entretien
        e.idEntretien,
        e.date_entretien,
        
        -- Informations de l'annonce
        a.idAnnonce,
        a.titre AS titre_annonce,
        a.datePublication,
        
        -- Informations du besoin
        b.idBesoin,
        b.nombre_employe,
        b.description,
        b.annee_experience,
        b.dateBesoin,
        
        -- Informations du poste
        p.idPoste,
        p.nomPoste,
        
        -- Informations du département
        dep.id_departement,
        dep.nomDepartement,
        
        -- Note QCM
        nq.note,
        COALESCE(nq.note, 0) AS note_qcm,
        nq.dateQcm AS date_passation_qcm,

        cr.idCandidatRefuse,
        cr.libelle_etape,

        es.idessai,
        es.datedebut,
        es.datefin,

        rv.idrenouvellement,
        rv.datedebut AS debutrenew,
        rv.datefin AS finrenew,

        emp.idemploye,
        emp.date_embauche
    FROM Candidat c
    INNER JOIN Entretien e ON c.idCandidat = e.idCandidat
    INNER JOIN Annonce a ON e.idAnnonce = a.idAnnonce
    INNER JOIN Besoin b ON a.idBesoin = b.idBesoin
    -- Diplôme du candidat
    INNER JOIN Diplome d_candidat ON c.id_diplome = d_candidat.id_diplome
    -- Diplôme requis pour le besoin (annonce)
    INNER JOIN Diplome d_requis ON b.id_diplome = d_requis.id_diplome
    INNER JOIN Poste p ON b.idPoste = p.idPoste
    INNER JOIN Departement dep ON p.id_departement = dep.id_departement
    LEFT JOIN NoteQcm nq ON (c.idCandidat = nq.idCandidat AND a.idAnnonce = nq.idAnnonce)
    LEFT JOIN CandidatRefuse cr ON cr.idCandidat = c.idcandidat
    LEFT JOIN Essai es ON es.idCandidat = c.idcandidat
    LEFT JOIN Renouvellement rv ON rv.idCandidat = c.idcandidat
    LEFT JOIN Employe emp ON emp.idCandidat = c.idcandidat
    ORDER BY e.date_entretien DESC, c.nom, c.prenom;

CREATE OR REPLACE VIEW v_employe AS
SELECT 
    e.idEmploye,
    e.email AS email_employe,
    e.nom,
    e.prenom,
    e.adresse,
    e.dtn,
    e.date_embauche,
    
    -- Informations du poste
    p.idPoste,
    p.nomPoste,
    
    -- Informations du département
    d.id_departement,
    d.nomDepartement,
    
    -- Informations du contrat
    c.idContrat,
    c.typeContrat,
    c.abreviation,
    
    -- Informations du diplôme du candidat
    dipl.id_diplome,
    dipl.nomDiplome
    
FROM Employe e
INNER JOIN Poste p ON e.idPoste = p.idPoste
INNER JOIN Departement d ON p.id_departement = d.id_departement
LEFT JOIN Contrat c ON e.idContrat = c.idContrat
LEFT JOIN Diplome dipl ON e.id_diplome = dipl.id_diplome
ORDER BY e.date_embauche DESC, e.nom, e.prenom;
