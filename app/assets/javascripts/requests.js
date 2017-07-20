$(document).on('turbolinks:load', function() {
  //add listeners
  $('#js-next').submit(function(){
    event.preventDefault();
    nextRequest($(this));
  });
});
