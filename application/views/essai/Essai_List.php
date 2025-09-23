    <style>
        .table {
            margin-top: 2.5%;
        }
        
        .modifier {
            background-color: rgb(255 96 0 / 66%);
            border: none;
            color: #FFF;
            transition: .3s;
            border-radius: 30px;
            width: 85%;
            height: 40px;
            margin-left: 70px;
        }
        
        .modifier:hover{
            background-color: #FFF;
            color: rgb(255 96 0 / 66%);
            border: 1px solid rgb(255 96 0 / 66%);
        }

        .chooseFiltre {
            display: flex;
            margin-top: 5px;
        }

        .descri {
            font-size: 16px;
            display: grid;
            margin-top: 10px;
        }

        .textDescri {
            margin-left: 30px;
            margin-top: 15px;
        }

        .data {
            width: 30%;
            margin-left: 5%;
        }

        .info {
            font-size: 16px;
            display: flex;
            justify-content: space-between;
            align-items: baseline;
            margin-top: 10px;
        }
        .info1 {
            font-size: 16px;
            display: flex;
            align-items: baseline;
        }
        .data1 {
            width: 30%;
            margin-left: -11.5%;
        }

    </style>
    <h2>Liste des Essais</h2>
    <form id="pageToGoPoste" action="<?php echo base_url('essai/C_Essai/filtre'); ?>" method="GET">
        <div class="col-md-10 achatMatiere">    
            <div class="quantite"> 
                <div class="titleMatiere"><h4>Poste : </h4></div>      
                    <select class="selectMats" name="posteChoosed" style="margin-left: -51.5%;" onchange="submitFormPoste()">
                        <?php foreach ($postes as $poste) { ?>
                            <option value="<?php echo $poste['idposte']; ?>" selected="<?php echo $poste['nomposte']; ?>"><?php echo $poste['nomposte']; ?></option>
                        <?php } ?>
                            <option value="" selected disabled>Sélectionnez un poste</option>
                    </select>
                <div class="titleMatiere"></div>
            </div>
        </div>
    </form>
    <table class="col-md-10 table">
        <thead class="thead-dark">
            <tr>
                <th>Essai</th>
                <th>Date Début</th>
                <th>Date Fin</th>
                <th>Poste</th>
                <th>Nom candidat</th>
                <th>Prenom candidat</th>
                <th>Adresse</th>
            </tr>
        </thead>
    
        <tbody>
            <?php 
            if (!empty($listeCandidatEssai)) {
                foreach ($listeCandidatEssai as $essai) { ?>
                    <tr class="ligne" data-href="<?php echo base_url('essai/C_Essai/getDetailEssai/'.$essai['idessai']); ?>">
                        <td><?php echo $essai['idessai']; ?></td>
                        <td><?php echo $essai['datedebut']; ?></td>
                        <td><?php echo $essai['datefin']; ?></td>
                        <td><?php echo $essai['nomposte']; ?></td>
                        <td><?php echo $essai['nom']; ?></td>
                        <td><?php echo $essai['prenom']; ?></td>
                        <td><?php echo $essai['adresse']; ?></td>
                    </tr>
                <?php 
                    }
                } else { ?>
                    <tr>
                        <td colspan="8" class="text-center">
                            <div class="alert alert-info mt-3">
                                Aucun annonce correspondante
                            </div>
                        </td>
                    </tr>
                <?php } ?>
        </tbody>
    </table>
<?php $this->load->view('component/validation/Validation'); ?>
    <script>
        function submitFormPoste() {
            document.getElementById('pageToGoPoste').submit();
        }


        document.addEventListener('DOMContentLoaded', function() {
            // Sélectionner toutes les lignes de table avec l'attribut data-href
            var rows = document.querySelectorAll('.ligne[data-href]');

            rows.forEach(function(row) {
                row.addEventListener('click', function() {
                    // Rediriger vers l'URL stockée dans l'attribut data-href
                    window.location.href = this.getAttribute('data-href');
                });
            });
        });
    </script>  