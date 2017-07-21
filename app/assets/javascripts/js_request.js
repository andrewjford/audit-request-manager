class RequestResponse {
  constructor(response) {
    this.response = response;
  }
  updateDate() {
    var date = new Date(this.response["data"]["attributes"]["updated-at"]);
    var options = {year: 'numeric', month: 'short', day: 'numeric', hour: 'numeric',
    minute: 'numeric', timeZone: 'America/New_York'};
    var outDate = date.toLocaleDateString('en-US',options);

    //add formatted date to json
    this.response["data"]["date"] = outDate;
  }

  render(targetElement) {
    //takes json 'data' and puts into div 'targetElement'
    targetElement.html(HandlebarsTemplates['requests/show'](this.response.data));
  }
}

//add listeners
$(document).on('turbolinks:load', function() {
  $('.js-get-request').on('click',function(){
    event.preventDefault();

    //get div where we will enter new info
    var targetElement = $(this).parent().prev().children(".expand-content");

    //conditional for expand toggling
    if(this.dataset.expanded === "false"){
      getRequest($(this), targetElement);
    }
    else {
      shrinkRequest($(this), targetElement)
    }
  });
});

function getRequest(element, targetElement){
  $.get(element.attr('href'), function(data){
    //change expand icon to minus
    element.html('<i class="fa fa-minus-square"></i>');

    var response = new RequestResponse(data);
    response.updateDate();

    //render new json
    response.render(targetElement);

    // flip toggle switch
    element.attr('data-expanded', "true");
    // targetElement.addClass("expanded"); // for css on expanded section
  }, "json");
}

function shrinkRequest(element, targetElement){
  //reduce targetElement to origin state
  targetElement.html("");

  //change expand icon back to plus
  element.html('<i class="fa fa-plus-square"></i>');

  //flip toggle switch
  element.attr('data-expanded','false');
  // targetElement.removeClass("expanded");
}
