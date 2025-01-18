// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import { Turbo } from "@hotwired/turbo-rails"
import { start } from "rails-ujs"
import * as ActiveStorage from "activestorage"

// rails-ujs と activestorage を初期化
start()
ActiveStorage.start()

import "controllers"

import { Application } from "@hotwired/stimulus";
import RecipesAutocompleteController from "./controllers/recipes_autocomplete_controller";

const application = Application.start();
application.register("recipes-autocomplete", RecipesAutocompleteController);