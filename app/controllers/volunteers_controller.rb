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

  post '/volunteers' do
    # binding.pry
    if params[:firstname] != '' && params[:email] != '' && params[:password] != ''
      @volunteer = Volunteer.create(params)
      session[:volunteer_id] = @volunteer.id
      redirect "volunteers/#{@volunteer.id}"
    else
      'We need at least your first name, email, and a password for registration.'
      redirect '/signup'
    end
  end

  get '/volunteers/:id' do
    @volunteer = Volunteer.find_by(id: params[:id])

    erb :'volunteers/show'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    erb :'volunteers/show'
  end
end

# (:firstname params[:firstname], :lastname params[:lastname], :pronouns params[:pronouns],:email params[:email], :training params[:training], :qtlgbt params[:qtlgbt],:password params[:password], :bipoc params[:bipoc])
