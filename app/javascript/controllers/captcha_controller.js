import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  // Questions et réponses multiples
  questions = [
    { question: "Combien font 3 + 5 ?", answer: "8" },
    { question: "Combien font 7 + 2 ?", answer: "9" },
    { question: "Combien font 4 + 6 ?", answer: "10" },
    { question: "Combien font 5 + 3 ?", answer: "8" },
    { question: "Combien font 2 + 8 ?", answer: "10" },
    { question: "Combien font 6 + 4 ?", answer: "10" },
    { question: "Combien font 1 + 9 ?", answer: "10" },
    { question: "Combien font 5 + 5 ?", answer: "10" },
    { question: "Combien font 3 + 7 ?", answer: "10" },
    { question: "Combien font 4 + 4 ?", answer: "8" }
  ]

  connect() {
    console.log("Captcha controller connected")
  }

  // Intercepter la soumission du formulaire
  submit(event) {
    console.log("Submit action triggered")
    event.preventDefault()
    event.stopPropagation()
    this.showModal()
  }

  // Afficher la modal
  showModal() {
    console.log("Showing modal")
    // Créer la modal dynamiquement
    this.createModal()
    this.modalTarget.style.display = "flex"
    this.inputTarget.focus()
  }

  // Obtenir une question aléatoire
  getRandomQuestion() {
    const randomIndex = Math.floor(Math.random() * this.questions.length)
    return this.questions[randomIndex]
  }

  // Créer la modal HTML
  createModal() {
    if (!this.modalTarget) {
      // Sélectionner une question aléatoire
      const selectedQuestion = this.getRandomQuestion()
      this.currentAnswer = selectedQuestion.answer

      const modalHTML = `
        <div class="modal-overlay" style="
          position: fixed;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          background: rgba(0,0,0,0.8);
          z-index: 9999;
          display: none;
          align-items: center;
          justify-content: center;
        ">
          <div class="modal-content" style="
            background: white;
            padding: 40px;
            border-radius: 12px;
            max-width: 450px;
            width: 90%;
            box-shadow: 0 8px 32px rgba(0,0,0,0.5);
            text-align: center;
            position: relative;
          ">
            <h3 style="margin-bottom: 25px; color: #333; font-size: 24px;">Vérification de sécurité</h3>
            <p style="margin-bottom: 25px; color: #666; font-size: 16px; line-height: 1.5;">Pour confirmer que vous n'êtes pas un robot, veuillez répondre à cette question :</p>
            <div style="margin-bottom: 30px;">
              <label style="display: block; margin-bottom: 15px; font-weight: bold; font-size: 18px; color: #333;">${selectedQuestion.question}</label>
              <input type="text" class="captcha-input" style="
                width: 100%;
                padding: 15px;
                border: 2px solid #ddd;
                border-radius: 8px;
                font-size: 18px;
                text-align: center;
                outline: none;
                transition: border-color 0.3s ease;
              " placeholder="Votre réponse" autocomplete="off">
            </div>
            <div style="display: flex; gap: 15px; justify-content: center;">
              <button type="button" class="captcha-cancel" style="
                padding: 12px 25px;
                border: 2px solid #6c757d;
                background: #6c757d;
                color: white;
                border-radius: 8px;
                cursor: pointer;
                font-size: 16px;
                font-weight: 500;
                transition: all 0.3s ease;
              ">Annuler</button>
              <button type="button" class="captcha-confirm" style="
                padding: 12px 25px;
                background: #007bff;
                color: white;
                border: 2px solid #007bff;
                border-radius: 8px;
                cursor: pointer;
                font-size: 16px;
                font-weight: 500;
                transition: all 0.3s ease;
              ">Confirmer</button>
            </div>
          </div>
        </div>
      `

      this.element.insertAdjacentHTML('beforeend', modalHTML)

      // Ajouter les event listeners
      const modal = this.element.querySelector('.modal-overlay')
      const input = modal.querySelector('.captcha-input')
      const confirmBtn = modal.querySelector('.captcha-confirm')
      const cancelBtn = modal.querySelector('.captcha-cancel')

      this.modalTarget = modal
      this.inputTarget = input
      this.submitBtnTarget = confirmBtn

      // Event listeners
      confirmBtn.addEventListener('click', () => this.checkAnswer())
      cancelBtn.addEventListener('click', () => this.hideModal())
      input.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') this.checkAnswer()
      })

      // Fermer en cliquant sur l'overlay
      modal.addEventListener('click', (e) => {
        if (e.target === modal) this.hideModal()
      })

      // Hover effects pour les boutons
      confirmBtn.addEventListener('mouseenter', () => {
        confirmBtn.style.background = '#0056b3'
        confirmBtn.style.borderColor = '#0056b3'
      })
      confirmBtn.addEventListener('mouseleave', () => {
        confirmBtn.style.background = '#007bff'
        confirmBtn.style.borderColor = '#007bff'
      })

      cancelBtn.addEventListener('mouseenter', () => {
        cancelBtn.style.background = '#545b62'
        cancelBtn.style.borderColor = '#545b62'
      })
      cancelBtn.addEventListener('mouseleave', () => {
        cancelBtn.style.background = '#6c757d'
        cancelBtn.style.borderColor = '#6c757d'
      })
    } else {
      // Si la modal existe déjà, changer la question
      const selectedQuestion = this.getRandomQuestion()
      this.currentAnswer = selectedQuestion.answer

      const label = this.modalTarget.querySelector('label')
      label.textContent = selectedQuestion.question

      this.inputTarget.value = ""
      this.inputTarget.style.borderColor = "#ddd"
    }
  }

  // Vérifier la réponse
  checkAnswer() {
    const answer = this.inputTarget.value.trim()
    console.log("Checking answer:", answer, "Expected:", this.currentAnswer)

    if (answer === this.currentAnswer) {
      // Réponse correcte
      console.log("Correct answer, submitting form")
      this.hideModal()
      this.submitForm()
    } else {
      // Réponse incorrecte - redirection vers la home avec alert
      console.log("Incorrect answer, redirecting to home")
      this.hideModal()
      alert("Vous n'avez pas passé la sécurité, votre message ne s'est pas envoyé")
      window.location.href = '/'
    }
  }

  // Cacher la modal
  hideModal() {
    if (this.modalTarget) {
      this.modalTarget.style.display = "none"
      this.inputTarget.value = ""
      this.inputTarget.style.borderColor = "#ddd"
    }
  }

  // Soumettre le formulaire
  submitForm() {
    console.log("Submitting form")
    this.formTarget.submit()
  }
}
