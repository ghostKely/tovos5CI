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
        <form action="<?php echo base_url('essai/C_Essai/embaucheCandidat') ?>" method="POST"> 
            <h2>Détails sur le candidat au poste de <?php echo $detailEssai[0]['nomposte']; ?></h2>
                <div class="info">
                    <div class="data">Département  </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailEssai[0]['nomdepartement'] ?></div>
                </div>
                <div class="info">
                    <div class="data">Poste  </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailEssai[0]['nomposte'] ?></div>
                </div>
                <div class="info">
                    <div class="data">Diplôme recquis  </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailEssai[0]['diplome_requis'] ?></div>
                </div>
                <div class="descri">
                    <div class="data">Description du poste :  </div>
                    <div class="textDescri"><?php echo $detailEssai[0]['description'] ?></div>
                </div>

                
            <h2>Informations sur le candidat</h2>
                <div class="info">
                    <div class="data">Nom  </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailEssai[0]['nom'] ?></div>
                </div>
                <div class="info">
                    <div class="data">Prenom  </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailEssai[0]['prenom'] ?></div>
                </div>
                <div class="info">
                    <div class="data">Adresse  </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailEssai[0]['adresse'] ?></div>
                </div>
                <div class="info">
                    <div class="data">Diplôme  </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailEssai[0]['diplome_candidat'] ?></div>
                </div>
                <div class="info">
                    <div class="data">Reseignement  </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailEssai[0]['renseignement'] ?></div>
                </div>
                <div class="info">
                    <div class="data">Année expérience  </div>
                    <div class="point">................................................</div>
                    <div class="data"><?php echo $detailEssai[0]['totalanne_experience'] ?></div>
                </div>

                 
                <div class="quantite">
                    <h4 class="titleMatiere">Date de embauche :</h4> 
                    <input type="date" name="datefin" class="selectMats" value="<?php echo $detailEssai[0]['datefin'] ?>">
                    <div class="titleMatiere"></div>
                </div>
                    <input type="hidden" name="idcandidat" value="<?php echo $detailEssai[0]['idcandidat'] ?>">
                    <div class="submitButton">
                    <input type="submit" value="CONFIRMER">
                </div>
                
            </form>
        </div>
    </div>