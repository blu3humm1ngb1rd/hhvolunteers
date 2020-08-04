class VolunteersController < ApplicationController
  get '/' do
    erb :"volunteers/index"
  end
end
