<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_Entretien extends CI_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->model('dao_model', 'dao');
    }

/*  ========================================================================================================================== A PROPOS DE LISTER LES DEMNDES DE BESOINS*/
/* FONCTION POUR AVOIR LA LISTE RESULTATS DES QCM */
    public function getListeEntretien() {
        $data['pageTitle'] = "Résultats QCM";
        $data['pageToLoad'] = "question/ResultatQCM";

        // // Get the validated "besoin"
        // $condition = [
        //     'checkdg' => 't',
        //     'statutpostulation' => 'f',
        // ];
        // $this->db->where($condition);
        // $this->db->where('datevalidationdg IS NOT NULL');

        // $besoin_valide = $this->dao->select_where('besoinvalide', []);
        // // var_dump($besoin_valide);
        $resultats = [];

            $qcmWaiting = array();
        $besoin_valide = $this->dao->select_all('v_annonce');
        // var_dump($besoin_valide);
        foreach ($besoin_valide as $besoin) {
            $conditions = [
                'note >=' => $besoin['averagenoteqcm'],
                'idbesoin' => $besoin['idbesoin']
            ];

            $qcm_results = $this->dao->select_where('v_detailqcm', $conditions);
            // Loop through each candidate result to check "waiting"
            foreach ($qcm_results as $qcm) {
                $check_conditions = [
                    'idcandidat' => $qcm['idcandidat'],
                    'idannonce' => $qcm['idannonce']
                ];

                $check_waiting = $this->dao->select_where('entretien', $check_conditions);

                // Pour le bouton 'donner entretien' ou 'attente d'entretien
                $qcm = !empty($check_waiting) ? 1 : 0;
                    array_push($qcmWaiting, $qcm);
            }

            $resultats = array_merge($resultats, $qcm_results);
        }

        $data['resultats'] = $resultats;
        $data['qcmWaiting'] = $qcmWaiting;


        $this->load->view('home/Home', $data);
    }



    public function ajoutEntretien(){
        $idnoteqcm = $this->input->post('idnoteqcm');
        $idannonce = $this->input->post('idannonce');
        $idcandidat = $this->input->post('idcandidat');
        //date d'entretien
        $date_entretien = $this->input->post('dateentretien');

        $to_insert = [
            'date_entretien' => $date_entretien,
            'idcandidat' => $idcandidat,
            'idannonce' => $idannonce
        ];
        $check_insert = $this->dao->insert_into('entretien', $to_insert);
        if($check_insert !== null){
            $to_insert = [
                'type_invoice' => 'entretien',
                'description_invoice' => 'Vous êtes invités à passer un entretien au siège de notre société le '.$date_entretien,
                'idcandidat' => $idcandidat
            ];
            $this->dao->insert_into('invoice_client', $to_insert);
        }else{
            $this->session->set_flashdata('checkValidation', [          //redirect vers page d'insertion + popup de validation de insertion raté
                'message' => "Echec de la validation de la demande de besoin !"                 //message de validation pour page Validation.php
            ]);
        }
            redirect('annonce/C_Entretien/getListeEntretien');
    }

    // Fonction qui get l'invoice de l'utilisateur connécté
    public function getInvoice(){
        $data['pageTitle'] = "Invoice";
        $data['pageToLoad'] = "home/InvoiceCLI";

        $userInfo = $this->session->userdata('connectedUser');

        $conditions = [
            'idcandidat' => $userInfo['idcandidat']
        ];
        $this->db->order_by('date_reception', 'ASC'); // Pour avoir les messages récents
        $data['invoices'] = $this->dao->select_where('invoice_client', $conditions);

		$this->load->view('home/Home', $data);                          //page principale où on load les pages
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
            redirect('annonce/C_Entretien/getListeEntretien');                                //redirection vers la fonction page_AjoutBesoin
        }

        return $sql;
    }

    public function filtre() {
        $data['pageTitle'] = "Liste Candidat Entretien";                       //titre de la page de destination
        $data['pageToLoad'] = "entretien/Entretien_List";                   //path de a page de destination

        $data['postes'] = $this->dao->select_all('poste');

        $posteChoosed = $this->input->get('posteChoosed');              //poste choisi au filtre

        $sql = $this->getSqlFiltre($posteChoosed);
        $data['listeCandidatEntretien'] = $this->dao->executeQuery($sql);     //detail concernant l'annonce
        
		$this->load->view('home/Home', $data);                          //page principale où on load les pages
    }


