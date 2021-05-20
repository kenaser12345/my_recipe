import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = [ "recipe_img", "img_input", "tag_select", "add_ingredient_btn"]

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
        console.log(resp.documentElement.querySelector(".ingredient_input"))     
        const el_to_add = resp.documentElement.querySelector(".ingredient_input")
        document.querySelector(".ingredient_section .form_section").append(el_to_add)
      },
      error: err => {
        console.log(err)
      }

    })

  }
}
