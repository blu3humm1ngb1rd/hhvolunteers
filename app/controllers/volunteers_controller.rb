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
      flash[:message] = 'Login Successful'
      redirect "volunteers/#{@volunteer.id}"

    end
    @volunteer ||= Volunteer.new(params)
    @volunteer.errors.add(:email, 'address and password do not match')
    erb :'/login'
  end

  post '/volunteers' do
    if Volunteer.find_by(email: params[:email].downcase)
      flash[:error] = 'You already have an account. Please login.'
      redirect '/login'
    end

    @volunteer = Volunteer.new(firstname: params[:firstname], lastname: params[:lastname], pronouns: params[:pronouns], email: params[:email].downcase, training: params[:training], qtlgbt: params[:qtlgbt], password: params[:password], bipoc: params[:bipoc])
    if @volunteer.save
      session[:volunteer_id] = @volunteer.id
      flash[:message] = 'Signup Successful'
      redirect "/volunteers/#{@volunteer.id}"
    else
      flash[:error] = "Error: #{@volunteer.errors.full_messages.to_sentence}"
      redirect '/signup'
    end
  end

  get '/volunteers/:id' do
    @volunteer = Volunteer.find_by(id: params[:id])
    @my_projects = @volunteer.created_projects
    @other_projects = @volunteer.projects
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
end
