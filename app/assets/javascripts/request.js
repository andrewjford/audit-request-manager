$(function(){
  $('#comment-form').submit(function(){
    event.preventDefault();
    var form = $(this);
    addComment(form);
  })
})

function addComment(form){
  var formValues = form.serialize();
  var posting = $.post(form.attr('action'), formValues);

  posting.done(function(data){
    console.log(data);
  })
}
