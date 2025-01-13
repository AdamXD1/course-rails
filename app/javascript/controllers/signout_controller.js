import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  signout() {
    console.log("funciona xd")
    const itemSingOut = document.getElementById("sign_out_li");
    itemSingOut.classList.toggle("hidden");
  }


}