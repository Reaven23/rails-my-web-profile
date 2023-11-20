import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carousel"

export default class extends Controller {
  static targets = ["slide"];
  index = 0;

  connect() {
    console.log("hey i'm here");
    this.showSlide();
    setInterval(() => {
      this.index++;
      if (this.index === this.slideTargets.length) {
        this.index = 0;
      }
      this.showSlide();
    }, 3000); 
  }

  showSlide() {
    this.slideTargets.forEach((slide, i) => {
      if (i === this.index) {
        slide.style.display = "block";
      } else {
        slide.style.display = "none";
      }
    });
  }
}
