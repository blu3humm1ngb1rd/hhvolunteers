require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'the_secret'
    register Sinatra::Flash
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= Volunteer.find_by(id: session[:volunteer_id])
    end

    def redirect_if_logged_out
      redirect to '/' unless logged_in?
    end
  end

  get '/' do
    erb :welcome
  end
end

### add helper method to check if current user owns that record , if not then redirect home page
