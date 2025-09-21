<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_Besoin extends CI_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->model('dao_model', 'dao');
    }

/*  ========================================================================================================================== A PROPOS DE AJOUT DE DEMANDE DE BESOINS MANAGER */
/* FONCTION DE REDIRECTION VERS LA PAGE D'AJOUT DE BESOIN 
    ARGUMENTS : 
*/
	public function page_AjoutBesoin() {            //initiena 3 par défaut pour la page Validation.php si non erreur
        $data['pageTitle'] = "Ajout Besoin";                        //titre de la page de destination
        $data['pageToLoad'] = "besoin/Besoin_Add";                  //path de a page de destination

        $data['postes'] = $this->dao->select_all('poste');          //liste des postes pour choisir à quel poste on a besoin de qui
        $data['diplomes'] = $this->dao->select_all('diplome');      //liste des diplomes pour choisir diplome minimum
        $data['contrats'] = $this->dao->select_all('contrat');      //liste des contrats pour savoir tupe contrat du poste


		$this->load->view('home/Home', $data);                      //page principale où on load les pages
	}
   
/* FONCTION POUR CHECKER SI L'UN DES CHAMPS EST NULL */
    public function checkChampsVide($valeurPost, $redirectPage) {
        foreach ($valeurPost as $valeur) {
            if (empty($valeur)) {   
                $this->session->set_flashdata('checkValidation', [      //on fait revenir vers la page d'insertion avec un popup d'erreur 
                    'message' => "Veuillez remplir tous les champs !"   //message de validation pour page Validation.php
                ]); 
                redirect($redirectPage);                                //redirection vers la fonction page_AjoutBesoin
            } 
        }
    }

/* FONCTION D'INSERTION D'UN BESOIN */
    public function saveBesoin() {
        $idPoste = $this->input->post('poste');                             //récupération de id de poste pour besoin
        $id_diplome = $this->input->post('diplome');                        //récupération de id de diplome minimum 
        $nbrePeronnel = $this->input->post('nbrepersonnel');                //récupération de la nombre de personnel a engager
        $experience = $this->input->post('experience');                     //récupération de année d'experience recquis pour poste
        $description = $this->input->post('description');                   //récupération de description du travail pour poste
        $datedemande = $this->input->post('datedemande');                   //récupération de date quand on a fait la demande de besoin
        $id = $this->session->userdata('id');                               //récupération de id de la personne log

        $valeurPost = array($idPoste, $id_diplome, $nbrePeronnel, $experience, $description, $datedemande);
        $this->checkChampsVide($valeurPost, "besoin/C_Besoin/page_AjoutBesoin");        //checking si un champ est vide

        //creation du tableau pour la requete
            $to_insert = [                             
                'nombre_employe' => $nbrePeronnel,
                'description' => $description,
                'annee_experience' => $experience,
                'datebesoin' => $datedemande,
                'idmanager' => $id,
                'id_diplome' => $id_diplome,
                'idposte' => $idPoste
            ];
            $checkInsert = $this->dao->insert_into('besoin', $to_insert);   //retour de id de insertion si insertion réussi ($inserted != null)
             
            if ($checkInsert !== false) {                                    //si la valeur de $inserted n'est pas null alors insertion réussi
                $this->session->set_flashdata('checkValidation', [          //redirect vers page d'insertion + popup de validation de insertion réussi
                    'message' => "Votre demande a été enregistrée !"        //message de validation pour page Validation.php
                    ]);
            } else {                                                    //si la valeur de $inserted est pas null alors insertion raté                
                $this->session->set_flashdata('checkValidation', [          //redirect vers page d'insertion + popup de validation de insertion raté
                    'message' => "Votre demande a échoué !"                 //message de validation pour page Validation.php
                ]);
            }

        redirect('besoin/C_Besoin/page_AjoutBesoin');                   //redirection vers la fonction page_AjoutBesoin
    }

    
