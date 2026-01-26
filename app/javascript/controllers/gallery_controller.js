import { Controller } from "@hotwired/stimulus"
import lightGallery from 'lightgallery'
import lgThumbnail from 'lg-thumbnail'
import lgZoom from 'lg-zoom'

export default class extends Controller {
  connect() {
    this.gallery = lightGallery(this.element, {
      plugins: [lgThumbnail, lgZoom],
      speed: 500,
    })
  }

  disconnect() {
    if (this.gallery) {
      this.gallery.destroy()
    }
  }
}
