import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'box' ]

  greet() {
    const element = this.boxTarget
    console.log(`Hello, ${element}!`)
    // console.log(this.element.offset())
    // const next = this.nextTarget;
    // next.scrollIntoView({behavior: "smooth", block: "end"})
    // this.element.classList.add('lalala')
  }

}
