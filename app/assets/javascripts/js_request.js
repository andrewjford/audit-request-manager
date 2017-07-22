function RequestResponse(response) {
  this.response = response;
  this.comments = this.response.data.attributes.comments;
}

RequestResponse.prototype.updateDate = function() {
  var date = new Date(this.response["data"]["attributes"]["updated-at"]);
  var options = {year: 'numeric', month: 'short', day: 'numeric', hour: 'numeric',
  minute: 'numeric', timeZone: 'America/New_York'};
  var outDate = date.toLocaleDateString('en-US',options);

  //add formatted date to json
  this.response["data"]["date"] = outDate;
}

RequestResponse.prototype.formatCommentDates = function() {
  for(var i=0;i<this.comments.length;i++){

    var date = new Date(this.comments[i]["created-at"]);
    var options = {year: 'numeric', month: 'short', day: 'numeric', hour: 'numeric',
    minute: 'numeric', timeZone: 'America/New_York'};
    var outDate = date.toLocaleDateString('en-US',options);

    this.comments[i]["created-at-formatted"] = outDate;
  }
}

RequestResponse.prototype.render = function(targetElement, template) {
  //takes json and puts into div 'targetElement' using template parameter
  targetElement.html(template(this.response.data));
}


//add listeners
$(document).on('turbolinks:load', function() {

  // request expand button (plus/minus)
  $('.js-get-request').on('click',function(){
    event.preventDefault();

    //get div where we will enter new info
    // var targetElement = $(this).parent().prev().children(".expand-content");
    var targetElement = $(this).parent().prev().children();

    //conditional for expand toggling
    if(this.dataset.expanded === "false"){
      getRequest($(this), targetElement);
    }
    else {
      shrinkRequest($(this), targetElement)
    }
  });

  // all filter button
  $('#filter-all').on('click', function(){
    event.preventDefault();

    $('tr').removeClass('hidden');
  });

  // open filter button
  $('#filter-open').on('click', function(){
    event.preventDefault();
    filterRequests('Open');
  });

  // submitted filter button
  $('#filter-submitted').on('click', function(){
    event.preventDefault();
    filterRequests('Client Submitted');
  });

  // closed filter button
  $('#filter-closed').on('click', function(){
    event.preventDefault();
    filterRequests('Closed');
  });

});

// Other functions

function filterRequests(status){
  $('tr').each(function(){
    if($(':nth-child(2)', this).text() === status){
      $(this).removeClass('hidden');
    }
    else{
      $(this).addClass('hidden');
    }
  });
}

function getRequest(element, targetElement){
  $.get(element.attr('href'), function(data){
    //change expand icon to minus
    element.html('<i class="fa fa-minus-square"></i>');

    var response = new RequestResponse(data);
    response.updateDate();
    response.formatCommentDates();

    //render new json
    response.render(targetElement, HandlebarsTemplates['requests/show']);

    // flip toggle switch
    element.attr('data-expanded', "true");
    // for transition
    targetElement.addClass('expand');
  }, "json");
}

function shrinkRequest(element, targetElement){
  //reduce targetElement to origin state
  targetElement.html(targetElement.children(".hidden").html());

  //change expand icon back to plus
  element.html('<i class="fa fa-plus-square"></i>');

  //flip toggle switch
  element.attr('data-expanded','false');
  // for transition
  targetElement.removeClass('expand');
}
