High
- refactor views for better partials/helpers
- linkedin omniauth
- review that authorizations are complete

Med
- add user link on comments
- select role on signup (for demos)
- on signup, add new user to demo project
- should display 'none' when no projects assigned
- give admin UI to set role levels
- all info table mode for exporting
- Summary of outstanding items
- tests
- Client comment background color is different

Low
- allow admin to manage users
- add comment form failure should display flash message
- dummy file-uploads
- timezone stuff, currently showing in EST
- changed since last login
- make request :id for path == request_count_id
- edit comments


Notes
- is it best practice to have hidden inputs in form, or add inputs in through controller?
- is it better to use ActiveRecord queries to scope index or just do it manually
in the controller with activerecord model associations?
