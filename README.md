# Happy Hummingbird Volunteers

## Description

The application is designed to coordinate volunteers and projects. The current capacity of this applicaiton allows volunteers to register. Once registered, volunteers can view current projects and create projects as well. All registered users can view all projects, only the creator of a project can make edits or delete a project.

## Installation

To use, clone and run shotgun.

## Create

The logged-in volunteer is able to make a new project. The params are passed via mass assignment. An `if statement` is in place to verify the volunteer is 1) logged in 2) Name && Role && Date are not '', empty strings.

## Read

The logged-in volunteer can see all projects via the `'/projects/index'` page. The `'/projects/show'` page shows a specific project's details. You can navigate to the `'/project/show'` via a button `"More Info"` from the index page. The projects the volunteer created are housed on the main projects page and also in their personal homepage.

## Update

The volunteer is able to update their project's information. They can not leave the Name and Date blank during the update, their is an `if statement` to verify Name && Date are not '', empty strings. They are able to change any field, and can leave other fields blank. The volunteer does not have access to edit a project that they didn't make. The 'edit page' uses a `patch` request. The form is rendered, when submitted it will be directed via `<input type="hidden" value="patch" name="_method">`. First, `params.delete(:_method)` then the params are passed in.

## Destroy

The volunteer can destroy the project they have made. They do not have access to destroy other volunteers' projects.

## Dependencies

> gem 'sinatra'

> gem 'activerecord', '5.2', require: 'active_record'

> gem 'sinatra-activerecord', require: 'sinatra/activerecord'

> gem 'rake'

> gem 'require_all'

> gem 'sqlite3', '~> 1.3.6'

> gem 'thin'

> gem 'shotgun'

> gem 'pry'

> gem 'bcrypt'

> gem 'tux'

## License Copyright <2020> <lilleydev>

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Happy Hummingbird Volunteer project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/<lilleydev>/hhvolunteers/blob/master/CODE_OF_CONDUCT.md).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lilleydev/hhvolunteers. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/<lilleydev>/hhvolunteers/blob/master/CODE_OF_CONDUCT.md).
