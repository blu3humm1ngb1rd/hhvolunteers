class VolunteersController < ApplicationController
  get '/' do
    erb :"volunteers/index"
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    @user = Volunteer.find_by(email: params[:email])

    if @user.authenticate(params[:password])

    else
      'Please check your email and password and try again'
      redirect '/login'
    end
  end

  get '/signup' do
    erb :signup
  end
end