/* FONCTION POUR AVOIR LA LISTE DES CANDIDATS QUI FONT UN ENTRETIEN */
    public function getListeCandidat() {
        $data['pageTitle'] = "Liste Candidat Entretien";                       //titre de la page de destination
        $data['pageToLoad'] = "entretien/Entretien_List";                   //path de a page de destination

        $data['listeCandidatEntretien'] = $this->dao->select_all('v_candidatentretien'); //liste des besoins non valide
        $data['diplomes'] = $this->dao->select_all('diplome');
        $data['postes'] = $this->dao->select_all('poste');

		$this->load->view('home/Home', $data);                                      //page principale où on load les pages
    }

/* FONCTION POUR AVOIR LES DETAILS SUR LE CANDIDAT ET POSTE A ENTRETIEN */
    public function getDetailEntretien($idEntretien, $statut = null) {
        $data['pageTitle'] = "Detail Candidat Entretien";                       //titre de la page de destination
        $pageToload = "entretien/Entretien_Detail";
        if (!empty($statut)) {
            $pageToload = "entretien/Entretien_Embauche";
        }
        $data['pageToLoad'] = $pageToload;                   //path de a page de destination

        $condition = [ 'identretien' => $idEntretien];
        $data['detailEntretien'] = $this->dao->select_where('v_candidatentretien', $condition);
        
		$this->load->view('home/Home', $data);                                      //page principale où on load les pages
    }

/* FONCTION POUR RECALLER UN CANDIDAT A ENTRETIEN */
    public function refuserCandidat($idCandidat) {
        $to_insert = [
            'idcandidat' => $idCandidat,
            'libelle_etape' => "Entretien"
        ];
        $checkInsert = $this->dao->insert_into('candidatrefuse', $to_insert);   //insertion dans la table candidatrefuse
            if ($checkInsert !== false) {                                    //si la valeur de $inserted n'est pas null alors insertion réussi
                $this->session->set_flashdata('checkValidation', [          //redirect vers page d'insertion + popup de validation de insertion réussi
                    'message' => "Candidat recallé !"        //message de validation pour page Validation.php
                    ]);
            } else {                                                    //si la valeur de $inserted est pas null alors insertion raté                
                $this->session->set_flashdata('checkValidation', [          //redirect vers page d'insertion + popup de validation de insertion raté
                    'message' => "Echec de la validation de embauche !"                 //message de validation pour page Validation.php
                ]);
            }

        redirect('annonce/C_Entretien/getListeCandidat');                   //redirection vers la fonction page_AjoutBesoin
    }

    public function embaucheCandidat() {
        $idCandidat = $this->input->post('idcandidat');             //récupération de date de validation de besoin
        $date_embauche = $this->input->post('date_embauche');             //récupération de date de validation de besoin
        $dateFinEssai = date('Y-m-d', strtotime($date_embauche . ' +3 months'));
        $to_insert = [
            'datedebut' => $date_embauche,
            'datefin' => $dateFinEssai,
            'idcandidat' => $idCandidat
        ];
        $checkInsert = $this->dao->insert_into('essai', $to_insert);   //insertion dans la table candidatrefuse
            if ($checkInsert !== false) {                                    //si la valeur de $inserted n'est pas null alors insertion réussi
                $this->session->set_flashdata('checkValidation', [          //redirect vers page d'insertion + popup de validation de insertion réussi
                    'message' => "Candidat embauché !"        //message de validation pour page Validation.php
                    ]);
            } else {                                                    //si la valeur de $inserted est pas null alors insertion raté                
                $this->session->set_flashdata('checkValidation', [          //redirect vers page d'insertion + popup de validation de insertion raté
                    'message' => "Echec de la validation de embauche !"                 //message de validation pour page Validation.php
                ]);
            }

        redirect('annonce/C_Entretien/getListeCandidat');                   //redirection vers la fonction page_AjoutBesoin
    }
}
