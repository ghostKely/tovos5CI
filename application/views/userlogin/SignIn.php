    <style>
        .moreBesoin {
            margin-top : 2.5%;
        }
    </style>
    <h2>Entrer vos informations</h2>
    
    <form action="<?php echo base_url('userLogin/C_User/signIn') ?>" method="POST">   
        <div class="col-md-10 achatMatiere">
            <div class="quantite">
                <h4 class="titleMatiere">Nom:</h4>
                <input type="text" name="nomCandidat" class="selectMats" placeholder="Rakoto">
                <div class="titleMatiere"></div>
            </div>  
            <div class="quantite">
                <h4 class="titleMatiere">Prenom :</h4>
                <input type="text" name="prenomCandidat" class="selectMats" placeholder="Jean">
                <div class="titleMatiere"></div>
            </div> 
            <div class="quantite">
                <h4 class="titleMatiere">Adresse :</h4>
                <input type="text" name="adresseCandidat" class="selectMats" placeholder="Lot XYZ">
                <div class="titleMatiere"></div>
            </div> 
            <div class="quantite">
                <h4 class="titleMatiere">E-mail :</h4>
                <input type="email" name="mailCandidat" class="selectMats" placeholder="jean@gmail.com">
                <div class="titleMatiere"></div>
            </div> 
            <div class="quantite">
                <h4 class="titleMatiere">Date de naissance :</h4>
                <input type="date" name="dtnCandidat" class="selectMats" >
                <div class="titleMatiere"></div>
            </div>  
            <div class="quantite">
                <h4 class="titleMatiere">Diplôme :</h4>
                <select class="selectMats" name="diplome" id="">
                    <?php foreach($diplomes as $diplome) { ?>
                        <option value="<?php echo $diplome["id_diplome"] ?>"><?php echo $diplome["nomdiplome"] ?></option>
                    <?php } ?>
                </select>
                <div class="titleMatiere"></div>
            </div>  
            <div class="quantite">
                <h4 class="titleMatiere">Renseignement :</h4>
                <input type="text" name="rsgnCandidat" class="selectMats" placeholder="Renseignements">
                <div class="titleMatiere"></div>
            </div> 
            <div class="quantite">
                <h4 class="titleMatiere">Année d'expérience :</h4>
                <input type="number" min=0 name="expCandidat" class="selectMats" placeholder="0">
                <div class="titleMatiere"></div>
            </div> 
            <input type="hidden" name="logValue" value=<?php echo $logAsValue; ?>>
            <div class="submitButton">
                <input type="submit" value="CONFIRMER">
            </div>
        </div>
    </form>
    
<?php $this->load->view('component/validation/Validation'); ?>