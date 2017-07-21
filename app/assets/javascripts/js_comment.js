function CommentResponse(response){
  this.response = response;
}

CommentResponse.prototype.formatDate = function() {
  //format json date to match format on html page
  var date = new Date(this.response.data.attributes["created-at"]);
  var options = {year: 'numeric', month: 'short', day: 'numeric', hour: 'numeric',
  minute: 'numeric', timeZone: 'America/New_York'};
  var outDate = date.toLocaleDateString('en-US',options);

  //add formatted date to json
  this.response.data.date = outDate;
}

CommentResponse.prototype.render = function(targetElement, template) {
  //appends object's json data into targetElement after running it through template
  var newComment = template(this.response.data);
  targetElement.append(newComment);
}

// listeners
$(document).on('turbolinks:load', function() {
  $('#comment-form').submit(function(){
    event.preventDefault();
    var form = $(this);
    addComment(form);
  });
});

function addComment(form){
  var formValues = form.serialize();
  $.post(form.attr('action'), formValues, showComment, "json");
}

function showComment(data){
  var commentObject = new CommentResponse(data);
  commentObject.formatDate();
  commentObject.render($('#comment-list'), HandlebarsTemplates['comments/show']);
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
