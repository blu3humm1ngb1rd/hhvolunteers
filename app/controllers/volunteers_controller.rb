class VolunteersController < ApplicationController
  get '/' do
    erb :"volunteers/index"
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    @volunteer = Volunteer.find_by(email: params[:email])
    # binding.pry
    if @volunteer.authenticate(params[:password])
      session[:volunteer_id] = @volunteer.id
      redirect "volunteers/#{@volunteer.id}"
    else
      'Please check your email and password and try again'
      redirect '/login'
    end
  end

  get '/volunteers/:id' do
    "volunteeer's specific homepage"
  end

  get '/signup' do
    erb :signup
  end
end
