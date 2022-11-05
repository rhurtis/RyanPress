// controller for tinymce
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    tinymce.init({
        selector: ".tinymce",
        plugins: [
          "image",
          "advlist autolink lists link image charmap print preview anchor",
          "searchreplace visualblocks code fullscreen",
          "insertdatetime media table paste code help wordcount",
        ],
        toolbar:
          "file edit view insert format tools undo redo | formatselect | bold italic backcolor | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | removeformat | help | image",
        content_style: "body {font-size: 11pt; color: #374151}",
        skin: "oxide-dark",

      });
  }
  
  // disconnect() {
  //  // tinymce.activeEditor.destroy()
  // }
}

/*
notes for testing this:
- check if html elements are being saved in the db and then displayed on the show page.
*/