<style>
        .moreBesoin {
            margin-top : 2.5%;
        }

        .answers {
            margin-top: 10px;
        }

        .answer-item {
            margin-bottom: 8px;
        }

    </style>

    <h2>Voici le QCM pour le poste de <?= reset($questions)['besoin_description'] ?>:</h2>
    
    <form action="<?php echo base_url('besoin/C_Question/showScore') ?>" method="POST">   
        <div class="col-md-10 achatMatiere">
            <?php foreach ($questions as $question): ?>
                <div class="">

                    <h4 class="titleMatiere"><?= $question['question'] ?></h4>

                    <div class="answers">
                        <?php foreach ($question['answers'] as $answer): ?>
                            <div class="answer-item">
                                <label>
                                    <input type="radio" 
                                        name="choixreponse[<?= $question['idquestion'] ?>]"
                                        value="<?= $answer['idreponse'] ?>" 
                                        required>
                                    <?= $answer['reponse'] ?>
                                </label>
                            </div>
                        <?php endforeach; ?>
                    </div><br>
                </div>
            <?php endforeach; ?>
            <input type="hidden" name="idbesoin" value="<?php echo $idbesoin ?>">
            <input type="hidden" name="today" value="<?= date('Y-m-d') ?>">
            <div class="submitButton">
                <input type="submit" value="CONFIRMER">
            </div>
        </div>
    </form>
    
<?php $this->load->view('component/validation/Validation'); ?>