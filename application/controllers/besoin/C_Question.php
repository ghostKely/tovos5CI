<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_Question extends CI_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->model('dao_model', 'dao');
    }

/* FONCTION POUR REDIRIGER VERS L'AJOUT DE QUESTION POUR UN BESOIN */
    public function pageAddQuestionBesoin($idBesoin) {
        $data['pageTitle'] = "Ajout Question";                      //titre de la page de destination
        $data['pageToLoad'] = "question/Question_Add";              //path de a page de destination
        $data['idBesoin'] = $idBesoin;                              //besoin a laquelle correspnd les qcm

		$this->load->view('home/Home', $data);                      //page principale où on load les pages
    }

/* FONCTION POUR CHECKER SI L'UN DES CHAMPS EST NULL */
    public function checkChampsVide($questions, $reponses, $idBesoin) {
        if (empty($questions) ||                                  //si une des valeurs dans l'insertion est nulle ou vide
            empty($reponses) ||
            empty($idBesoin)) {   
            $this->session->set_flashdata('checkValidation', [      //on fait revenir vers la page d'insertion avec un popup d'erreur 
                'message' => "Veuillez remplir tous les champs !"   //message de validation pour page Validation.php
            ]); 
            redirect('besoin/C_Besoin/page_AjoutBesoin');           //redirection vers la fonction page_AjoutBesoin
        } 
    }

/* FONCTION POUR INSERER CHAQUE QUESTION */
    public function insertQuestion($questions, $idBesoin) { 
        foreach ($questions as $question) {                                                 //recuperation de question une par une
            $to_insert = [                                  
                'question' => $question,
                'idbesoin' => $idBesoin
            ];
            $checkInsert = $this->dao->insert_into('question', $to_insert);                 //insertion d'une question
            if ($checkInsert === false) {
                $this->session->set_flashdata('checkValidation', [                          //redirect vers page d'insertion + popup de validation de insertion ts nety
                    'message' => "Questionnaire non créé, Erreur lors de l'insertion !"     //message de validation pour page Validation.php
                    ]);
                redirect('besoin/C_Question/pageAddQuestionBesoin/'.$idBesoin); 
            }
        }
        return true;
    }

/* FONCTION QUI RECUPERE LES QUESTIONS QUI VIENNENT D'ETRE INSERER */
    public function getLastQuestion($questions, $idBesoin) {
        $sql = "SELECT idQuestion, question, datecreation
            FROM Question
            WHERE idBesoin = '".$idBesoin."' 
            ORDER BY datecreation ASC";
        $questionList = $this->dao->executeQuery($sql);         //recup la liste des questions qui viennent d'etre inserer

        return $questionList;                                   //toutes les colonnes concernant les questions
    }

/* FOCNTION POUR CHECK SI LA REPONSE EXISTE */
    public function checkIfReponseExist($reponses, $vrais, $idBesoin) {
        $tableau = array();                                         
        for ($j=0; $j<sizeof($reponses); $j++) {
            $reponse = $reponses[$j];                       //la liste de reponses a une question
            $tableau[$j] = false;                           //on suppose que la reponse n'existe pas de base
            for ($i=0; $i<sizeof($reponse); $i++) {
                if ($i == $vrais[$j]-1) {                   //si la valeur de vrai(reponse vrai) - 1 & indice de la reponse sont egaux => reponse vrai
                    $tableau[$j] = true;                    //si la reponse existe
                } 
            }
        }

        foreach ($tableau as $existOrNot) {
            if ($existOrNot === false) {
                $this->session->set_flashdata('checkValidation', [                                      //redirect vers page d'insertion + popup de validation de insertion ts nety
                    'message' => "Questionnaire non créé, Réponse inexistante pour une question !"      //message de validation pour page Validation.php
                    ]);
                redirect('besoin/C_Question/pageAddQuestionBesoin/'.$idBesoin); 
            }
        }

        return true;
    }

/* FONCTION POUR INSERER LES REPONSES CORRESPONDANT AUX QUESTIONS */
    public function insertReponse($questionList, $reponses, $vrais) {
        for ($j=0; $j<sizeof($reponses); $j++) {
            $reponse = $reponses[$j];                                                           //la liste de reponses a une question
            for ($i=0; $i<sizeof($reponse); $i++) {
                $vraiFaux = false;                                                              //valeur par defaut de vrai ou faux (faux par defaut)
                if ($i == $vrais[$j]-1) {                                                       //si la valeur de vrai(reponse vrai) - 1 & indice de la reponse sont egaux => reponse vrai
                    $vraiFaux = true;                                                           //valeur de reponse true
                }
                $to_insert = [                                  
                    'reponse' => $reponse[$i],                                                  //une reponse a la question[$j]
                    'vraifaux' => $vraiFaux,                                                    //valeur si la reponse est vrai ou fausse
                    'idquestion' => $questionList[$j]['idquestion']                             //id de la question
                ];
                $checkInsert = $this->dao->insert_into('reponse', $to_insert);                 //insertion d'une reponse
                if ($checkInsert === false) {
                    $this->session->set_flashdata('checkValidation', [                          //redirect vers page d'insertion + popup de validation de insertion ts nety
                        'message' => "Reponse non créé, Erreur lors de l'insertion !"           //message de validation pour page Validation.php
                        ]);
                    redirect('besoin/C_Question/pageAddQuestionBesoin/'.$idBesoin); 
                }
            }
        }
        return true;
    }

