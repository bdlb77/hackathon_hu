import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "name", 'next' ]

  greet() {
    const element = this.nameTarget
    const name = element.value
    console.log(`Hello, ${name}!`)
    // console.log(this.element.offset())
    const next = this.nextTarget;
    next.scrollIntoView({behavior: "smooth", block: "end"})
    // this.element.classList.add('lalala')
  }

}
