class ProjectsController < ApplicationController
  get '/projects' do
    redirect_if_logged_out
    @projects = Project.all
    erb :'projects/index'
  end

  get '/projects/new' do
    @project = Project.new
    erb :'/projects/new'
  end

  post '/projects' do
    redirect_if_logged_out
    @project = current_user.created_projects.new(params)
    if @project.save
      flash[:message] = 'Project successfully created'
      redirect :"/projects/#{@project.id}"
    else
      flash.now[:error] = "Error: #{@project.errors.full_messages.to_sentence}"
      erb :'/projects/new'
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

  get '/projects/volunteers/:id' do
    redirect :"volunteers/#{current_user.id}"
  end

  get '/projects/:id/edit' do
    set_project
    redirect_if_logged_out
    if @project.volunteer_id == current_user.id
      erb :'/projects/edit'
    else
      flash[:error] = 'You can only edit projects you created.'
      redirect :"/projects/#{@project.id}"
    end
  end

  post '/projects/:id/signup' do
    set_project
    current_user.projects << @project
    redirect :"/volunteers/#{@current_user.id}"
  end

  patch '/projects/:id' do
    set_project
    if @project.creator == current_user
      #---AR: if empty string it will be ignored
      params.delete(:_method)
      @project.update(params)
      flash[:message] = 'Project has been updated.'
      redirect "/projects/#{@project.id}"

    else
      redirect '/'
    end
  end

  delete '/projects/:id' do
    set_project
    if current_user == @project.creator
      @project.destroy
      flash[:message] = 'Project has been deleted.'
      redirect '/projects'
    else
      redirect to '/projects'
    end
  end

  private

  def set_project
    @project = Project.find_by(id: params[:id])
    # find_by :id method
    # find_by : unless you have error handling, find will raise an error if it doesn't find anything ; find_by will return nil if no error
    # GOAL: error handling
  end
end
