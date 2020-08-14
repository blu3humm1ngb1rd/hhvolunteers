class ProjectsController < ApplicationController
  get '/projects' do
    redirect_if_logged_out
    @projects = Project.all
    erb :'projects/index'
  end

  get '/projects/new' do
    erb :'/projects/new'
  end

  post '/projects' do
    redirect_if_logged_out
    if params[:name] && params[:role] && params[:date] != ''

      project = current_user.created_projects.new(name: params[:name], completed: params[:completed], assigned: params[:assigned], role: params[:role], number_of_hours: params[:number_of_hours], date: params[:date], time: params[:time])

      project.save
      redirect :"/projects/#{project.id}"
    else
      redirect :'/projects/new'
    end
  end

  get '/projects/:id' do
    set_project
    # binding.pry
    # @volunteer = Volunteer.all.find(params[:current_user])
    erb :'projects/show'
  end

  post '/projects/:id' do
    set_project
    erb :'projects/show'
  end

  get '/projects/volunteers/:id' do
    redirect :"volunteers/#{current_user.id}"
  end

  get '/projects/:id/edit' do
    set_project
    if logged_in?
      if @project.volunteer_id == current_user.id
        erb :'/projects/edit'
      else
        redirect :"/projects/#{@project.id}"
      end
    else
      redirect '/'
    end
  end

  post '/projects/:id/signup' do
    set_project
    # binding.pry
    current_user.projects << @project
    redirect :"/volunteers/#{@current_user.id}"
  end

  patch '/projects/:id' do
    set_project
    if logged_in? && @project.creator == current_user
      if params[:name] != '' && params[:date] != ''
        params.delete(:_method)
        @project.update(params)
        redirect "/projects/#{@project.id}"
      else
        redirect "/projects/#{@project.id}"
      end
    else
      redirect '/'
    end
  end

  delete '/projects/:id' do
    set_project
    if current_user == @project.creator
      @project.destroy
      redirect '/projects'
    else
      redirect to '/projects'
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end
end
