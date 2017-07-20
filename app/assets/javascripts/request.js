$(function(){
  $('#comment-form').submit(function(){
    event.preventDefault();
    var form = $(this);
    addComment(form);
  })
})

function addComment(form){
  var formValues = form.serialize();
  $.post(form.attr('action'), formValues, showComment,"json");

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

function deleteComment(element){
  event.preventDefault();
  var commentElement = element.parentElement.parentElement;
  // delete from db
  $.ajax({
    url: element.attributes.href.value,
    type: 'delete',
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    dataType: "json",
    success: function(resp){
      // remove div from dom
      commentElement.remove();
    }
  })
}
