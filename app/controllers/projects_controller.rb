class ProjectsController < ApplicationController
  get '/projects' do
    @projects = Project.all

    erb :'projects/index'
  end

  get '/projects/new' do
    erb :'/projects/new'
  end

  post '/projects' do
    redirect '/' unless logged_in?
    if params[:name] && params[:role] && params[:date] != ''
      project = Project.new(params)
      project.save
      @projects = Project.all
      redirect :'/projects'
    else
      redirect :'/projects/new'
    end
  end

  post '/projects/:id' do
    @projects = Project.find_by(id: params[:id])
    erb :'projects/show'
  end

  # get '/projects/:id' do
  #   binding.pry
  #   @projects = Project.id
  #   erb :'projects/show'
  # end
end
