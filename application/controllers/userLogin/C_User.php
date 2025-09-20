<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_User extends CI_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->model('dao_model', 'dao');
    }

/*  ========================================================================================================================== */
/* FONCTION POUR VERIFIER AVOIR LA TABLE OU ON PREND LE LOGIN
    ARGUMENTS : 
        .case 1 : login as RH => table rh
        .case 2 : login as manager => table manager
        .case 3 : login as dg => table dg
*/
    public function getTableUser($logAsValue) {
        if ($logAsValue == 1) { return "manager"; }
        else if ($logAsValue == 2) { return "rh"; }
        else if ($logAsValue == 3) { return "dg"; }
    }

/* FONCTION POUR VERIFIER LES INFORMATIONS DE LOGIN
    ARGUMENTS : 
        .$logAsValue : determine la table dans laquelle on va verifier email et mdp
*/
    public function loginAs($logAsValue){
        $data['pageTitle'] = "Connexion";                       //titre de la page de destination
        $data['pageToLoad'] = "userLogin/Login";                //path de a page de destination
        $data['logAsValue'] = $logAsValue;                      //1, 2, 3
		$this->load->view('home/Home', $data);                  //page principale où on load les pages
    }

    /* FONCTION POUR VERIFIER LES INFORMATIONS DE LOGIN
    ARGUMENTS : 
        .$logAsValue : determine la table dans laquelle on va verifier email et mdp
    */

    public function loginAsCandidat($logAsValue){
        $data['pageTitle'] = "Connexion";                       //titre de la page de destination
        $data['pageToLoad'] = "userLogin/LoginCandidat";                //path de a page de destination
        $data['logAsValue'] = $logAsValue;                      //10
		$this->load->view('home/Home', $data);                  //page principale où on load les pages
    }

    /* FONCTION POUR S'INSCRIRE EN TANT QUE CANDIDAT
    ARGUMENTS : 
        .$logAsValue : determine la table dans laquelle on va verifier email et mdp
    */

    public function inscriptionAs($logAsValue){
        $data['pageTitle'] = "Inscription";                       //titre de la page de destination
        $data['pageToLoad'] = "userLogin/signin";                //path de a page de destination
        $data['logAsValue'] = $logAsValue;                      //10
        
        $data['diplomes'] = $this->dao->select_all('diplome');

		$this->load->view('home/Home', $data);                  //page principale où on load les pages
    }

    public function signIn(){
        $config['upload_path'] = './upload/pdfs/';
        $config['allowed_types'] = 'pdf';
        $config['max_size'] = 10000;

        $this->load->library('upload', $config);

        if(!$this->upload->do_upload('pdfCandidat')){
            echo $this->upload->display_errors();
        }else{
            $data = $this->upload->data();

            $file_path = 'upload/pdfs/'.$data['file_name'];

            $to_insert=[
                'email' => $this->input->post('mailCandidat'),
                'nom' => $this->input->post('nomCandidat'),
                'prenom' => $this->input->post('prenomCandidat'),
                'adresse' => $this->input->post('adresseCandidat'),
                'dtn' => $this->input->post('dtnCandidat'),
                'id_diplome' => $this->input->post('diplome'),
                'renseignement' => $this->input->post('rsgnCandidat'),
                'totalanne_experience' => $this->input->post('expCandidat'),
                'file_path' => $file_path
            ];

            $inserted = $this->dao->insert_into('candidat', $to_insert);

            if ($inserted !== false) {                                    //si la valeur de $inserted n'est pas null alors insertion réussi
                redirect('C_Home');
            } else {                                                    //si la valeur de $inserted est pas null alors insertion raté                
                $this->session->set_flashdata('checkValidation', [          //redirect vers page d'insertion + popup de validation de insertion raté
                    'message' => "Votre inscription a échoué"                 //message de validation pour page Validation.php
                ]);
            }
        }
    }

