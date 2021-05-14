// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.



import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap";
import "controllers";
import $ from 'jquery'
import "select2/dist/css/select2.min.css";
import "select2/dist/js/select2.full.min.js";

Rails.start()
Turbolinks.start()
ActiveStorage.start()


window.$ = $

$(document).ready(function() {
  $('select').select2({
    tags: true,
    tokenSeparators: [',', ' ']
  }
  );
});

require("styles")
require("bootstrap")
require("select2")
