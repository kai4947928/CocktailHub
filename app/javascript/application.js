// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { start } from "rails-ujs"
import * as ActiveStorage from "activestorage"

// rails-ujs と activestorage を初期化
start()
ActiveStorage.start()

import "controllers"
