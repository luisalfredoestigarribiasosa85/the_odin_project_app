import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["overlay"]

  connect() {
    this.boundHandleKeydown = this.handleKeydown.bind(this)
  }

  disconnect() {
    this.removeKeydownListener()
    document.body.classList.remove("overflow-hidden")
  }

  open(event) {
    event.preventDefault()
    if (!this.hasOverlayTarget) return

    this.overlayTarget.classList.remove("hidden")
    this.overlayTarget.classList.add("flex")
    document.body.classList.add("overflow-hidden")
    document.addEventListener("keydown", this.boundHandleKeydown)
  }

  close(event) {
    if (event) event.preventDefault()
    if (!this.hasOverlayTarget) return

    this.overlayTarget.classList.add("hidden")
    this.overlayTarget.classList.remove("flex")
    document.body.classList.remove("overflow-hidden")
    this.removeKeydownListener()
  }

  stop(event) {
    event.stopPropagation()
  }

  handleKeydown(event) {
    if (event.key === "Escape") {
      this.close(event)
    }
  }

  removeKeydownListener() {
    document.removeEventListener("keydown", this.boundHandleKeydown)
  }
}
