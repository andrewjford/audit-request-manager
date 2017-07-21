$(document).on('turbolinks:load', function() {
  //add listeners
  $('.js-get-request').on('click',function(){
    event.preventDefault();

    //get div where we will enter new info
    var infoDiv = this.parentElement.previousElementSibling

    //conditional for expand toggling
    if(this.dataset.expanded === "false"){
      //old code
      this.setAttribute('data-expanded', "true")
      getRequest($(this), infoDiv);

      //new code

    }
    else {
      shrinkRequest($(this), infoDiv)
    }
  });
});


// New code w/objects
function RequestResponse(response){
  this.response = response;
}

RequestResponse.prototype.updateDate = function() {
  var date = new Date(this.response["data"]["attributes"]["updated-at"]);
  var options = {year: 'numeric', month: 'short', day: 'numeric', hour: 'numeric',
  minute: 'numeric', timeZone: 'America/New_York'};
  var outDate = date.toLocaleDateString('en-US',options);

  //add formatted date to json
  this.response["data"]["date"] = outDate;
}

RequestResponse.prototype.render = function(element) {
  //takes json 'data' and puts into div 'infoDiv'
  element.innerHTML = HandlebarsTemplates['requests/show'](this.response.data);
}

// Old format is below

function getRequest(element, infoDiv){
  $.get(element.attr('href'), function(){}, "json")
  .done(function(data){
    //change expand icon to minus
    element.html('<i class="fa fa-minus-square"></i>');

    var response = new RequestResponse(data);
    response.updateDate();
    response.render(infoDiv);

    //old code:
    // //format json date
    // var date = new Date(data["data"]["attributes"]["updated-at"]);
    // var options = {year: 'numeric', month: 'short', day: 'numeric', hour: 'numeric',
    // minute: 'numeric', timeZone: 'America/New_York'};
    // var outDate = date.toLocaleDateString('en-US',options);
    //
    // //add formatted date to json
    // data["data"]["date"] = outDate;
    //
    // renderRequest(data, infoDiv);
  });
}

function renderRequest(data,infoDiv){
  //takes json 'data' and puts into div 'infoDiv'
  var showRequest = HandlebarsTemplates['requests/show'](data.data);
  infoDiv.innerHTML = showRequest;

}

function shrinkRequest(element, infoDiv){
  //reduce info to origin state
  infoDiv.innerHTML = infoDiv.children[0].innerHTML;

  //change expand icon back to plus
  element.html('<i class="fa fa-plus-square"></i>');

  //flip toggle switch
  element.attr('data-expanded','false');
}
