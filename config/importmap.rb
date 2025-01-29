pin "application", preload: true
pin "application", to: "application.js", preload: true

pin "@hotwired/stimulus", to: "stimulus.js"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"

pin_all_from "app/javascript/controllers", under: "controllers"

pin "stimulus-autocomplete", to: "stimulus-autocomplete.js"
pin "activestorage", to: "activestorage.js"
