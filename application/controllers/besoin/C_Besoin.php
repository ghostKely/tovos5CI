<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_Besoin extends CI_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->model('dao_model', 'dao');
    }

/*  ========================================================================================================================== A PROPOS DE AJOUT DE DEMANDE DE BESOINS */
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
    public function checkChampsVide($idPoste, $id_diplome, $idContrat, $nbrePeronnel, $experience, $description, $datedemande) {
        if (empty($idPoste) ||                                  //si une des valeurs dans l'insertion est nulle ou vide
            empty($id_diplome) ||
            empty($idContrat) ||
            empty($nbrePeronnel) ||
            empty($experience) ||
            empty($description) ||
            empty($datedemande)) {   
            $this->session->set_flashdata('checkValidation', [      //on fait revenir vers la page d'insertion avec un popup d'erreur 
                'message' => "Veuillez remplir tous les champs !"   //message de validation pour page Validation.php
            ]); 
            redirect('besoin/C_Besoin/page_AjoutBesoin');           //redirection vers la fonction page_AjoutBesoin
        } 
    }

/* FONCTION D'INSERTION D'UN BESOIN */
    public function saveBesoin() {
        $idPoste = $this->input->post('poste');                             //récupération de id de poste pour besoin
        $id_diplome = $this->input->post('diplome');                        //récupération de id de diplome minimum 
        $idContrat = $this->input->post('contrat');                         //récupération de id de contrat
        $nbrePeronnel = $this->input->post('nbrepersonnel');                //récupération de la nombre de personnel a engager
        $experience = $this->input->post('experience');                     //récupération de année d'experience recquis pour poste
        $description = $this->input->post('description');                   //récupération de description du travail pour poste
        $datedemande = $this->input->post('datedemande');                   //récupération de date quand on a fait la demande de besoin
        $id = $this->session->userdata('id');                               //récupération de id de la personne log

        // $checkPlusieursBesoins = $this->input->post('multipleInsertion');   //récupération de valeur de mulitpleinsertion pour check si on doit faire plusieurs isnertions ou non
       
        $this->checkChampsVide($idPoste, $id_diplome, $idContrat, $nbrePeronnel, $experience, $description, $datedemande);  //verification s'il n'y aucun champ vide

        //creation du tableau pour la requete
            $to_insert = [                             
                'nombre_employe' => $nbrePeronnel,
                'description' => $description,
                'annee_experience' => $experience,
                'datebesoin' => $datedemande,
                'idmanager' => $id,
                'id_diplome' => $id_diplome,
                'idcontrat' => $idContrat,        
                'idposte' => $idPoste
            ];
            $checkInsert = $this->dao->insert_into('besoin', $to_insert);   //retour de id de insertion si insertion réussi ($inserted != null)
             
            if ($inserted !== false) {                                    //si la valeur de $inserted n'est pas null alors insertion réussi
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
/* FONCTION POUR AVOIR LA LISTE DES BESOINS ENCORE NON VALIDER 
    ARGUMENTS : 
        - $checkValidation (tableau) : 
            .case 0 : champ vide            => message : Veiullez remplir tous les champs !
            .case 1 : insertion réussie     => message : Votre demande a été enregistrée !
            .case 2 : insertion raté        => message : Votre demande a echoué !
            .case 3 : redirection de page   => message : Aucun message
            .case 4 : insertion de validation de demande ratée => message : Date Invalide!
*/
    public function getListeBesoinNonValide($checkValidation = 3){
        $data['pageTitle'] = "Liste Besoins";                       //titre de la page de destination
        $data['pageToLoad'] = "besoin/Besoin_List";                 //path de a page de destination
        $data['checkValidation'] = $checkValidation;                //tableau contenant int de validation avec le message qui lui correspond
        
        $data['listeBesoin'] = $this->dao->select_all("v_besoinnonvalide");        //liste des besoins non valide
        
		$this->load->view('home/Home', $data);                                      //page principale où on load les pages
    }

/* ========================================================================================================================== A PROPOS DE VALIDATION DE BESOINS PAR RH */
/* FONCTION POUR AVOIR LES DETAILS D'UNE DEMANDE DE BESOIN SUR UN MATERIEL 
    ARGUMENT :
        - $id_materiel : id du matériel pour lequel on veut voir les détails des demandes
*/
    public function getDetailBesoin($idBesoin) {
        $data['pageTitle'] = "Détails Besoins";                                 //titre de la page de destination
        $data['pageToLoad'] = "besoin/Besoin_Detail";                           //path de a page de destination

        $condition = ['idbesoin' => $idBesoin];
        $data['detailBesoin'] = $this->dao->select_where("v_besoinnonvalide", $condition);     //liste des besoins non valide

		$this->load->view('home/Home', $data);                                  //page principale où on load les pages
    }    
}
