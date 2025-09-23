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
        <form action="<?php echo base_url('essai/C_Renew/embaucheCandidat') ?>" method="POST"> 
            <h2>Détails sur le candidat au poste de <?php echo $detailRenew[0]['nomposte']; ?></h2>
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

                 
                <div class="quantite">
                    <h4 class="titleMatiere">Date de embauche :</h4> 
                    <input type="date" name="datefin" class="selectMats" value="<?php echo $detailRenew[0]['finrenew'] ?>">
                    <div class="titleMatiere"></div>
                </div> 
                <div class="quantite"> 
                    <div class="titleMatiere"><h4>Contrat : </h4></div>
                    <select class="selectMats" name="contrat">
                        <?php foreach($contrats as $contrat) { ?>
                            <option value="<?php echo $contrat['idcontrat'] ?>"><?php echo $contrat['abreviation'] ?></option>
                        <?php } ?>
                    </select>
                    <div class="titleMatiere"></div>
                </div>
                    <input type="hidden" name="idcandidat" value="<?php echo $detailRenew[0]['idcandidat'] ?>">
                    <input type="hidden" name="nom" value="<?php echo $detailRenew[0]['nom'] ?>">
                    <input type="hidden" name="prenom" value="<?php echo $detailRenew[0]['prenom'] ?>">
                    <input type="hidden" name="email" value="<?php echo $detailRenew[0]['email'] ?>">
                    <input type="hidden" name="adresse" value="<?php echo $detailRenew[0]['adresse'] ?>">
                    <input type="hidden" name="dtn" value="<?php echo $detailRenew[0]['dtn'] ?>">
                    <input type="hidden" name="poste" value="<?php echo $detailRenew[0]['idposte'] ?>">
                    <input type="hidden" name="diplome" value="<?php echo $detailRenew[0]['id_diplome'] ?>">
                    <input type="hidden" name="besoin" value="<?php echo $detailRenew[0]['idbesoin'] ?>">
                    <div class="submitButton">
                    <input type="submit" value="CONFIRMER">
                </div>
                
            </form>
        </div>
    </div>