
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap";
import "controllers";
import $ from 'jquery'
import "select2/dist/css/select2.min.css";
import "select2/dist/js/select2.full.min.js";
import '@fortawesome/fontawesome-free/js/all';
import '@fortawesome/fontawesome-free/css/all.min.css';

Rails.start()
Turbolinks.start()
ActiveStorage.start()


window.$ = $
$(window).on('turbolinks:load', function(){
  $('select').select2({
      tags: true,
      tokenSeparators: [',', ' ']
    }
    );
})

require("styles")
require("bootstrap")
require("select2")
