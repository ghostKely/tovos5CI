
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
    
    -- Informations du Contrat
    b.idContrat,
    c.typeContrat,
    c.abreviation as type_contrat_abrev,
    
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
INNER JOIN Contrat c ON b.idContrat = c.idContrat
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
    
    -- Informations du Contrat
    b.idContrat,
    c.typeContrat,
    c.abreviation as type_contrat_abrev,
    
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
INNER JOIN Contrat c ON b.idContrat = c.idContrat
INNER JOIN Poste p ON b.idPoste = p.idPoste
INNER JOIN Departement dep ON p.id_departement = dep.id_departement
-- Filtrer seulement les besoins SANS question
WHERE q.idBesoin IS NULL
ORDER BY b.dateBesoin DESC;

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
    
    -- Informations du Contrat
    b.idContrat,
    c.typeContrat,
    c.abreviation as type_contrat_abrev,
    
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
INNER JOIN Contrat c ON b.idContrat = c.idContrat
INNER JOIN Poste p ON b.idPoste = p.idPoste
INNER JOIN Departement dep ON p.id_departement = dep.id_departement
-- Filtre pour les besoins non validés
WHERE bv.idBesoin IS NULL;

-- ================================================================================================= VIEW DG
-- VIEW QUI DONNE LA LISTE DES BESOINS VALIDES PAR RH
CREATE OR REPLACE VIEW v_besoindg AS
SELECT 
    b.dateBesoin,
    d.nomDepartement,
    p.nomPoste,
    b.nombre_employe,
    b.annee_experience,
    di.nomDiplome,
    c.typeContrat,
    bv.dateValidationRH
FROM BesoinValide bv
INNER JOIN Besoin b ON bv.idBesoin = b.idBesoin
INNER JOIN Poste p ON b.idPoste = p.idPoste
INNER JOIN Departement d ON p.id_departement = d.id_departement
INNER JOIN Diplome di ON b.id_diplome = di.id_diplome
INNER JOIN Contrat c ON b.idContrat = c.idContrat
WHERE bv.checkRH = TRUE;