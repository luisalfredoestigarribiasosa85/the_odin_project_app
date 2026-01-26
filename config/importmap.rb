# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "trix"
pin "@rails/actiontext", to: "actiontext.esm.js"

pin "lightgallery", to: "https://ga.jspm.io/npm:lightgallery@2.7.2/lightgallery.es5.js"
pin "lg-thumbnail", to: "https://ga.jspm.io/npm:lg-thumbnail@2.7.2/lg-thumbnail.es5.js"
pin "lg-zoom", to: "https://ga.jspm.io/npm:lg-zoom@2.7.2/lg-zoom.es5.js"
