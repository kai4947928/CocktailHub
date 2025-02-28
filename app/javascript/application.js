// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Turbo } from "@hotwired/turbo-rails"
import { Application } from "@hotwired/stimulus"
import "controllers"

Turbo.start()

const application = Application.start()

window.Stimulus = application
