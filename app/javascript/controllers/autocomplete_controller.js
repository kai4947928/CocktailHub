import { Autocomplete } from "stimulus-autocomplete"

export default class extends Autocomplete {
  connect() {
    super.connect() // 基本のautocompleteの設定を呼び出す
    this.element.addEventListener("click", this.selectItem.bind(this))
  }

  selectItem(event) {
    console.log("Item clicked", event.target)
    if (event.target.matches(".autocomplete-item")) {
      const item = event.target
      this.inputTarget.value = item.dataset.name  // フォームに名前をセット
      this.hiddenTarget.value = item.dataset.id   // 隠しフィールドにIDをセット
      this.resultsTarget.innerHTML = ""  // 候補リストを非表示
    }
  }
}
