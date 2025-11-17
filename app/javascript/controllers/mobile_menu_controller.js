import { Controller } from "@hotwired/stimulus"

// Controls the mobile nav menu toggle
export default class extends Controller {
  static targets = ["menu", "openIcon", "closeIcon"]

  connect() {
    this.isOpen = false
    this.update = this.update.bind(this)
    window.addEventListener("resize", this.update)
    this.update()
  }

  disconnect() {
    window.removeEventListener("resize", this.update)
  }

  toggle() {
    if (this.isDesktop()) return

    this.isOpen = !this.isOpen
    this.applyState()
  }

  update() {
    if (this.isDesktop()) {
      this.menuTarget.classList.remove("hidden")
      this.openIconTarget.classList.remove("hidden")
      this.closeIconTarget.classList.add("hidden")
      this.isOpen = false
    } else {
      this.applyState()
    }
  }

  applyState() {
    this.menuTarget.classList.toggle("hidden", !this.isOpen)
    this.openIconTarget.classList.toggle("hidden", this.isOpen)
    this.closeIconTarget.classList.toggle("hidden", !this.isOpen)
  }

  isDesktop() {
    return window.matchMedia("(min-width: 640px)").matches
  }
}
