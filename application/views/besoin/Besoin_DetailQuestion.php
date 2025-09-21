    <style>
        .descri {
            font-size: 16px;
            display: grid;
            margin-top: 10px;
        }

        .textDescri {
            margin-left: 30px;
            margin-top: 15px;
        }

        .validation {
            font-size: 16px;
            display: flex;
            justify-content: space-evenly;
            align-items: baseline;
            margin-top: 50px;
        }

        .info {
            font-size: 16px;
            display: flex;
            justify-content: space-between;
            align-items: baseline;
            margin-top: 10px;
        }
        
        .data {
            width: 30%;
        }

        .modifier {
            background-color: rgb(47 202 38);
            border: none;
            color: #FFF;
            transition: .3s;
            border-radius: 30px;
            width: 100%;
            height: 40px;
        }
        
        .modifier:hover{
            background-color: #FFF;
            color: rgb(47 202 38);
            border: 1px solid rgb(47 202 38);
        }
    </style>
    
    <div class="col-md-9">
        <div>
            <h2>Détails de demande de besoin pour le poste de <?php echo $detailBesoin[0]['nomposte']; ?></h2>
                <div class="info" style="margin-top: 40px;">
                    <div class="data">N° de besoin </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailBesoin[0]['idbesoin'] ?></div>
                </div>
                <div class="info">
                    <div class="data">Date de la demande  </div>
                    <div class="point">................................................</div>
                    <div class="data">
                        <?php $date = new DateTime($detailBesoin[0]['datebesoin']);
                            echo $date->format('d F Y');
                        ?>
                </div>
                </div>
                <div class="info">
                    <div class="data">Département  </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailBesoin[0]['nomdepartement'] ?></div>
                </div>
                <div class="info">
                    <div class="data">Poste  </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailBesoin[0]['nomposte'] ?></div>
                </div>
                <div class="info">
                    <div class="data">Diplôme recquis  </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailBesoin[0]['nomdiplome'] ?></div>
                </div>
                <div class="descri">
                    <div class="data">Description du poste :  </div>
                    <div class="textDescri"><?php echo $detailBesoin[0]['description'] ?></div>
                </div>

            
            <h2>QCM</h2>
                <?php foreach ($qcm as $question) { ?>
                    <div class="descri">
                        <div class="data"><?php echo $question['question'] ?></div>
                        <?php 
                            $reponses = json_decode($question['reponses'], true);
                            foreach ($reponses as $reponse) { ?>
                                <div class="textDescri"><?php echo $reponse['reponse'] ?></div>
                        <?php } ?>
                    </div>
                <?php } ?>
                
                <div class="validation">
                    <a href="<?php echo base_url('besoin/C_Question/pageAddQuestionBesoin/'.$detailBesoin[0]['idbesoin']) ?>">
                        <button class="modifier">AJOUTER UNE QUESTION</button>
                    </a>
                </div>

        </div>
    </div>