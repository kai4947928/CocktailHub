import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["quantity"];

  toggleQuantity(event) {
    let input = event.target.closest(".form-check").querySelector(".quantity-input");
    input.style.display = event.target.checked ? "inline-block" : "none";
    if (!event.target.checked) input.value = "";
  }
}
