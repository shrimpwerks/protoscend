// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function() {
  $('#comment_comment').keyup(function() {
    if ($(this).val().length > 0) {
      $('#comment_submit').prop('disabled', false);
    } else {
      $('#comment_submit').prop('disabled', true);
    }
  });
});
