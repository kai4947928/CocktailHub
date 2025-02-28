import { Autocomplete } from "stimulus-autocomplete"

export default class extends Autocomplete {
  connect() {
    super.connect()
    this.element.addEventListener("click", this.selectItem.bind(this))
  }

  selectItem(event) {
    console.log("Item clicked", event.target)
    if (event.target.matches(".autocomplete-item")) {
      const item = event.target
      this.inputTarget.value = item.dataset.name
      this.hiddenTarget.value = item.dataset.id
      this.resultsTarget.innerHTML = ""
    }
  }
}
