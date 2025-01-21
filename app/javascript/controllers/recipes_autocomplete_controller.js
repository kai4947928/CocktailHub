import { Controller } from "stimulus";
import { Autocomplete } from "stimulus-autocomplete";

export default class extends Autocomplete {
  connect() {
    super.connect();
    console.log("Autocomplete connected");
  }

  updateSuggestions(event) {
    console.log("Input event triggered");
    const query = event.target.value;

    if (query.length >= 2) {  // 2文字以上で候補を表示
      this.getSuggestions(query);
    } else {
      this.clearSuggestions();
    }
  }

  // 候補を取得し、表示する
  getSuggestions(query) {
    fetch(`/recipes/autocomplete?query=${query}`)
      .then(response => response.json())
      .then(data => {
        console.log("Suggestions:", data);
        this.showSuggestions(data);
      })
      .catch(error => {
        console.error("Error fetching suggestions:", error);
      });
  }

  // 候補リストを表示
  showSuggestions(suggestions) {
    this.clearSuggestions(); // 既存の候補をクリア
    suggestions.forEach(suggestion => {
      const listItem = document.createElement("li");
      listItem.textContent = suggestion;
      this.suggestionsTarget.appendChild(listItem);
    });
  }

  // 候補リストをクリア
  clearSuggestions() {
    this.suggestionsTarget.innerHTML = "";
  }
}
