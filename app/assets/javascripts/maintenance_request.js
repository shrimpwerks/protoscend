 // Place all the behaviors and hooks related to the matching controller here.
 // All this logic will automatically be available in application.js.
 // You can use CoffeeScript in this file: http://coffeescript.org/

var ready = function(e) {

  // If the reason supplied for the maintenance is too long, we don't want it
  // to make our table look gross. This will chop off the end in the 'index'
  // view and replace it with continuation dots leading into the 'show' view.
  $("#maintenance_requests_list tbody tr td").each(function() {
    var str = $(this).text();

    if (str.length > 80) {
      $(this).html(str.substring(0, 76) + " ...");
    }
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