/*  ========================================================================================================================== A PROPOS DE LISTER LES DEMNDES DE BESOINS*/
/* FONCTION POUR AVOIR LA LISTE DES BESOINS POUR MANAGER/RH/DG */
    public function getListeBesoin(){
        $data['pageTitle'] = "Liste Besoins";                       //titre de la page de destination
        $data['pageToLoad'] = "besoin/Besoin_List";                 //path de a page de destination
        $detailPage = $this->getDetailUser();                               //pour avoir la view et la page à load pour le user
        $data['listeBesoin'] = $this->dao->select_all($detailPage['view']); //liste des besoins non valide
        $data['titreListe'] = $detailPage['precisionListBesoin'];            //titre de la liste des demande de besoins
        
		$this->load->view('home/Home', $data);                                      //page principale où on load les pages
    }

/* FONCTION POUR AVOIR LA LISTE DES BESOINS POUR MANAGER/RH/DG */
    public function getListeAllBesoin(){
        $data['pageTitle'] = "Liste Besoins";                       //titre de la page de destination
        $data['pageToLoad'] = "besoin/Besoin_ListAll";                 //path de a page de destination
        $data['listeBesoin'] = $this->dao->select_all('v_besoin');  //liste des besoins non valide
        $data['titreListe'] = "";                                   //titre de la liste des demande de besoins
        
		$this->load->view('home/Home', $data);                                      //page principale où on load les pages
    }

/* FONCTION POUR AVOIR LES DETAILS D'UNE DEMANDE DE BESOIN POUR UN POSTE */
    public function getDetailAllBesoin($idBesoin) {
        $data['pageTitle'] = "Détails Besoins";                          //titre de la page de destination
        $data['pageToLoad'] = "besoin/Besoin_DetailQuestion";         //path de a page de destination
        $detailPage = $this->getDetailUser($idBesoin);                            //pour avoir la view et la page à load pour le user

        $condition = ['idbesoin' => $idBesoin];                                         //condition pour avoir le detail d'un besoin
        $data['detailBesoin'] = $this->dao->select_where('v_besoin', $condition);       //liste des besoins non valide
        $data['qcm'] = $this->dao->select_where('v_besoinqcm', $condition);             //liste des besoins non valide
    
        $data['detailUser'] = $detailPage;                                      //contient info perso de user
		$this->load->view('home/Home', $data);                                  //page principale où on load les pages
    }

/* ========================================================================================================================== A PROPOS DE VALIDATION DE BESOINS PAR RH */
/* FOCNTION POUR SAVOIR SI ON A BESOIN DE DETAIL DE MANAGER/RH/DG */
    public function getDetailUser($idBesoin = null) {
        $logValue = $this->session->userdata('logValue');       //valeur de log 1/2/3
        if ($logValue == 1) {                                                   //1 => manager
            $pagedetailBesoin['view'] = "v_besoinsansquestion";                 //1 => view v_besoin pour la liste des besoins sans question
            $pagedetailBesoin['precisionListBesoin'] = "sans question";         //1 => titre de la liste (demande de besoin sans question)
            return $pagedetailBesoin;   
        } else if ($logValue == 2) {                                            //2 => rh
            $pagedetailBesoin['view'] = "v_besoinrh";                           //2 => view v_besoin pour la liste des besoins non valide par rh
            $pagedetailBesoin['precisionListBesoin'] = "non validé par rh";     //2 => titre de la liste (demande de besoin non validé par rh)

            $sql = "SELECT count(idquestion) AS nbrequestion FROM question WHERE idbesoin='".$idBesoin."'";     //requete pour avoir le nombre de question pour ce besoin
            $pagedetailBesoin['nbreQuestion'] = $this->dao->executeQuery($sql);                                 //contient nombre de question pour le QCM de ce besoin
            return $pagedetailBesoin;   
        } else if ($logValue == 3) {                                            //3 => dg
            $pagedetailBesoin['view'] = "v_besoindg";                           //3 => view v_besoindg pour la liste des besoins validé par RH
            $pagedetailBesoin['precisionListBesoin'] = "validé par rh";         //3 => titre de la liste (demande de besoin validé par RH)
            return $pagedetailBesoin;   
        }
    }