/* FONCTION POUR VERIFIER SI USER A REMPLI TOUS LES CHAMPS
        SI 1 SEUL VIDE ALORS REDIRECTION
*/
    public function checkChampsVide($email, $mdp, $logAsValue) {
        if (empty($email) || empty($mdp)) {
            $this->session->set_flashdata('checkValidation', [                          //redirect vers page de login + popup de validation de login fail
                'message' => "Veuillez remplir tous les champs !"    //message de validation pour page Validation.php
            ]);
            redirect('userLogin/C_User/loginAs/'.$logAsValue);                          //redirection vers page de login
        }
    }

/* FONCTION POUR RECUPERER LES INFORMATIONS DE LA BASE DE DONNEE */
    public function checkLogs($email, $mdp, $tableUser) {
        $sql = "SELECT *
                FROM ".$tableUser.
                " WHERE email='".$email."'
                 AND mdp='".$mdp."'";                           //requete pour avoir les infromations de user dans BDD
                 
        $data['infoUser'] = $this->dao->executeQuery($sql);     //contient les colonnes demandée dans requête
        
        if (empty($data['infoUser'])) {                         //si vide => erreur authentification (email / mot de passe)
            return false;                                       
        }

        return $data['infoUser'];
    }

/* FONCTION D'AUTHENTIFICATION POUR LES USERS
        Vérification de l'email et du mot de passe
*/
    public function authentification() {
        $email = strtolower($this->input->post('emailUser'));       //recup de email de user
        $mdp = $this->input->post('mdpUser');                       //recup de mdp de user
        $logAsValue = $this->input->post('logValue');               //recup de logvalue (1/2/3)
        $tableUser = $this->getTableUser($logAsValue);              //table où se trouve les logs de user

        $this->checkChampsVide($email, $mdp, $logAsValue);          //checking des informations user is misy champ vide

        $userExist = $this->checkLogs($email, $mdp, $tableUser);    //checking des informations user
        if ($userExist === false) {
            $this->session->set_flashdata('checkValidation', [                          //redirect vers page de login + popup de validation de login fail
                'message' => "Erreur d'authentification ! Vérifier vos informations"    //message de validation pour page Validation.php
            ]);
            redirect('userLogin/C_User/loginAs/'.$logAsValue);                   //redirection vers page de login
        } else {
            $this->session->set_userdata('logValue', $logAsValue);               //mise en session de la valeur de logAsValue (1/2/3) pour les navbar
            $colonne = "id".$tableUser;
            $this->session->set_userdata('id', $userExist[0][$colonne]);         //mise en session de la valeur de id 
            redirect('C_Home');
        }
    }

    public function authCandidat() {
        $email = $this->input->post('emailUser');       //recup de email de user
        $nom = $this->input->post('nomUser');                       //recup de nom de user
        $prenom = $this->input->post('prenomUser');                       //recup de prenom de user
        $logAsValue = $this->input->post('logValue');               //recup de logvalue (10)

        $conditions = [
            'email' => $email,
            'nom' => $nom,
            'prenom' => $prenom
        ];

        $userdata = $this->dao->select_where('candidat', $conditions);
        $user = $userdata[0];
        
        if (!empty($userdata)) {
            $user = $userdata[0];
        
            $this->session->set_userdata('connectedUser', $user);
            $this->session->set_userdata('logValue', $logAsValue);  
            redirect('C_Home');
        } else {
            redirect('userLogin/C_User/authCandidat');
        }
    }

/* FONCTION DE DECONNEXION 
        DETRUIT TOUTES LES DONNEES DE LA SESSION EXISTANTE
*/
    public function disconnect() {
        $this->session->unset_userdata('logValue');
        redirect('C_Home');
    }

    public function disconnectCandidat() {
        $this->session->unset_userdata('logValue');
        $this->session->unset_userdata('connectedUser');
        redirect('C_Home');
    }


    
}
