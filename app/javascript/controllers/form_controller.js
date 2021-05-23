import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = [ "recipe_img", "img_input", "tag_select", "add_ingredient_btn", "add_step_btn", "delete_ingredient_btn", "delete_step_btn"]

  connect(){
    $(document).keypress(function(e){
      if (e.which == '13') {
        e.preventDefault();
      }
    })
  }

  upload_preview(){
    const input = this.img_inputTarget
    const recipe_img = this.recipe_imgTarget

    if(input.files && input.files[0]){
      const reader = new FileReader();
      reader.onload = function (e) {
        recipe_img.setAttribute('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  add_ingredient(e){
    e.preventDefault();

    Rails.ajax({
      url: "add_ingredient",
      type: "GET",
      dataType: "json",
      success: resp => {  
        const el_to_add = resp.documentElement.querySelector(".ingredient_input")
        document.querySelector(".ingredient_section .form_section").append(el_to_add)
      },
      error: err => {
        
      }
    })
  }

  add_step(e){
    e.preventDefault();

    Rails.ajax({
      url: "add_step",
      type: "GET",
      dataType: "json",
      success: resp => {  
        const el_to_add = resp.documentElement.querySelector(".step_form_group")
        document.querySelector(".step_section .form_section").append(el_to_add)
        // set step sequence
        const inputs = document.querySelectorAll(".step_sequence_input")
        const sequence = document.querySelectorAll(".step_sequence")
        inputs.forEach(function(step, i) {
          step.value = i+1
        })
        sequence.forEach(function(seq, i) {
          i = i+1
          seq.innerHTML = "<h1>" + i + "</h1>"
        })
      },
      error: err => {
        
      }
    })

  }

  delete_ingredient(e){
    e.preventDefault()
    const form = this.delete_ingredient_btnTarget.parentNode
    form.parentNode.removeChild(form)
  }

  delete_step(e){
    e.preventDefault()
    const form = this.delete_step_btnTarget.parentNode
    form.parentNode.removeChild(form)
    
    // set step sequence
    const inputs = document.querySelectorAll(".step_sequence_input")
    const sequence = document.querySelectorAll(".step_sequence")
    inputs.forEach(function(step, i) {
      step.value = i+1
    })
    sequence.forEach(function(seq, i) {
      i = i+1
      seq.innerHTML = "<h1>" + i + "</h1>"
    })
  }
}
