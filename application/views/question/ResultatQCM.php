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
    <h4>Entrez une date pour entretien: </h4>
    <form action="<?php echo base_url('annonce/C_Entretien/ajoutEntretien') ?>" method="post">
        <input type="date" name="dateentretien" id="" min="<?php echo date('Y-m-d', strtotime('+1 day')); ?>" required>
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th>Annonce</th>
                    <th>Nom Candidat</th>
                    <th>Prenom Candidat</th>
                    <th>Note candidat</th>
                    <th>Date QCM</th>
                </tr>
            </thead>
        
            <tbody>
                <?php foreach($resultats as $resultat): ?>
                    <tr class="ligne" data-href="">
                        <td><?= $resultat['annonce_titre'] ?></td>
                        <td><?= $resultat['candidat_nom'] ?></td>
                        <td><?= $resultat['candidat_prenom'] ?></td>
                        <td><?= $resultat['note'] ?></td>
                        <td><?= $resultat['dateqcm'] ?></td>
                        <td><input type="hidden" name="idnoteqcm" value="<?= $resultat['idnoteqcm'] ?>"></td>
                        <?php if($resultat['waiting']):?>
                            <td><div class="div-entretien">Entretien envoyé</div></td>
                        <?php else: ?>
                            <td><button class="entretien-btn" type="submit">Donner entretien</button></td>
                        <?php endif;?>    
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </form>
<?php $this->load->view('component/validation/Validation'); ?>

    <script>
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