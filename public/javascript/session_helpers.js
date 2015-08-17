// check if they have the necessary client-side session variables
$( document ).ready(function() {
  if (sessionStorage.getItem('routing_error_message')) {
    $("#routing_error_message").show();
    sessionStorage.removeItem('routing_error_message');
  }
  if (!sessionStorage.getItem('authentication') && (window.location != 'http://localhost:3000/')) {
    sessionStorage.setItem('routing_error_message', true);
    // history.back();
    $(location).attr('href','http://localhost:3000/');
  }
});

// clear the client-side session if they're done with this page.
$("#logout_button").on('click',function() {
  // $.ajax({
  //   type: "DELETE",
  //   url: "http://localhost:3000/api/authentication/" + sessionStorage.getItem('id'),
  //   dataType: 'json',
  //   success: function(data) {
  //     console.log(data);
  //   },
  //   error: function(xhr, status, err) {
  //     console.error(status, err.toString());
  //   }
  // });
  sessionStorage.clear();
});

// hide the logout button if they seem to be logged in
if (!sessionStorage.getItem('id')) {
  $("#logout_button").hide();
}
