High

Med

Low
- make open/close/upload buttons function with JS
- delete button on comments will not work without JS due to underlying jQuery dependency i think
- bug where user gets added twice to project if the project failed to send the first time
- tests
- review views after a user is deleted
- Summary of outstanding items
- all info table mode for exporting
- give admin UI to set role levels
- allow admin to manage users
- dummy file-uploads
- timezone stuff, currently showing in EST
- changed since last login
- make request :id for path == request_count_id
- edit comments
- add links on user index page


Notes
- why are my activerecord queries not returning in order by id? ex: request.comments
- is it best practice to have hidden inputs in form, or add inputs in through controller?
- is it better to use ActiveRecord queries to scope index or just do it manually
in the controller with activerecord model associations?

Issue with activerecord not ordering collections properly? For instance if you call Comment.all and activerecord returns a collection that is not ordered by id.
