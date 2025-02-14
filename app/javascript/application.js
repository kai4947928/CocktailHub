// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Turbo } from "@hotwired/turbo-rails"
import { Application } from "@hotwired/stimulus"
import "controllers"

// Turboの初期化
Turbo.start()

const application = Application.start()

// Stimulusのインスタンスをグローバルに設定
window.Stimulus = application
