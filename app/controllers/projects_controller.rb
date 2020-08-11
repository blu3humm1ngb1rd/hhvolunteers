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
      # binding.pry
      project = Project.new(volunteer_id: current_user, name: params[:name], completed: params[:completed], assigned: params[:assigned], role: params[:role], number_of_hours: params[:number_of_hours], date: params[:date], time: params[:time])

      project.volunteer_id = current_user.id
      project.save
      # binding.pry
      # @projects = Project.all
      # @volunteers = current_user
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
      if @projects.volunteer_id == current_user.id
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
    if logged_in?
      if params[:name] != '' && params[:date] != ''
        params.delete(:_method)
        @projects.update(params)
        redirect "/projects/#{@projects.id}"
      else
        redirect "/projects/#{@projects.id}"
      end
    else
      redirect '/'
    end
  end

  delete '/projects/:id' do
    set_project
    # if authorized user
    @projects.destroy
    redirect '/projects'
    # else
    # redirect to '/projects'
  end

  private

  def set_project
    @projects = Project.find(params[:id])
  end
end
