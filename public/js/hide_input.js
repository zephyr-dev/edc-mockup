(function() {
  var scntDiv = $('#p_scents');

  $(document).on('click', '#addScnt', function() {
    $('<p><label for="p_scnts"><input type="text" id="p_scnt" size="20" name="p_scnt_' + i +'" value="" placeholder="Input Value" /></label> <a href="#" id="remScnt">Remove</a></p>').appendTo(scntDiv);
    i++;
    return false;
  });

  $(document).on('click', '#remScnt', function() {
    if( i > 2 ) {
      $(this).parents('p').remove();
      i--;
    }
    return false;
  });
});

