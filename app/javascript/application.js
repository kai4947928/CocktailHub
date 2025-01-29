// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// app/javascript/application.js
import { Turbo } from "@hotwired/turbo-rails"
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"
import "controllers"

// Turboを初期化
Turbo.start()

// Stimulusの初期化
const application = Application.start()
const context = require.context("controllers", true, /.js$/)
application.load(definitionsFromContext(context))
