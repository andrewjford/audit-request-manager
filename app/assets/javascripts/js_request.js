$(document).on('turbolinks:load', function() {
  //add listeners
  $('.js-get-request').on('click',function(){
    event.preventDefault();
    var infoDiv = this.parentElement.previousElementSibling
    if(this.dataset.expanded === "false"){
      this.setAttribute('data-expanded', "true")
      getRequest($(this), infoDiv);
    }
    else {
      shrinkRequest($(this, infoDiv))
    }
  });
});

function getRequest(element, infoDiv){
  $.get(element.attr('href'), function(){}, "json")
  .done(function(data){
    renderRequest(data, infoDiv);
  });
}

function renderRequest(data,infoDiv){
  debugger;
  var showRequest = HandlebarsTemplates['requests/show'](data.data);
  infoDiv.innerHTML = showRequest;
}

function shrinkRequest(element, infoDiv){
  infoDiv.innerHTML = ""
}
