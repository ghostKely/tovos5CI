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
        
        .annuler {
            background-color: rgb(255 0 0 / 66%);
            border: none;
            color: #FFF;
            transition: .3s;
            border-radius: 30px;
            width: 250px;
            height: 40px;
        }
        
        .annuler:hover{
            background-color: #FFF;
            color: rgb(255 0 0 / 66%);
            border: 1px solid rgb(255 0 0 / 66%);
        }

        .annulertxt {
            padding: 10px 0px 0px 87px;
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
                <div class="info">
                    <div class="data">Type de contrat  </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailBesoin[0]['typecontrat'] ?> (<?php echo $detailBesoin[0]['type_contrat_abrev'] ?>)</div>
                </div>
                <div class="descri">
                    <div class="data">Description du poste :  </div>
                    <div class="textDescri"><?php echo $detailBesoin[0]['description'] ?></div>
                </div>
                <div class="validation">
                    <div>
                        <input  type="submit" value="CONFIRMER">
                    </div>
                    <div>
                        <a href="<?php echo base_url('besoin/C_Besoin/getListeBesoinNonValide')?>">
                            <div class="annuler"><div class="annulertxt">ANNULER</div></div>
                        </a>
                    </div>
                </div>
        </div>
    </div>