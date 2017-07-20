$(document).on('turbolinks:load', function() {
  //add listeners
  $('#users-link').on("click", function(){
    event.preventDefault();
    usersIndex($(this));
  });
});

function usersIndex(element){
  event.preventDefault;
  $.get(element.attr('href'), function(){}, "json")
  .done(function(data){
    loadUserPage(data);
  })
}

function loadUserPage(data) {
  var userIndex = HandlebarsTemplates['users/index'](data.data);
  $('main').html(userIndex);
}
