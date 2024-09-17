import "@hotwired/turbo-rails"
import "./controllers"

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
