    <style>
        .moreBesoin {
            margin-top : 2.5%;
        }
    </style>
    <h2>Ajout d'une demande de Besoin</h2>
    <form action="<?php echo base_url('besoin/C_Besoin/saveBesoin') ?>" method="POST">   
        <div class="col-md-10 achatMatiere">
            <div class="quantite"> 
                <div class="titleMatiere"><h4>Poste : </h4></div>
                <select class="selectMats" name="poste">
                    <?php foreach($postes as $poste) { ?>
                        <option value="<?php echo $poste['idposte'] ?>"><?php echo $poste['nomposte'] ?></option>
                    <?php } ?>
                </select>
                <div class="titleMatiere"></div>
            </div>
            <div class="quantite">
                <h4 class="titleMatiere">Description du travail :</h4>
                <textarea type="text" name="description" class="selectMats"></textarea>
                <div class="titleMatiere"></div>
            </div>  
            <div class="quantite">
                <h4 class="titleMatiere">Nombre personnel :</h4>
                <input type="number" name="nbrepersonnel" class="selectMats">
                <div class="titleMatiere"></div>
            </div>  
            <div class="quantite"> 
                <div class="titleMatiere"><h4>Diplome : </h4></div>
                <select class="selectMats" name="diplome">
                    <?php foreach($diplomes as $diplome) { ?>
                        <option value="<?php echo $diplome['id_diplome'] ?>"><?php echo $diplome['nomdiplome'] ?></option>
                    <?php } ?>
                </select>
                <div class="titleMatiere"></div>
            </div>
            <div class="quantite">
                <h4 class="titleMatiere">Année d'expérience(s) :</h4>
                <input type="text" name="experience" class="selectMats">
                <div class="titleMatiere"></div>
            </div>  
            <div class="quantite"> 
                <div class="titleMatiere"><h4>Contrat : </h4></div>
                <select class="selectMats" name="contrat">
                    <?php foreach($contrats as $contrat) { ?>
                        <option value="<?php echo $contrat['idcontrat'] ?>"><?php echo $contrat['typecontrat'] ?></option>
                    <?php } ?>
                </select>
                <div class="titleMatiere"></div>
            </div>
            <div class="quantite">
                <h4 class="titleMatiere">Date de demande :</h4> 
                <input type="date" name="datedemande" class="selectMats" value="<?php echo date('Y-m-d'); ?>">
                <div class="titleMatiere"></div>
            </div>
                <input type="hidden" name="multipleInsertion" class="selectMats" value="false">
            <div class="submitButton">
                <input type="submit" value="CONFIRMER">
                <!-- <input type="button" id="addBesoinButton" value="AJOUTER UN BESOIN" style="margin-left: 15%;"> -->
            </div>
        </div>

        <div class="col-md-9 moreBesoin" id="champOneMoreBesoin"></div>
    </form>
<?php $this->load->view('component/validation/Validation'); ?>

<!-- MULTI INSERTION AU CAS OU -->
        <div class="col-md-10 achatMatiere" id="besoinTemplate" style="display: none; margin-top : 6%;"> 
                        <div class="quantite"> 
                <div class="titleMatiere"><h4>Poste : </h4></div>
                <select class="selectMats" name="poste[]">
                    <?php foreach($postes as $poste) { ?>
                        <option value="<?php echo $poste['idposte'] ?>"><?php echo $poste['nomposte'] ?></option>
                    <?php } ?>
                </select>
                <div class="titleMatiere"></div>
            </div>
            <div class="quantite">
                <h4 class="titleMatiere">Nombre personnel :</h4>
                <input type="text" name="nbrepersonnel[]" class="selectMats">
                <div class="titleMatiere"></div>
            </div>  
            <div class="quantite"> 
                <div class="titleMatiere"><h4>Diplome : </h4></div>
                <select class="selectMats" name="diplome[]">
                    <?php foreach($diplomes as $diplome) { ?>
                        <option value="<?php echo $diplome['id_diplome'] ?>"><?php echo $diplome['nomdiplome'] ?></option>
                    <?php } ?>
                </select>
                <div class="titleMatiere"></div>
            </div>
            <div class="quantite">
                <h4 class="titleMatiere">Année d'expérience(s) :</h4>
                <input type="text" name="experience[]" class="selectMats">
                <div class="titleMatiere"></div>
            </div>  
            <div class="quantite"> 
                <div class="titleMatiere"><h4>Contrat : </h4></div>
                <select class="selectMats" name="contrat[]">
                    <?php foreach($contrats as $contrat) { ?>
                        <option value="<?php echo $contrat['idcontrat'] ?>"><?php echo $contrat['typecontrat'] ?></option>
                    <?php } ?>
                </select>
                <div class="titleMatiere"></div>
            </div>
            <button class="delete">SUPPRIMER</button>
        </div>      
<script>
    document.getElementById('addBesoinButton').addEventListener('click', function() {
        var besoinTemplate = document.getElementById('besoinTemplate');
        var clone = besoinTemplate.cloneNode(true);
        clone.id = ''; // Supprimer l'ID pour éviter les conflits
        clone.style.display = 'block';

        // Ajouter un événement pour supprimer l'élément cloné
        clone.querySelector('.delete').addEventListener('click', function() {
            clone.remove();
            checkBesoinCount(); // Vérifier après la suppression
        });

        document.getElementById('champOneMoreBesoin').appendChild(clone);
        checkBesoinCount(); // Vérifier après l'ajout
    });              

    // Fonction pour vérifier le nombre d'éléments dans #champOneMoreBesoin
    function checkBesoinCount() {
        var champOneMoreBesoin = document.getElementById('champOneMoreBesoin');
        var hiddenInput = document.querySelector('input[name="multipleInsertion"]');
        
        // Si le champ contient des éléments enfants, mettre multipleInsertion à true
        if (champOneMoreBesoin.children.length > 0) {
            hiddenInput.value = 'true';
        } else {
            hiddenInput.value = 'false';
        }
    }

    // Initialement, on vérifie l'état pour mettre à jour multipleInsertion correctement
    checkBesoinCount();
</script>    