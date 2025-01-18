import { Autocomplete } from "stimulus-autocomplete";

export default class extends Autocomplete {
  connect() {
    super.connect();
    // 他のカスタマイズが必要ならここに記述
    console.log("Autocomplete connected");
  }
}