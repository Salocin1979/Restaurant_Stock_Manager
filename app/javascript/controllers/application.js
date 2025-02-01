import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Dynamically load controllers from the "controllers" directory
const controllers = import.meta.glob('./controllers/*.js')
for (const path in controllers) {
  controllers[path]().then(module => {
    application.register(module.default.name, module.default)
  })
}

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

export { application }

