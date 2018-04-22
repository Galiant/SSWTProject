// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require jquery3
//= require jquery_ujs

document.addEventListener("turbolinks:load", function() {
  // whatever you want to make sure is loaded on each page

  // Footer fix
  // function to set the height on fly
  function autoHeight() {
    $('.mainCont').css('min-height', 0);
    $('.mainCont').css('min-height', (
      $(document).height() -
      $('.header').height() -
      $('.foot').height()
    ));
  }

  // onDocumentReady function bind
  $(document).ready(function() {
    autoHeight();
  });

  // onResize bind of the function
  $(window).resize(function() {
    autoHeight();
  });

  // End Footer fix

})
