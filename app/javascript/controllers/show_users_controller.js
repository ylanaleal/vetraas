import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static targets = ["showElement", "newElement"]

    connect() {
        console.log("hello from stimulus controller")
    }

    show() {
      this.newElementTarget.classList.add("d-none")
      this.showElementTarget.classList.remove("d-none")
      console.log("clicked show button")
    }

    new() {
      this.showElementTarget.classList.add("d-none")
      this.newElementTarget.classList.remove("d-none")
      console.log("clicked new button")
    }
}
