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
    showComment(data);
  })
}

function showComment(data){
  var date = new Date(data["data"]["attributes"]["created-at"]);
  var options = {year: 'numeric', month: 'short', day: 'numeric', hour: 'numeric',
  minute: 'numeric', timeZone: 'America/New_York'};

  var outDate = date.toLocaleDateString('en-US',options)
  data["data"]["date"] = outDate;
  var newComment = HandlebarsTemplates['comments/show'](data.data);
  $('#comment-list').append(newComment);
}
