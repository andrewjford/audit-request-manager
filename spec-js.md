# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
  - does the json show need to display as much as the html?
- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
  - Users index page (for admins only)
  - look into implementing something similar for all requests of project
- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
  - request show on project page. Has many comments
  - issues with nesting and json_api active model serialization
- [x] Use your Rails API and a form to create a resource and render the response without a page refresh.
  - Comments on request show page
- [ ] Translate JSON responses into js model objects.
  - just the responses?
  - does the jquery auto convert response
  - what adapter serializer
- [ ] At least one of the js model objects must have at least one method added by your code to the prototype.

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
