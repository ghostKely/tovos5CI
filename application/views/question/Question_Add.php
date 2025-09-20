<style>
    .moreQuestion {
        margin-top: 2.5%;
    }

    .question {
        width: 50%;
        padding: 8px 10px;
        border: 1px solid rgb(179, 179, 179);
        border-radius: 8px;
        margin-left: -20%;
    }
    
    .questionadded {
        width: 50%;
        padding: 8px 10px;
        border: 1px solid rgb(179, 179, 179);
        border-radius: 8px;
        margin-left: -37.5%;
    }

    .add-reponse {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 5px 10px;
        border-radius: 4px;
        cursor: pointer;
        margin-top: 10px;
    }

    .delete-reponse {
        background-color: #f44336;
        color: white;
        border: none;
        padding: 5px 10px;
        border-radius: 4px;
        cursor: pointer;
        margin-left: 10px;
    }
</style>

<h2>Ajout de question pour une demande de Besoins</h2>
<form action="<?php echo base_url('besoin/C_Question/saveQCM') ?>" method="POST">   
    <div class="col-md-10 achatMatiere" id="questions-container">
        <!-- Question principale -->
        <div class="question-block">
            <div class="quantite">
                <h4 class="titleMatiere">Question :</h4>
                <textarea type="text" name="question[]" class="question" required></textarea>
                <div class="titleMatiere"></div>
            </div>  
            
            <div class="quantite">
                <h4 class="titleMatiere">Bonne réponse :</h4>
                <input type="number" name="vrai[]" class="question" required>
                <div class="titleMatiere"></div>
            </div>  
            
            <div class="reponses-container">
                <div class="quantite reponse-container">
                    <h4 class="titleMatiere">Réponse 1 :</h4>
                    <textarea type="text" name="reponses[0][]" class="question" required></textarea>
                    <div class="titleMatiere"></div>
                </div>
                <div class="quantite reponse-container">
                    <h4 class="titleMatiere">Réponse 2 :</h4>
                    <textarea type="text" name="reponses[0][]" class="question" required></textarea>
                    <div class="titleMatiere"></div>
                </div>
            </div>
            
            <div class="quantite">
                <div class="titleMatiere"></div>
                <div class="titleMatiere"></div>
                <div class="titleMatiere">
                    <button type="button" class="add-reponse" data-question-index="0" 
                  style="        
                    background-color: #4CAF50;
                    color: white;
                    border: 2px solid #4CAF50;
                    padding: 5px 10px;
                    border-radius: 10px;
                    cursor: pointer;
                    transition: all 0.3s ease;"
                    onmouseover="hoverAddReponse(this)"
                    onmouseout="unhoverAddReponse(this)">+ Ajouter une réponse</button>
                </div>
            </div>
        </div>
    </div>

    <input type="hidden" name="idBesoin" class="selectMats" value="<?php echo $idBesoin; ?>">
    <input type="hidden" name="multipleInsertion" class="selectMats" value="false">
    
    <div class="submitButton">
        <input type="submit" value="CONFIRMER">
        <input type="button" id="addQuestionButton" value="AJOUTER UNE QUESTION" style="margin-left: 15%;">
    </div>
    <div class="col-md-9 moreQuestion" id="champOneMoreQuestion"></div>
</form>

<?php $this->load->view('component/validation/Validation'); ?>

<!-- Template pour une nouvelle question -->
<div id="questionTemplate" style="display: none;">
    <div class="col-md-10 achatMatiere question-block" style="margin-top: 6%;">
        <div class="quantite">
            <h4 class="titleMatiere">Question :</h4>
            <textarea type="text" name="question[]" class="question" required></textarea>
            <div class="titleMatiere"></div>
        </div>  

        <div class="quantite">
            <h4 class="titleMatiere">Bonne réponse :</h4>
            <input type="number" name="vrai[]" class="question" required>
            <div class="titleMatiere"></div>
        </div>  
        
        <div class="reponses-container">
            <div class="quantite reponse-container">
                <h4 class="titleMatiere">Réponse 1 :</h4>
                <textarea type="text" name="reponses[INDEX][]" class="question" required></textarea>
                <div class="titleMatiere"></div>
            </div>
            <div class="quantite reponse-container">
                <h4 class="titleMatiere">Réponse 2 :</h4>
                <textarea type="text" name="reponses[INDEX][]" class="question" required></textarea>
                <div class="titleMatiere"></div>
            </div>
        </div>
        
        <div class="quantite">
            <div class="titleMatiere"></div>
            <div class="titleMatiere"></div>
            <div class="titleMatiere">
                <button type="button" class="add-reponse" data-question-index="INDEX"
                style="        
                    background-color: #4CAF50;
                    color: white;
                    border: 2px solid #4CAF50;
                    padding: 5px 10px;
                    border-radius: 10px;
                    cursor: pointer;
                    transition: all 0.3s ease;"
                    onmouseover="hoverAddReponse(this)"
                    onmouseout="unhoverAddReponse(this)">+ Ajouter une réponse</button>
            </div>
        </div>
        
        <button class="delete">SUPPRIMER</button>
    </div>
