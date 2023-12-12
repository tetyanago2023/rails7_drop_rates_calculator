import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="drop-rate"
export default class extends Controller {
  static targets = ["form"];
  connect() {
    console.log("Hello, Stimulus!", this.element);
  }
}
