High
- Show page that renders in jQuery with a JSON backend
- Index page that renders via jQuery with JSON backend
- Render has_many (comments) with JSON rendered request show page
- JSON responses must translate into JS model objects with one method on the prototype. Ex: Comment object that has method that appends to itself to DOM?
- make request updates not refresh page

- expand js model
- review json gets/posts

Med
- (done) JSON API create a resource and render without page refresh (comment?)
- js request mixes jquery and javascript too much, stick to one
- order comments by date

Low
- change delete comment in js to page listener instead of attached onclick? or add onclick to html form submittal.
- add comment dates to request expanded
- bug where user gets added twice to project if the project failed to send the first time
- tests
- fix views to not break when a user is deleted
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
- is it best practice to have hidden inputs in form, or add inputs in through controller?
- is it better to use ActiveRecord queries to scope index or just do it manually
in the controller with activerecord model associations?
