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
      @volunteers = current_user
      redirect :"/projects/#{project.id}"
    else
      redirect :'/projects/new'
    end
  end

  get '/projects/:id' do
    set_project
    erb :'projects/show'
  end

  post '/projects/:id' do
    set_project
    erb :'projects/show'
  end

  get '/projects/:id/edit' do
    set_project
    if logged_in?
      if @projects.id == current_user.id
        erb :'/projects/edit'
      else
        redirect :"/projects/#{@projects.id}"
      end
    else
      redirect '/'
    end
  end

  patch '/projects/:id' do
    set_project
    params.delete(:_method)
    @projects.update(params)
    redirect "/projects/#{@projects.id}"
  end

  private

  def set_project
    @projects = Project.find(params[:id])
  end
end