/* FONCTION D'INSERTION D'UN BESOIN */
    public function saveQCM() {
        $questions = $this->input->post('question');                        //récupération de la liste de question
        $reponses = $this->input->post('reponses');                         //récupération de la liste de reponse
        $vrais = $this->input->post('vrai');                                //récupération de la liste de bonne reponse
        $idBesoin = $this->input->post('idBesoin');                         //récupération de id besoin pour qcm

        $checkIfReponseExist = $this->checkIfReponseExist($reponses, $vrais, $idBesoin);    //checking si la bonne reponse existe vraiment
        $CheckInsertQueston = $this->insertQuestion($questions, $idBesoin);                 //insertion des question pour QCM     
        $questionList = $this->getLastQuestion($questions, $idBesoin);                      //liste des questions inserées pour ID
        $checkInsertReponse = $this->insertReponse($questionList, $reponses, $vrais);       //insertion des reponses aux questions
        $checkInsertReponse = true;
            if ($checkInsertReponse === true) {                         //si la valeur de $inserted n'est pas null alors insertion réussi
                $this->session->set_flashdata('checkValidation', [      //redirect vers page d'insertion + popup de validation de insertion réussi
                    'message' => "Votre QCM a été enregistrée !"        //message de validation pour page Validation.php
                    ]);
            } 

        redirect('besoin/C_Besoin/getListeBesoin'); 
    }

    // fonction pour montrer le QCM 

    public function showQuestionForAnnounce($idBesoin){
        $data['pageTitle'] = "QCM";                      
        $data['pageToLoad'] = "question/QCM";              
    
        // Step 1: Get all rows from v_qcm for this besoin
        $allRows = $this->dao->select_where('v_qcm', ['idbesoin' => $idBesoin]);
    
        $questions = [];
    
        foreach ($allRows as $row) {
            $id = $row['idquestion'];
    
            // Initialize question if it hasn't been added yet
            if (!isset($questions[$id])) {
                // Include all columns from v_qcm except the answer-specific ones
                $questions[$id] = [
                    'idquestion' => $row['idquestion'],
                    'question' => $row['question'],
                    'datecreation' => $row['datecreation'],
                    'idbesoin' => $row['idbesoin'],
                    'nombre_employe' => $row['nombre_employe'],
                    'besoin_description' => $row['besoin_description'],
                    'annee_experience' => $row['annee_experience'],
                    'datebesoin' => $row['datebesoin'],
                    'idmanager' => $row['idmanager'],
                    'id_diplome' => $row['id_diplome'],
                    'idcontrat' => $row['idcontrat'],
                    'idposte' => $row['idposte'],
                    'answers' => []  // initialize empty array for answers
                ];
            }
    
            // Add answer if it exists
            if (!empty($row['idreponse'])) {
                $questions[$id]['answers'][] = [
                    'idreponse' => $row['idreponse'],
                    'reponse' => $row['reponse'],
                    'vraifaux' => $row['vraifaux']
                ];
            }
        }
    
        // Step 2: Pass the nested array to the view
        $data['questions'] = $questions;

        $data['idbesoin'] = $idBesoin;
    
        // Debug
        // var_dump($data['questions']);
    
        $this->load->view('home/Home', $data);
    }
    
    // Fonction qui calcul le score total par QCM pour chaque candidat pour chaque annonce

    public function showScore(){
        $selectedAnswers = $this->input->post('choixreponse'); 

        $selectedIds = array_values($selectedAnswers); //extrait les valeur venant des radios = réponses

        $answers = $this->dao->select_where_in('reponse', 'idreponse', $selectedIds);

        //Calcul de note
        $note = 0;
        foreach ($answers as $a) {
            if ($a['vraifaux'] == 't') {
                $note++;
            }
        }

        //fetch de l'id annonce
        $conditions = [
            'idbesoin' => $this->input->post('idbesoin')
        ];
        $idannonce = $this->dao->select_where('annonce', $conditions);

        //avoir la date par défaut du remplissage du qcm
        $date = $this->input->post('today');

        //avoir le userdata de la personne actuellement connecté
        $candidat = $this->session->userdata('connectedUser');

        if($candidat == null){
            redirect('C_Home');
        }else{
            // prendre l'id du candidat
            $idcandidat = $candidat['idcandidat'];

            // À insérer dans la table noteqcm
            $to_insert = [
                'note' => $note,
                'idannonce' => $idannonce[0]['idannonce'],
                'dateqcm' => $date,
                'idcandidat' => $idcandidat
            ];

            $check = $this->dao->insert_into('noteqcm', $to_insert);

            if($check != null){
                redirect('annonce/C_Annonce/getListeAnnonce');
            }else{
                redirect('C_Home');
            }
        }

    }
    
}
