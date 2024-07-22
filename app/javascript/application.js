// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

import ShowUsersController from "./controllers/show_users_controller.js"
Stimulus.register("show-users", ShowUsersController)
