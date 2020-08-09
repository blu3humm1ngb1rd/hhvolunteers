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
      # binding.pry
      project = Project.new(name: params[:name], completed: params[:completed], assigned: params[:assigned], role: params[:role], number_of_hours: params[:number_of_hours], date: params[:date], time: params[:time])
      project.id = current_user.id
      project.save
      # @projects = Project.all
      redirect :"/projects/#{project.id}"
    else
      redirect :'/projects/new'
    end
  end

  get '/projects/:id' do
    @projects = Project.find_by(id: params[:id])
    erb :'projects/show'
  end

  # get '/projects/:id' do
  #   binding.pry
  #   @projects = Project.id
  #   erb :'projects/show'
  # end
end
