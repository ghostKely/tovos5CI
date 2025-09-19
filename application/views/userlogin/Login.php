    <style>
        .moreBesoin {
            margin-top : 2.5%;
        }
    </style>
    <h2>Entrer vos informations</h2>
    
    <form action="<?php echo base_url('userLogin/C_User/authentification') ?>" method="POST">   
        <div class="col-md-10 achatMatiere">
            <div class="quantite">
                <h4 class="titleMatiere">Email :</h4>
                <input type="email" name="emailUser" class="selectMats" placeholder="user@gmail.com">
                <div class="titleMatiere"></div>
            </div>  
            <div class="quantite">
                <h4 class="titleMatiere">Mot de passe :</h4>
                <input type="password" name="mdpUser" class="selectMats">
                <div class="titleMatiere"></div>
            </div>  
            <input type="hidden" name="logValue" value=<?php echo $logAsValue; ?>>
            <div class="submitButton">
                <input type="submit" value="CONFIRMER">
            </div>
        </div>
    </form>
    
<?php $this->load->view('component/validation/Validation'); ?>