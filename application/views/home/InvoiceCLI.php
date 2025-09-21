<style>
        .table {
            margin-top: 2.5%;
        }
        .pill {
            display: inline-block;
            padding: 3px 12px;
            border-radius: 20px;
            font-weight: bold;
            color: white;
        }

        .blue {
            color: #007bff;
            background-color: rgba(0, 123, 255, 0.15);
        }

        .green {
            color: #28a745;
            background-color: rgba(40, 167, 69, 0.15);
        }

        .yellow {
            color: #ffc107;
            background-color: rgba(255, 193, 7, 0.2);
        }

        .gray {
            color: #6c757d;
            background-color: rgba(108, 117, 125, 0.15);
        }

        .red {
            color: #dc3545;
            background-color: rgba(220, 53, 69, 0.15);
        }
    </style>
    <h2>Liste de vos messages: </h2>
    <table class="table">
        <tbody>
            <?php foreach($invoices as $invoice): ?>
                <td><?= $invoice['date_reception'] ?></td>
                <td>
                    <span class="pill blue">
                        <?= $invoice['type_invoice'] ?>
                    </span>
                </td>
                <td><?= $invoice['description_invoice'] ?></td>
            <?php endforeach; ?>
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