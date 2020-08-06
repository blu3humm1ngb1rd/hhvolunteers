class ProjectsController < ApplicationController
  get '/projects/show' do
    @project = Project.all
    erb :'projects/show'
  end

  get '/projects/show/:id' do
    'this is projects speciifc page'
  end
end
