class VolunteersController < ApplicationController
  get '/' do
    erb :"volunteers/index"
  end

  get '/login' do
    @volunteer = Volunteer.new
    erb :login
  end

  post '/login' do
    @volunteer = Volunteer.find_by(email: params[:email])
    if @volunteer
      if @volunteer.authenticate(params[:password])
        session[:volunteer_id] = @volunteer.id
        redirect "volunteers/#{@volunteer.id}"
      end
    end
    @volunteer ||= Volunteer.new(params)
    @volunteer.errors.add(:email, 'address and password do not match')
    erb :'/login'
  end

  post '/volunteers' do
    # binding.pry
    @volunteer = Volunteer.new(volunteer_params)
    if @volunteer.save
      session[:volunteer_id] = @volunteer.id
      redirect "volunteers/#{@volunteer.id}"
    else
      erb :'/signup'
    end
  end

  get '/volunteers/:id' do
    redirect_if_logged_out
    @volunteer = Volunteer.find_by(id: params[:id])
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

# (firstname: params[:firstname], :lastname params[:lastname], :pronouns params[:pronouns],:email params[:email], :training params[:training], :qtlgbt params[:qtlgbt],:password params[:password], :bipoc params[:bipoc])
# move colon to end of word
