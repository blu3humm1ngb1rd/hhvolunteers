class VolunteersController < ApplicationController
  get '/' do
    erb :"volunteers/index"
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    @user = Volunteer.find_by(email: params[:email])
    @user.authenticate(params[:password])
  end

  get '/signup' do
    erb :signup
  end
end