/* FONCTION POUR AVOIR LES DETAILS D'UNE DEMANDE DE BESOIN POUR UN POSTE */
    public function getDetailBesoin($idBesoin) {
        $logValue = $this->session->userdata('logValue');
        $data['pageTitle'] = "Détails Besoins";                          //titre de la page de destination
        $data['pageToLoad'] = "besoin/Besoin_Detail_".$logValue;         //path de a page de destination
        $detailPage = $this->getDetailUser($idBesoin);                            //pour avoir la view et la page à load pour le user

        $condition = ['idbesoin' => $idBesoin];                                                 //condition pour avoir le detail d'un besoin
        $data['detailBesoin'] = $this->dao->select_where($detailPage['view'], $condition);      //liste des besoins non valide

        $data['detailUser'] = $detailPage;                                      //contient info perso de user
		$this->load->view('home/Home', $data);                                  //page principale où on load les pages
    }    



/* FONCTION POUR FAIRE LA VALIDATION DE BESOIN DU RH */
    public function saveValidationRH() {
        $datevalidationrh = $this->input->post('datevalidationrh');             //récupération de date de validation de besoin
        $moyenne = $this->input->post('moyenne');                               //récupération de moyenne qui passe le QCM
        $idBesoin = $this->input->post('idbesoin');                             //récupération de id de besoin a valider

        $valeurPost = array($datevalidationrh, $moyenne, $idBesoin);            //champs à check si vide
        $redirectPage = "besoin/C_Besoin/getDetailBesoin/".$idBesoin;           //page de redirection si misy vide
        $this->checkChampsVide($valeurPost, $redirectPage);                     //checking de champ vide

        //creation du tableau pour la requete
            $to_insert = [                             
                'datevalidationrh' => $datevalidationrh,
                'checkrh' => true,
                'datevalidationdg' => null,
                'checkdg' => false,
                'statutpostulation' => false,
                'idbesoin' => $idBesoin,      
                'averagenoteqcm' => $moyenne
            ];
            $checkInsert = $this->dao->insert_into('besoinvalide', $to_insert);   //retour de id de insertion si insertion réussi ($inserted != null)
             
            if ($checkInsert !== false) {                                    //si la valeur de $inserted n'est pas null alors insertion réussi
                $this->session->set_flashdata('checkValidation', [          //redirect vers page d'insertion + popup de validation de insertion réussi
                    'message' => "Succès de la validation de la demande de besoin !"        //message de validation pour page Validation.php
                    ]);
            } else {                                                    //si la valeur de $inserted est pas null alors insertion raté                
                $this->session->set_flashdata('checkValidation', [          //redirect vers page d'insertion + popup de validation de insertion raté
                    'message' => "Echec de la validation de la demande de besoin !"                 //message de validation pour page Validation.php
                ]);
            }

        redirect('besoin/C_Besoin/getListeBesoin');                   //redirection vers la fonction page_AjoutBesoin
    }

