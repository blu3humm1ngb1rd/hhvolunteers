class VolunteersController < ApplicationController
  get '/' do
    erb :"volunteers/index"
  end

  get '/login' do
    erb :login
  end

  get '/signup' do
    erb :signup
  end
end
