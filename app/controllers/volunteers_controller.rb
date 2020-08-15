class VolunteersController < ApplicationController
  get '/' do
    if logged_in?
      redirect "/volunteers/#{current_user.id}"
    else
      erb :"volunteers/index"
    end
  end

  get '/login' do
    @volunteer = Volunteer.new
    erb :login
  end

  post '/login' do
    @volunteer = Volunteer.find_by(email: params[:email].downcase)
    if @volunteer&.authenticate(params[:password])
      session[:volunteer_id] = @volunteer.id

      redirect "volunteers/#{@volunteer.id}"

    end
    @volunteer ||= Volunteer.new(params)
    @volunteer.errors.add(:email, 'address and password do not match')
    erb :'/login'
  end

  post '/volunteers' do
    if Volunteer.find_by(email: params[:email].downcase)
      # binding.pry
      flash[:message] = 'You already have an account. Please login.'
      redirect '/login'
    end
    if params[:firstname] != '' && params[:email] != '' && params[:lastname] != '' && params[:password] != ''
      @volunteer = Volunteer.create(firstname: params[:firstname], lastname: params[:lastname], pronouns: params[:pronouns], email: params[:email].downcase, training: params[:training], qtlgbt: params[:qtlgbt], password: params[:password], bipoc: params[:bipoc])
      session[:volunteer_id] = @volunteer.id
      redirect "/volunteers/#{@volunteer.id}"
    else
      flash[:message] = 'You must provide your first and last name, email and create a password to register.'
      redirect '/signup'
    end
  end

  get '/volunteers/:id' do
    # redirect_if_logged_out
    @volunteer = Volunteer.find_by(id: params[:id])
    @my_projects = @volunteer.created_projects
    @other_projects = @volunteer.projects
    # binding.pry
    erb :'volunteers/show'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    erb :'volunteers/show'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  private

  def volunteer_params
    params.select { |k, _v| %i[firstname lastname pronouns email training qtlgbt password bipoc].include?(k) }
  end
end
