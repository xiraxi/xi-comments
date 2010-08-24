jQuery(function($) {

  $("#comment_content").
    css("height", "6ex").
    focus(function() { $(this).animate({height: "300px"}) });

});
