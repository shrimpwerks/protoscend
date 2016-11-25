$(document).on('ready', function(event) {
  var rating;

  $('#route_show_rating').barrating({
    theme: 'bootstrap-stars',
    readonly: true,
  });

  $('.multi_rating').each(function() {
    $(this).barrating({
      theme: 'bootstrap-stars',
      readonly: true,
    });
    rating = $(this).data().rating;
    $(this).barrating('set',parseInt(rating));
  });

  if ($('#route_show_rating').data() !== undefined) {
    rating = $('#route_show_rating').data().rating;
  }
  $('#route_show_rating').barrating('set',rating);

  $('#route_set_rating').barrating({
    theme: 'bootstrap-stars',
    readonly: false,
    onSelect: function(value, text, event) {
      if (typeof(event) !== 'undefined') {
        var desc = '';
        switch (value) {
          case "1":
            desc = 'Bad';
            break;
          case "2":
            desc = 'Not great';
            break;
          case "3":
            desc = 'Okay';
            break;
          case "4":
            desc = 'Good';
            break;
          case "5":
            desc = 'Great';
            break;
        }

        $("#rating_description").html(desc);

        $.post('/ratings', {
          route_id: text,
          rating: value,
        });
      }
    }
  });

  if ($('#route_set_rating').data() !== undefined) {
    var rating = $('#route_set_rating').data().rating;
  }

  $('#route_set_rating').barrating('set',rating);

});
