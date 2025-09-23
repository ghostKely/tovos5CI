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
            width: 200%;
            color: #FFF;
            transition: .3s;
            border-radius: 30px;
            height: 40px;
        }
        
        .modifier:hover{
            background-color: #FFF;
            color: rgb(47 202 38);
            border: 1px solid rgb(47 202 38);
        }

        .delete {
            background-color: rgb(255 0 0 / 83%);
            border: none;
            color: #FFF;
            transition: .3s;
            border-radius: 30px;
            width: 100%;
            height: 40px;
            margin-top: 40px;
            margin-left: 70px;
        }
    </style>
    
    <div class="col-md-9">
        <div>
            <h2>Détails de candidat au poste de <?php echo $detailRenew[0]['nomposte']; ?></h2>
                <div class="info">
                    <div class="data">Département  </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailRenew[0]['nomdepartement'] ?></div>
                </div>
                <div class="info">
                    <div class="data">Poste  </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailRenew[0]['nomposte'] ?></div>
                </div>
                <div class="info">
                    <div class="data">Diplôme recquis  </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailRenew[0]['diplome_requis'] ?></div>
                </div>
                <div class="descri">
                    <div class="data">Description du poste :  </div>
                    <div class="textDescri"><?php echo $detailRenew[0]['description'] ?></div>
                </div>

                
            <h2>Informations sur le candidat</h2>
                <div class="info">
                    <div class="data">Nom  </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailRenew[0]['nom'] ?></div>
                </div>
                <div class="info">
                    <div class="data">Prenom  </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailRenew[0]['prenom'] ?></div>
                </div>
                <div class="info">
                    <div class="data">Adresse  </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailRenew[0]['adresse'] ?></div>
                </div>
                <div class="info">
                    <div class="data">Diplôme  </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailRenew[0]['diplome_candidat'] ?></div>
                </div>
                <div class="info">
                    <div class="data">Reseignement  </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailRenew[0]['renseignement'] ?></div>
                </div>
                <div class="info">
                    <div class="data">Année expérience  </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailRenew[0]['totalanne_experience'] ?></div>
                </div>

                <?php if(!empty($detailRenew[0]['idemploye'])) { ?>
                    <div class="info">
                        <div class="data">Statut  </div>
                        <div class="point">................................................</div>
                        <div class="data" style="color : green;">Employe</div>
                    </div>
                    <div class="info">
                        <div class="data">Date de embauche  </div>
                        <div class="point">................................................</div>
                        <div class="data">
                            <?php $date = new DateTime($detailRenew[0]['finrenew']);
                                echo $date->format('d F Y');
                            ?>
                        </div>
                    </div>
                <?php } ?>

                <?php if(!empty($detailRenew[0]['idcandidatrefuse'])) { ?>
                    <div class="info">    
                        <div class="data">Statut  </div>
                        <div class="point">................................................</div>
                        <div class="data" style="color : red;">Viré</div>
                    </div>
                <?php } else if (empty($detailRenew[0]['idcandidatrefuse']) && empty($detailRenew[0]['idemploye'])) { ?>
                    <div class="validation">
                        <a href="<?php echo base_url('essai/C_Renew/getdetailRenew/'.$detailRenew[0]['idrenouvellement']).'/true' ?>">
                            <button class="modifier">EMBAUCHER</button>
                        </a>
                        <a href="<?php echo base_url('essai/C_Renew/refuserCandidat/'.$detailRenew[0]['idcandidat']) ?>">
                            <button class="delete">VIRER</button>
                        </a>
                    </div>
                <?php } ?>
                
        </div>
    </div>