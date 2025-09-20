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
        
		$this->load->view('home/Home', $data);                          //page principale où on load les pages
    }

/* FONCTION POUR AVOIR LES DETAILS D'UNE ANNONCE */
    public function getDetailAnnonce($idAnnonce) {
        $data['pageTitle'] = "Details Annonce";                         //titre de la page de destination
        $data['pageToLoad'] = "annonce/Annonce_Detail";                 //path de a page de destination

        $condition = [ 'idannonce' => $idAnnonce ];
        $data['detailAnnonce'] = $this->dao->select_where('v_annonce', $condition);     //detail concernant l'annonce

		$this->load->view('home/Home', $data);                          //page principale où on load les pages
    }
}
