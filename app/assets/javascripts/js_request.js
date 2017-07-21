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
      shrinkRequest($(this), infoDiv)
    }
  });
});

function getRequest(element, infoDiv){
  $.get(element.attr('href'), function(){}, "json")
  .done(function(data){
    element.html('<i class="fa fa-minus-square"></i>');
    renderRequest(data, infoDiv);
  });
}

function renderRequest(data,infoDiv){
  var showRequest = HandlebarsTemplates['requests/show'](data.data);
  infoDiv.innerHTML = showRequest;

}

function shrinkRequest(element, infoDiv){
  infoDiv.innerHTML = infoDiv.children[0].innerHTML;
  element.html('<i class="fa fa-plus-square"></i>');
  element.attr('data-expanded','false');
}
