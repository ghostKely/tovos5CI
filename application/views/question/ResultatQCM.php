<style>
        .table {
            margin-top: 2.5%;
        }
        .ligne {
            transition: background-color 0.2s ease;
        }

        .ligne:hover {
            background-color: #007BFF;
            color: white;
            cursor: pointer;
        }

        .entretien-btn {
            background-color: #28a745; 
            color: white;
            border: none;
            padding: 4px 8px;
            border-radius: 10px;
            cursor: pointer;
            font-size: 1em;
            transition: background-color 0.4s ease;
        }

        .div-entretien {
            color: grey;
            border: none;
            padding: 4px 4px;
            border-radius: 10px;
            cursor: pointer;
            font-size: 1em;
            transition: background-color 0.4s ease;
        }

        .div-entretien:hover {
            color: white;
        }

        .entretien-btn:hover {
            background-color: #218838;
        }

</style>

    <?php if ($this->session->flashdata('error_msg')): ?>
        <div class="alert alert-danger" style="margin: 10px 0; padding: 10px; border-radius: 5px; background-color: #f8d7da; color: #721c24;">
            <?= $this->session->flashdata('error_msg') ?>
        </div>
    <?php endif; ?>
    <h2>Liste des résultats QCM pour chaque besoins: </h2><br>
    <h4> </h4>
        
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th>Annonce</th>
                    <th>Nom Candidat</th>
                    <th>Prenom Candidat</th>
                    <th>Note candidat</th>
                    <th>Date QCM</th>
                    <th>Entrez une date pour entretien</th>
                </tr>
            </thead>
        
            <tbody>
                <?php for($i=0; $i<sizeof($resultats); $i++) { 
                    $resultat = $resultats[$i]; ?>
                    <form action="<?php echo base_url('annonce/C_Entretien/ajoutEntretien') ?>" method="post">
                    <tr class="ligne" data-href="">
                        <td><?= $resultat['annonce_titre'] ?></td>
                        <td><?= $resultat['candidat_nom'] ?></td>
                        <td><?= $resultat['candidat_prenom'] ?></td>
                        <td><?= $resultat['note'] ?></td>
                        <td><?= $resultat['dateqcm'] ?></td>
                        <td><input type="date" name="dateentretien" id="" min="<?php echo date('Y-m-d', strtotime('+1 day')); ?>" required></td>
                        <td><input type="hidden" name="idnoteqcm" value="<?= $resultat['idnoteqcm'] ?>"></td>
                        <td><input type="hidden" name="idannonce" value="<?= $resultat['idannonce'] ?>"></td>
                        <td><input type="hidden" name="idcandidat" value="<?= $resultat['idcandidat'] ?>"></td>
                        <?php if($qcmWaiting[$i]) { ?>
                            <td><div class="div-entretien">Entretien envoyé</div></td>
                        <?php } else { ?>
                            <td><button class="entretien-btn" type="submit">Donner entretien</button></td>
                        <?php } ?>    
                    </tr>
                    </form>
                <?php } ?>
            </tbody>
        </table>
<?php $this->load->view('component/validation/Validation'); ?>
