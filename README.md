# Happy Hummingbird Volunteers

The application is designed to coordinate volunteers and projects. The current capacity of this applicaiton allows volunteers to register. Once registered, volunteers can view current projects and create projects as well. All registered users can view all projects, only the creator of a project can make edits or delete a project. To use, clone and run shotgun.

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

Copyright <2020> <lilleydev>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
