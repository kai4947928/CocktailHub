import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["container"];

  connect() {
    this.containerTarget.style.display = "none";
  }

  show() {
    this.containerTarget.style.display = "block";
  }

  hide() {
    this.containerTarget.style.display = "none";
  }
}