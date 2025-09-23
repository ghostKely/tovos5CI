<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_Essai extends CI_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->model('dao_model', 'dao');
    }

/* FONCTION POUR AVOIR LA LISTE DES CANDIDATS QUI FONT UN ENTRETIEN */
    public function getListeEssai() {
        $data['pageTitle'] = "Liste Candidat Essai";                       //titre de la page de destination
        $data['pageToLoad'] = "essai/Essai_List";                   //path de a page de destination

        $sql = "SELECT * FROM v_candidatentretien WHERE idessai IS NOT NULL";
        $data['listeCandidatEssai'] = $this->dao->executeQuery($sql); //liste des besoins non valide
        
        $data['diplomes'] = $this->dao->select_all('diplome');
        $data['postes'] = $this->dao->select_all('poste');

		$this->load->view('home/Home', $data);                                      //page principale où on load les pages
    }

/* FONCTION POUR AVOIR LES DETAILS SUR LE CANDIDAT ET POSTE A ENTRETIEN */
    public function getDetailEssai($idEssai, $statut = null) {
        $data['pageTitle'] = "Detail Candidat Essai";                       //titre de la page de destination
        $pageToload = "essai/Essai_Detail";
        if ($statut == 2) {
            $pageToload = "essai/Essai_Embauche";
        } else if ($statut == 1) {
            $pageToload = "essai/Essai_EmbaucheDef";
            $data['contrats'] = $this->dao->select_all('contrat');
        }
        $data['pageToLoad'] = $pageToload;                   //path de a page de destination

        $condition = [ 'idessai' => $idEssai];
        $data['detailEssai'] = $this->dao->select_where('v_candidatentretien', $condition);
        
		$this->load->view('home/Home', $data);                                      //page principale où on load les pages
    }
    
    public function getSqlFiltre($posteChoosed) {
        $sqlPoste = "idposte ='".$posteChoosed."'";

        $sql = "";

        if (!empty($posteChoosed)) {
            $sql = "SELECT * FROM v_candidatentretien WHERE ".$sqlPoste;
        } else {
            $this->session->set_flashdata('checkValidation', [      //on fait revenir vers la page d'insertion avec un popup d'erreur 
                    'message' => "Selectionner au moins 1 filtre !"   //message de validation pour page Validation.php
            ]); 
            redirect('annonce/C_Annonce/getListeAnnonce');                                //redirection vers la fonction page_AjoutBesoin
        }

        return $sql;
    }

    public function filtre() {
        $data['pageTitle'] = "Liste Candidat Essai";                       //titre de la page de destination
        $data['pageToLoad'] = "essai/Essai_List";                   //path de a page de destination

        $data['postes'] = $this->dao->select_all('poste');

        $posteChoosed = $this->input->get('posteChoosed');              //poste choisi au filtre

        $sql = $this->getSqlFiltre($posteChoosed);
        $data['listeCandidatEssai'] = $this->dao->executeQuery($sql);     //detail concernant l'annonce
        
		$this->load->view('home/Home', $data);                          //page principale où on load les pages
    }

/* FONCTION POUR RECALLER UN CANDIDAT A ENTRETIEN */
    public function refuserCandidat($idCandidat) {
        $to_insert = [
            'idcandidat' => $idCandidat,
            'libelle_etape' => "Essai 3 mois"
        ];
        $checkInsert = $this->dao->insert_into('candidatrefuse', $to_insert);   //insertion dans la table candidatrefuse
            if ($checkInsert !== false) {                                    //si la valeur de $inserted n'est pas null alors insertion réussi
                $this->session->set_flashdata('checkValidation', [          //redirect vers page d'insertion + popup de validation de insertion réussi
                    'message' => "Candidat viré !"        //message de validation pour page Validation.php
                    ]);
            } else {                                                    //si la valeur de $inserted est pas null alors insertion raté                
                $this->session->set_flashdata('checkValidation', [          //redirect vers page d'insertion + popup de validation de insertion raté
                    'message' => "Echec de la validation de embauche !"                 //message de validation pour page Validation.php
                ]);
            }

        redirect('essai/C_Essai/getListeEssai');                   //redirection vers la fonction page_AjoutBesoin
    }

    public function embaucheCandidat() {
        $idCandidat = $this->input->post('idcandidat');             //récupération de date de validation de besoin
        $dateFinEssai = $this->input->post('datefin');             //récupération de date de validation de besoin
        $dateFinRenew = date('Y-m-d', strtotime($dateFinEssai . ' +3 months'));
        $to_insert = [
            'datedebut' => $dateFinEssai,
            'datefin' => $dateFinRenew,
            'idcandidat' => $idCandidat
        ];
        $checkInsert = $this->dao->insert_into('renouvellement', $to_insert);   //insertion dans la table candidatrefuse
            if ($checkInsert !== false) {                                    //si la valeur de $inserted n'est pas null alors insertion réussi
                $this->session->set_flashdata('checkValidation', [          //redirect vers page d'insertion + popup de validation de insertion réussi
                    'message' => "Candidat renouvellé !"        //message de validation pour page Validation.php
                    ]);
            } else {                                                    //si la valeur de $inserted est pas null alors insertion raté                
                $this->session->set_flashdata('checkValidation', [          //redirect vers page d'insertion + popup de validation de insertion raté
                    'message' => "Echec de la validation du renouvellement !"                 //message de validation pour page Validation.php
                ]);
            }

        redirect('essai/C_Essai/getListeEssai');                   //redirection vers la fonction page_AjoutBesoin
    }
}
