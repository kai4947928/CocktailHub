// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import RecipesAutocompleteController from "./recipes_autocomplete_controller"

application.register("recipes-autocomplete", RecipesAutocompleteController)
