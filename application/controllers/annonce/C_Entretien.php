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

        // Get the validated "besoin"
        $condition = [
            'checkdg' => 't',
            'statutpostulation' => 'f',
        ];
        $this->db->where($condition);
        $this->db->where('datevalidationdg IS NOT NULL');

        $besoin_valide = $this->dao->select_where('besoinvalide', []);

        $resultats = [];

        foreach ($besoin_valide as $besoin) {
            $conditions = [
                'note >=' => $besoin['averagenoteqcm'],
                'idbesoin' => $besoin['idbesoin']
            ];

            $qcm_results = $this->dao->select_all('v_detailqcm', $conditions);

            // Loop through each candidate result to check "waiting"
            foreach ($qcm_results as &$qcm) {
                $check_conditions = [
                    'idcandidat' => $qcm['idcandidat'],
                    'idannonce' => $qcm['idannonce']
                ];

                $check_waiting = $this->dao->select_where('entretien', $check_conditions);

                // Pour le bouton 'donner entretien' ou 'attente d'entretien
                $qcm['waiting'] = !empty($check_waiting) ? 1 : 0;
            }

            $resultats = array_merge($resultats, $qcm_results);
        }

        $data['resultats'] = $resultats;

        $this->load->view('home/Home', $data);
    }



    public function ajoutEntretien(){
        $idnoteqcm = $this->input->post('idnoteqcm');

        $conditions = [
            'idnoteqcm' => $idnoteqcm
        ];
        $entretien_information = $this->dao->select_where('v_detailqcm', $conditions);

        //date d'entretien
        $date_entretien = $this->input->post('dateentretien');

        $to_insert = [
            'date_entretien' => $date_entretien,
            'idcandidat' => $entretien_information[0]['idcandidat'],
            'idannonce' => $entretien_information[0]['idannonce']
        ];
        $check_insert = $this->dao->insert_into('entretien', $to_insert);
        
        if($check_insert !== null){
            $to_insert = [
                'type_invoice' => 'entretien',
                'description_invoice' => 'Vous êtes invités à passer un entretien au siège de notre société le '.$date_entretien,
                'idcandidat' => $entretien_information[0]['idcandidat']
            ];
            $this->dao->insert_into('invoice_client', $to_insert);

            redirect('annonce/C_Entretien/getListeEntretien');
        }else{
            $this->session->set_flashdata('error_msg', 'Impossible d\'ajouter l\'entretien. Veuillez réessayer.');
            redirect('annonce/C_Entretien/getListeEntretien'); 
        }
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


}
