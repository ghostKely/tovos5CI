<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_Annonce extends CI_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->model('dao_model', 'dao');
    }

/*  ========================================================================================================================== A PROPOS DE LISTER LES DEMNDES DE BESOINS*/
/* FONCTION POUR AVOIR LA LISTE DES BESOINS POUR MANAGER/RH/DG */
    public function getListeAnnonce(){
        $data['pageTitle'] = "Liste Annonces";                          //titre de la page de destination
        $data['pageToLoad'] = "annonce/Annonce_List";                   //path de a page de destination
        
        $data['listeAnnonce'] = $this->dao->select_all('v_annonce');      //liste des besoins non valide

        $data['diplomes'] = $this->dao->select_all('diplome');
        $data['postes'] = $this->dao->select_all('poste');
        $data['posteSelected'] = 0;

		$this->load->view('home/Home', $data);                          //page principale où on load les pages
    }

/* FONCTION POUR AVOIR LES DETAILS D'UNE ANNONCE */
    public function getDetailAnnonce($idAnnonce) {
        $data['pageTitle'] = "Details Annonce";                         //titre de la page de destination
        $data['pageToLoad'] = "annonce/Annonce_Detail";                 //path de a page de destination

        $condition = [ 'idannonce' => $idAnnonce ];
        $data['detailAnnonce'] = $this->dao->select_where('v_annonce', $condition);     //detail concernant l'annonce
<<<<<<< HEAD
=======

        $idCandidat = $this->session->userdata('connectedUser')['idcandidat'];
        $conditions = [
            'idcandidat' => $idCandidat,
            'idannonce' => $idAnnonce
        ];
        $data['qcm'] = $this->dao->select_where('v_detailqcm', $conditions);
>>>>>>> entretien
        
		$this->load->view('home/Home', $data);                          //page principale où on load les pages
    }

    public function getSqlFiltre($posteChoosed, $diplomeChoosed, $min, $max) {
        $sqlExp = "annee_experience>=".$min." AND annee_experience<=".$max;
        $sqlPoste = "idposte ='".$posteChoosed."'";
        $sqlDiplome = "id_diplome ='".$diplomeChoosed."'";

        $sql = "";

        if (!empty($posteChoosed) && !empty($diplomeChoosed) && !empty($min) && !empty($max)) {
            //tous
            $sql = "SELECT * FROM v_annonce WHERE ".$sqlPoste." AND ".$sqlDiplome." AND ".$sqlExp;
        } else if (!empty($posteChoosed) && empty($diplomeChoosed) && empty($min) && empty($max)) {
            //poste / pas d'experience & diplome
            $sql = "SELECT * FROM v_annonce WHERE ".$sqlPoste;
        } else if (!empty($posteChoosed) && !empty($diplomeChoosed) && empty($min) && empty($max)) {
            //poste & diplome / pas exp 
            $sql = "SELECT * FROM v_annonce WHERE ".$sqlPoste." AND ".$sqlDiplome;
        } else if (!empty($posteChoosed) && empty($diplomeChoosed) && !empty($min) && !empty($max)) {
            //poste & exp / pas de diplome
            $sql = "SELECT * FROM v_annonce WHERE ".$sqlPoste." AND ".$sqlExp;
        } else if (empty($posteChoosed) && !empty($diplomeChoosed) && empty($min) && empty($max)) {
            //diplome / pas de poste & exp
            $sql = "SELECT * FROM v_annonce WHERE ".$sqlDiplome;
        } else if (empty($posteChoosed) && !empty($diplomeChoosed) && !empty($min) && !empty($max)) {
            //diplome & exp / pas de poste
            $sql = "SELECT * FROM v_annonce WHERE ".$sqlDiplome." AND ".$sqlExp;
        } else if (empty($posteChoosed) && empty($diplomeChoosed) && !empty($min) && !empty($max)) {
            //exp / pas de diplome & poste
            $sql = "SELECT * FROM v_annonce WHERE ".$sqlExp;
        } else if (empty($posteChoosed) && empty($diplomeChoosed) && empty($min) && empty($max)) {
            $this->session->set_flashdata('checkValidation', [      //on fait revenir vers la page d'insertion avec un popup d'erreur 
                    'message' => "Selectionner au moins 1 filtre !"   //message de validation pour page Validation.php
            ]); 
            redirect('annonce/C_Annonce/getListeAnnonce');                                //redirection vers la fonction page_AjoutBesoin
        }

        return $sql;
    }

    public function filtreAnnonce() {
        $data['pageTitle'] = "Liste Annonces";                          //titre de la page de destination
        $data['pageToLoad'] = "annonce/Annonce_List";                   //path de a page de destination

        $data['diplomes'] = $this->dao->select_all('diplome');
        $data['postes'] = $this->dao->select_all('poste');

        $posteChoosed = $this->input->get('posteChoosed');              //poste choisi au filtre
        $diplomeChoosed = $this->input->get('diplomeChoosed');          //diplome choisi au filtre
        $min = $this->input->get('min');                                //min exp choisi au filtre
        $max = $this->input->get('max');                                //max exp choisi au filtre

        $sql = $this->getSqlFiltre($posteChoosed, $diplomeChoosed, $min, $max);
        $data['listeAnnonce'] = $this->dao->executeQuery($sql);     //detail concernant l'annonce
        
		$this->load->view('home/Home', $data);                          //page principale où on load les pages
    }

}
