import { Controller } from "@hotwired/stimulus"

const restoreform = (id) =>{
  document.getElementById(`${id}`).reset();
}

export default class extends Controller {
  resetform() {
    document.getElementById('modal').remove();
  }
  questionForm(e){
    const formId = e.target.id;
    const timer = setInterval(() => {
      restoreform(formId);
      clearInterval(timer);
    },100)
  }

  optionForm(e){
    const formId = e.target.id;
    const timer = setInterval(() => {
      restoreform(formId);
      clearInterval(timer);
    },100)
  }
}
