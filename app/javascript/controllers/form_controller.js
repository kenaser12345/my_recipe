import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "recipe_img", "img_input", "tag_select" ]

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

}
