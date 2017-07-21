$(document).on('turbolinks:load', function() {
  //add listeners
  $('#comment-form').submit(function(){
    event.preventDefault();
    var form = $(this);
    addComment(form);
  });
});

function addComment(form){
  var formValues = form.serialize();
  $.post(form.attr('action'), formValues, showComment,"json");
}

function showComment(data){
  //format json date to match format on html page
  var date = new Date(data["data"]["attributes"]["created-at"]);
  var options = {year: 'numeric', month: 'short', day: 'numeric', hour: 'numeric',
  minute: 'numeric', timeZone: 'America/New_York'};
  var outDate = date.toLocaleDateString('en-US',options);

  //add formatted date to json
  data["data"]["date"] = outDate;

  var newComment = HandlebarsTemplates['comments/show'](data.data);
  $('#comment-list').append(newComment);

  //clear text from form box
  emptyCommentForm();
}

function emptyCommentForm(){
  $('#comment-form').trigger("reset");
}

function deleteComment(element){
  event.preventDefault();

  // delete from db
  $.ajax({
    url: element.attributes.href.value,
    type: 'delete',
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    dataType: "json",
    success: function(resp){
      // get li element that represent entire comment
      // remove comment from dom
      var commentElement = element.parentElement.parentElement;
      commentElement.remove();
    }
  })
}