</div>

<script>
    // Fonctions pour gérer le hover du bouton "Ajouter une réponse"
    function hoverAddReponse(button) {
        button.style.backgroundColor = 'white';
        button.style.color = '#4CAF50';
        button.style.border = '2px solid #4CAF50';
    }

    function unhoverAddReponse(button) {
        button.style.backgroundColor = '#4CAF50';
        button.style.color = 'white';
        button.style.border = '2px solid #4CAF50';
    }

  let questionCount = 1; // Commence à 1 car il y a déjà une question par défaut

    // Ajouter une nouvelle question - VERSION CORRIGÉE
    document.getElementById('addQuestionButton').addEventListener('click', function() {
        const template = document.getElementById('questionTemplate');
        const clone = template.cloneNode(true);
        clone.style.display = 'block';
        clone.id = '';
        
        // Mettre à jour les index SANS utiliser innerHTML
        const questionIndex = questionCount++;
        
        // Mettre à jour les data-attributs
        const addButton = clone.querySelector('.add-reponse');
        addButton.setAttribute('data-question-index', questionIndex);
        
        // Mettre à jour les noms des champs de réponse
        const reponseInputs = clone.querySelectorAll('textarea[name^="reponses"]');
        reponseInputs.forEach(input => {
            input.name = input.name.replace('INDEX', questionIndex);
        });
        
        // Ajouter les événements
        clone.querySelector('.delete').addEventListener('click', function() {
            clone.remove();
            checkBesoinCount();
        });
        
        addButton.addEventListener('click', function() {
            const qIndex = this.getAttribute('data-question-index');
            addReponse(qIndex, clone.querySelector('.reponses-container'));
        });
        
        document.getElementById('champOneMoreQuestion').appendChild(clone);
        checkBesoinCount();
    });

    // Ajouter une réponse à une question
    function addReponse(questionIndex, container) {
        const reponseCount = container.querySelectorAll('.reponse-container').length + 1;
        const reponseDiv = document.createElement('div');
        reponseDiv.className = 'quantite reponse-container';
        reponseDiv.innerHTML = `
            <h4 class="titleMatiere">Réponse ${reponseCount} :</h4>
            <textarea type="text" name="reponses[${questionIndex}][]" class="question" required></textarea>
            <div class="titleMatiere">
                <button type="button" class="delete-reponse" 
                style="background-color: #f44336; color: white; border: 2px solid #f44336; padding: 5px 10px; border-radius: 4px; cursor: pointer; margin-left: -60%; transition: all 0.3s ease;"
                onmouseover="hoverDeleteReponse(this)"
                onmouseout="unhoverDeleteReponse(this)">×</button>
            </div>
        `;
        
        reponseDiv.querySelector('.delete-reponse').addEventListener('click', function() {
            const container = this.closest('.reponses-container');
            if (container.querySelectorAll('.reponse-container').length > 2) { // 2 réponses de base + supplémentaires
                this.closest('.reponse-container').remove();
                updateReponseNumbers(container);
            } else {
                alert('Une question doit avoir au moins deux réponses.');
            }
        });
        
        container.appendChild(reponseDiv);
    }

    function hoverDeleteReponse(button) {
        button.style.backgroundColor = 'white';
        button.style.color = '#f44336';
        button.style.borderColor = '#f44336'; 
    }

    function unhoverDeleteReponse(button) {
        button.style.backgroundColor = '#f44336';
        button.style.color = 'white';
        button.style.borderColor = '#f44336';
    }

    // Mettre à jour les numéros des réponses
    function updateReponseNumbers(container) {
        container.querySelectorAll('.reponse-container').forEach((container, index) => {
            const title = container.querySelector('.titleMatiere');
            if (title) {
                title.textContent = `Réponse ${index + 1} :`;
            }
        });
    }

    // Fonction pour vérifier le nombre d'éléments dans #champOneMoreQuestion
    function checkBesoinCount() {
        var champOneMoreQuestion = document.getElementById('champOneMoreQuestion');
        var hiddenInput = document.querySelector('input[name="multipleInsertion"]');
        
        // Si le champ contient des éléments enfants, mettre multipleInsertion à true
        if (champOneMoreQuestion.children.length > 0) {
            hiddenInput.value = 'true';
        } else {
            hiddenInput.value = 'false';
        }
    }

    // Événements pour la question principale
    document.querySelector('[data-question-index="0"]').addEventListener('click', function() {
        const questionIndex = this.getAttribute('data-question-index');
        addReponse(questionIndex, document.querySelector('.reponses-container'));
    });

    // Ajouter les événements pour les boutons de suppression des réponses de la question principale
    document.querySelectorAll('.delete-reponse').forEach(btn => {
        btn.addEventListener('click', function() {
            const container = this.closest('.reponses-container');
            if (container.querySelectorAll('.reponse-container').length > 1) {
                this.closest('.reponse-container').remove();
                updateReponseNumbers(container);
            } else {
                alert('Une question doit avoir au moins une réponse.');
            }
        });
    });

    // Initialisation
    checkBesoinCount();
</script>