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
            <h2><?php echo $detailAnnonce[0]['titre']; ?></h2>
                <div class="info" style="margin-top: 40px;">
                    <div class="data">N° de annonce </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailAnnonce[0]['idannonce'] ?></div>
                </div>
                <div class="info">
                    <div class="data">Date de publication  </div>
                    <div class="point">................................................</div>
                    <div class="data">
                        <?php $date = new DateTime($detailAnnonce[0]['datepublication']);
                            echo $date->format('d F Y');
                        ?>
                </div>
                </div>
                <div class="info">
                    <div class="data">Département  </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailAnnonce[0]['nomdepartement'] ?></div>
                </div>
                <div class="info">
                    <div class="data">Poste  </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailAnnonce[0]['nomposte'] ?></div>
                </div>
                <div class="info">
                    <div class="data">Diplôme recquis  </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailAnnonce[0]['nomdiplome'] ?></div>
                </div>
                <div class="info">
                    <div class="data">Année expérience recquis  </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailAnnonce[0]['annee_experience'] ?></div>
                </div>
                <div class="info">
                    <div class="data">Type de contrat  </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailAnnonce[0]['typecontrat'] ?> (<?php echo $detailAnnonce[0]['abreviation'] ?>)</div>
                </div>
                <div class="descri">
                    <div class="data">Description du poste :  </div>
                    <div class="textDescri"><?php echo $detailAnnonce[0]['description'] ?></div>
                </div>
                <div class="validation">
                    <a href="<?php echo base_url('userLogin/C_User/loginAsCandidat/10') ?>">
                        <button class="modifier">POSTULER</button>
                    </a>
                </div>
        </div>
    </div>