/* ========================================================================================================================== A PROPOS DE VALIDATION DE BESOINS PAR DG */
/* FONCTION POUR INSERER LA VALIDATION DU DG */
    public function insertValidationDG($datevalidationrh, $datevalidationdg, $moyenne, $checkrh, $idBesoin, $nomPoste) {
        //creation du tableau pour la requete
        $to_insert = [                             
            'datevalidationrh' => $datevalidationrh,
            'checkrh' => $checkrh,
            'datevalidationdg' => $datevalidationdg,
            'checkdg' => true,
            'statutpostulation' => false,
            'idbesoin' => $idBesoin,      
            'averagenoteqcm' => $moyenne
        ];
        $checkInsert = $this->dao->insert_into('besoinvalide', $to_insert);   //retour de id de insertion si insertion réussi ($inserted != null)
         
        if ($checkInsert !== false) {                                    //si la valeur de $inserted n'est pas null alors insertion réussi
            $this->session->set_flashdata('checkValidation', [          //redirect vers page d'insertion + popup de validation de insertion réussi
                'message' => "Succès de la validation de la demande de besoin !"        //message de validation pour page Validation.php
                ]);
        } else {                                                    //si la valeur de $inserted est pas null alors insertion raté                
            $this->session->set_flashdata('checkValidation', [          //redirect vers page d'insertion + popup de validation de insertion raté
                'message' => "Echec de la validation de la demande de besoin !"                 //message de validation pour page Validation.php
            ]);
            redirect('besoin/C_Besoin/getDetailBesoin/'.$idBesoin);
        }

        return true;
    }

/* FONCTION POUR INSERER ANNONCE APRES VALIDATION DU DG */
    public function insertAnnonce($colonneAnnonce) {
        $checkInsertAnnonce = $this->dao->insert_into("annonce", $colonneAnnonce);  //insertion de annonce
        
        if ($checkInsertAnnonce !== false) {                                    //si la valeur de $inserted n'est pas null alors insertion réussi
            $this->session->set_flashdata('checkValidation', [          //redirect vers page d'insertion + popup de validation de insertion réussi
                'message' => "Succès de la validation de la demande de besoin !"        //message de validation pour page Validation.php
                ]);
        } else {                                                    //si la valeur de $inserted est pas null alors insertion raté                
            $this->session->set_flashdata('checkValidation', [          //redirect vers page d'insertion + popup de validation de insertion raté
                'message' => "Echec de la validation de la demande de besoin !"                 //message de validation pour page Validation.php
            ]);
            redirect('besoin/C_Besoin/getDetailBesoin/'.$colonneAnnonce['idbesoin']);
        }

        return true;
    }

/* FONCTION POUR FAIRE LA VALIDATION DU DG ET CREATION DE ANNONCE */
    public function saveValidationDG() {
        $checkrh = $this->input->post('checkrh');                               //récupération de statut de validation de besoin par rh
        $datevalidationrh = $this->input->post('datevalidationrh');             //récupération de date de validation de besoin par rh
        $datevalidationdg = $this->input->post('datevalidationdg');             //récupération de date de validation de besoin par dg
        $moyenne = $this->input->post('moyenne');                               //récupération de moyenne qui passe le QCM
        $idBesoin = $this->input->post('idbesoin');                             //récupération de id de besoin a valider
        $nomPoste = $this->input->post('nomPoste');                             //récupération de nom du poste sur annonce

        $valeurPost = array($datevalidationrh, $datevalidationdg, $moyenne, $checkrh, $idBesoin, $nomPoste);  //champs à check si vide
        $redirectPage = "besoin/C_Besoin/getDetailBesoin/".$idBesoin;           //page de redirection si misy vide
        $this->checkChampsVide($valeurPost, $redirectPage);                     //checking de champ vide

        //insertion de la validation du dge dans besoinvalide
        $checkInsertBesoinValide = $this->insertValidationDG($datevalidationrh, $datevalidationdg, $moyenne, $checkrh, $idBesoin, $nomPoste);
        $colonneAnnonce = [                                                      //colonne pour inserer dans la table annonce
            'datepublication' => $datevalidationdg,
            'titre' => "Recrutement pour le poste de ".$nomPoste,
            'idbesoin' => $idBesoin
        ];
        $checkInsertAnnonce = $this->insertAnnonce($colonneAnnonce);            //insertion de annonce
        
        redirect('besoin/C_Besoin/getListeBesoin');                   //redirection vers la fonction page_AjoutBesoin
    }
}
