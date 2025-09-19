-- VIEW POUR AVOIR LA LISTE DES BESOINS ENCORE NON VALIDE PAR RH
CREATE OR REPLACE VIEW v_BesoinNonValide AS
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
    bv.dateValidation
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