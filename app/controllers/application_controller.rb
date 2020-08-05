require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'the_secret'
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= Volunteer.find_by(id: session[:volunteer_id])
    end
  end

  get '/' do
    erb :welcome
  end
end
