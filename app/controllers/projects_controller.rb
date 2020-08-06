class ProjectsController < ApplicationController
  get '/projects/show' do
    erb :'projects/show'
  end
end
