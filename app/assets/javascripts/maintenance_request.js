 // Place all the behaviors and hooks related to the matching controller here.
 // All this logic will automatically be available in application.js.
 // You can use CoffeeScript in this file: http://coffeescript.org/

var ready = function(e) {
  $('#maintenance_request_reason').keyup(function() {
    var count = $(this).val().length;
    if (count > 0 && count < 501) {
      $('#maintenance_request_submit').prop('disabled', false);
    } else {
      $('#maintenance_request_submit').prop('disabled', true);
    }
    $("#maintenance_reason_char_count").html("( " + count + " / 500 )");
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
