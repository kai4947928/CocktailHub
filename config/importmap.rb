pin "application", preload: true  # 最初にアプリケーションをピン
pin "rails-ujs", to: "rails-ujs.js"
pin "activestorage", to: "activestorage.js"
pin "@hotwired/stimulus", to: "@hotwired/stimulus.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "stimulus-autocomplete", to: "stimulus-autocomplete.js"