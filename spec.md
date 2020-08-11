# Specifications for the Sinatra Assessment

Specs:

- [x] Use Sinatra to build the app

> I built the Happy Hummingbird Volutneer application.

- [x] Use ActiveRecord for storing information in a database

> I utilized ActiveRecord to create my tables and persist information from the volunteer users.

- [x] Include more than one model class (e.g. User, Post, Category)

> I have three models: Volunteer, Project, and VolunteerProject.

- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)

> The volunteers has_many projects and has_many created_projects. The projects has_many volunteers.

- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)

> The VolunteerProject belongs_to projects and volunteers.

- [x] Include user accounts with unique login attribute (username or email)

> The Volunteer model `validates_uniqueness_of :email`.

- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying

> I utilized a helper method for `current_user` to provide volunteer the capabaility to: `/projects/new` , `/projects/show` and `/projects/index` for 'reading' projects , updating via a patch request for `/projects/id` and destroying via a delete request for `/projects/:id` with the destroy method.

- [x] Ensure that users can't modify content created by other users

> I used an `if statement` to verify the `current_user.id == projects.volunteer.id` , if this verification failed, the current_user could not see nor have access to the edit page from the project created by another user.

- [x] Include user input validations

> A volunteer can NOT register without at least a 1) first name, 2)email 3) password. Also, a volunteer can not update a project and leave either the name or date field blank. This update will not be accepted.

- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)

- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code.

> The README.md includes: Description, Installation, Create, Read, Update, Destroy, Dependencies, Code of Conduct, License link, and Contribution sections.

Confirm

- [x] You have a large number of small Git commits

> I did commits for every 1 - 5 adds.

- [x] Your commit messages are meaningful

> I used declarative commit statements to reflect the coding changes.

- [x] You made the changes in a commit that relate to the commit message

> The commit reflected the changes made.

- [x] You don't include changes in a commit that aren't related to the commit message

> I often times had to do commits for 1-2 adds, instead of 3-5 adds to ensure the commit methods were meaningful to the current task.
