    <style>
        .table {
            margin-top: 2.5%;
        }
    </style>
    <h2>Liste des demandes de besoins</h2>
    <table class="table">
        <thead class="thead-dark">
            <tr>
                <th>Date demande</th>
                <th>Département</th>
                <th>Poste</th>
                <th>Nombre Employé</th>
                <th>Année expérience</th>
                <th>Diplôme</th>
                <th>Contrat</th>
            </tr>
        </thead>
    
        <tbody>
            <?php 
            if (!empty($listeBesoin)) {
                foreach ($listeBesoin as $besoin) { ?>
                    <tr class="ligne" data-href="<?php echo base_url('besoin/C_Besoin/getDetailBesoin/'.$besoin['idbesoin']); ?>">
                        <td><?php echo $besoin['datebesoin']; ?></td>
                        <td><?php echo $besoin['nomdepartement']; ?></td>
                        <td><?php echo $besoin['nomposte']; ?></td>
                        <td><?php echo $besoin['nombre_employe']; ?></td>
                        <td><?php echo $besoin['annee_experience']; ?></td>
                        <td><?php echo $besoin['nomdiplome']; ?></td>
                        <td><?php echo $besoin['type_contrat_abrev']; ?></td>
                    </tr>
                <?php 
                    }
                } else { ?>
                    <tr>
                        <td colspan="8" class="text-center">
                            <div class="alert alert-info mt-3">
                                Aucun besoin en attente de validation.
                            </div>
                        </td>
                    </tr>
                <?php } ?>
        </tbody>
    </table>
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