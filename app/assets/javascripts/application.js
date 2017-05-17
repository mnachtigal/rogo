// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require gmaps/google
//= require underscore.js
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .
//= require owl.carousel
//= require filterrific/filterrific-jquery

$(document).foundation();

$(document).ready(function(){
	$(".owl-carousel").owlCarousel({
		navigation:true,
		paginationSpeed : 400,
		slideSpeed : 300,
		singleItem : true,
	});
});


// checking out script for previewing images 
document.getElementById('files').addEventListener('change', handleFileSelect, false);

function handleFileSelect(evt) {
  var files = evt.target.files; // FileList object

  // Loop through the FileList and render image files as thumbnails.
  for (var i = 0, f; f = files[i]; i++) {

    // Only process image files.
    if (!f.type.match('image.*')) {
      continue;
    }

    var reader = new FileReader();

    // Closure to capture the file information.
    reader.onload = (function(theFile) {
      return function(e) {
        // Render thumbnail.
        var span = document.createElement('span');
        span.innerHTML = ['<img class="thumb" onclick="select(this.id)" src="', e.target.result, '" id="', theFile.name, '" alt="can_you_see_me" />'].join('');
        document.getElementById('list').insertBefore(span, null);
        init_img();
      };
    })(f);

    // Read in the image file as a data URL.
    reader.readAsDataURL(f);
  }
}

function select(id) {
  deselect();
  document.getElementById(id).style.border = "8px solid black";
  document.getElementById("name").innerHTML = id;

}

function deselect() {
  var thumbs = document.getElementsByClassName("thumb");
  if(thumbs.length > 0 )
  {
   for(var i = 0; i < thumbs.length; i++) {
      thumbs[i].style.border = "none";
   }
  }
}

function init_img() {
  var thumbs = document.getElementsByClassName("thumb");
  thumbs[0].style.border = "8px solid black";
  document.getElementById("name").innerHTML = thumbs[0].id;

}
