// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require("packs/chosen.jquery.min.js");
require("packs/customize-select.js");
require("packs/jquery.fittex.js");
require("packs/moment.js");
require("packs/moment.min.js");
require("packs/ofi.browser.js");
require("packs/script.js");
require("packs/script.min.js");
require("packs/script.min.js");
require("packs/slick.js");


import 'bootstrap'

import '../stylesheets/application'
import '../stylesheets/flexslider'
import '../stylesheets/ie'
import '../stylesheets/print'
import '../stylesheets/screen'
import '../stylesheets/slick'
import '../stylesheets/screen1'

document.addEventListener("turbolinks:load",()=>{
	$('[data-toggle="tooltip"]').tooltip()
	$('[data-toggle="popover"]').popover()
})


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)



