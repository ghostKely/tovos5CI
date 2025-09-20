    <style>
        .table {
            margin-top: 2.5%;
        }
    </style>
    <h2>Liste des annonces</h2>
    <table class="table">
        <thead class="thead-dark">
            <tr>
                <th>Date Publication</th>
                <th>Titre</th>
            </tr>
        </thead>
    
        <tbody>
            <?php 
            if (!empty($listeAnnonce)) {
                foreach ($listeAnnonce as $annonce) { ?>
                    <tr class="ligne" data-href="<?php echo base_url('annonce/C_Annonce/getDetailAnnonce/'.$annonce['idannonce']); ?>">
                        <td><?php echo $annonce['datepublication']; ?></td>
                        <td><?php echo $annonce['titre']; ?></td>
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