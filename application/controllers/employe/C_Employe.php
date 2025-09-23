<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_Employe extends CI_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->model('dao_model', 'dao');
    }

/* FONCTION POUR AVOIR LA LISTE DES CANDIDATS QUI FONT UN ENTRETIEN */
    public function getListeEmploye() {
        $data['pageTitle'] = "Liste Employe";                       //titre de la page de destination
        $data['pageToLoad'] = "employe/Employe_List";                   //path de a page de destination

        $data['listeEmploye'] = $this->dao->select_all('v_employe'); //liste des besoins non valide
        
        $data['postes'] = $this->dao->select_all('poste');

		$this->load->view('home/Home', $data);                                      //page principale où on load les pages
    }

/* FONCTION POUR AVOIR LES DETAILS SUR LE CANDIDAT ET POSTE A ENTRETIEN */
    public function getDetailRenew($idRenew, $statut = null) {
        $data['pageTitle'] = "Detail Candidat Renew";                       //titre de la page de destination
        $pageToload = "renew/Renew_Detail";
        if (!empty($statut)) {
            $pageToload = "renew/Renew_Embauche";
        }
        $data['pageToLoad'] = $pageToload;                   //path de a page de destination

        $condition = [ 'idrenouvellement' => $idRenew];
        $data['detailRenew'] = $this->dao->select_where('v_candidatentretien', $condition);
        $data['contrats'] = $this->dao->select_all('contrat');

		$this->load->view('home/Home', $data);                                      //page principale où on load les pages
    }

    public function getSqlFiltre($posteChoosed) {
        $sqlPoste = "idposte ='".$posteChoosed."'";

        $sql = "";

        if (!empty($posteChoosed)) {
            $sql = "SELECT * FROM v_employe WHERE ".$sqlPoste;
        } else {
            $this->session->set_flashdata('checkValidation', [      //on fait revenir vers la page d'insertion avec un popup d'erreur 
                    'message' => "Selectionner au moins 1 filtre !"   //message de validation pour page Validation.php
            ]); 
            redirect('employe/C_Employe/getListeEmploye');                                //redirection vers la fonction page_AjoutBesoin
        }

        return $sql;
    }

    public function filtre() {
        $data['pageTitle'] = "Liste Employe";                       //titre de la page de destination
        $data['pageToLoad'] = "employe/Employe_List";                   //path de a page de destination 
        
        $data['postes'] = $this->dao->select_all('poste');

        $posteChoosed = $this->input->get('posteChoosed');              //poste choisi au filtre

        $sql = $this->getSqlFiltre($posteChoosed);
        $data['listeCandidatEntretien'] = $this->dao->executeQuery($sql);     //detail concernant l'annonce
        
		$this->load->view('home/Home', $data);                          //page principale où on load les pages
    }

/* FONCTION POUR RECALLER UN CANDIDAT A ENTRETIEN */
    public function refuserCandidat($idCandidat) {
        $to_insert = [
            'idcandidat' => $idCandidat,
            'libelle_etape' => "Essai 6 mois"
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

        redirect('essai/C_Renew/getListeRenew');                   //redirection vers la fonction page_AjoutBesoin
    }

    public function embaucheCandidat() {
        $idCandidat = $this->input->post('idcandidat');             //récupération de date de validation de besoin
        $nom = $this->input->post('nom');             //récupération de date de validation de besoin
        $prenom = $this->input->post('prenom');             //récupération de date de validation de besoin
        $email = $this->input->post('email');             //récupération de date de validation de besoin
        $adresse = $this->input->post('adresse');             //récupération de date de validation de besoin
        $dtn = $this->input->post('dtn');             //récupération de date de validation de besoin
        $datefin = $this->input->post('datefin');             //récupération de date de validation de besoin
        $idPoste = $this->input->post('poste'); 
        $idContrat = $this->input->post('contrat'); 
        
        $to_insert = [
            'email' => $email,
            'nom' => $nom,
            'prenom' => $prenom,
            'adresse' => $adresse,
            'dtn' => $dtn,
            'date_embauche' => $datefin,
            'idposte' => $idPoste,
            'idcandidat' => $idCandidat,
            'idcontrat' => $idContrat
        ];
        $checkInsert = $this->dao->insert_into('employe', $to_insert);   //insertion dans la table candidatrefuse
            if ($checkInsert !== false) {                                    //si la valeur de $inserted n'est pas null alors insertion réussi
                $this->session->set_flashdata('checkValidation', [          //redirect vers page d'insertion + popup de validation de insertion réussi
                    'message' => "Candidat embauché !"        //message de validation pour page Validation.php
                    ]);
            } else {                                                    //si la valeur de $inserted est pas null alors insertion raté                
                $this->session->set_flashdata('checkValidation', [          //redirect vers page d'insertion + popup de validation de insertion raté
                    'message' => "Echec de la validation de embauche !"                 //message de validation pour page Validation.php
                ]);
            }

        redirect('essai/C_Renew/getListeRenew');                   //redirection vers la fonction page_AjoutBesoin
    }
}
