import { Application } from "@hotwired/stimulus"
import { Autocomplete } from "stimulus-autocomplete"
import TabPaginationController from "./controllers/tab_pagination_controller"

const application = Application.start()
application.register('autocomplete', Autocomplete)
application.register("tab-pagination", TabPaginationController)
// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
