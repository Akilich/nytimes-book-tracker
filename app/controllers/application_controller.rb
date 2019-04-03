require './config/environment'
require './app/models/user'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
  end

  get "/" do
    erb :home
  end

  get "/signup" do
		erb :'/registrations/signup'
  end
  
  post "/signup" do
		@user = User.new(username: params["username"], email: params["email"], password: params["password"])
    @user.save
    session[:user_id] = @user.id
			redirect "/users/home"
  end

  get "/login" do
		erb :'/login'
	end

	post "/login" do
    if @user = User.find_by(email: params["email"], password: params["password"])
      session[:user_id] = @user.id
			redirect '/users/home'
		else
        @error = "Invalid email or password"
        redirect '/login'
		end
	end

  get "/users/home" do
      @username = params[:username]
			erb :'/users/home'
  end
  
  get '/logout' do
    session.clear
    redirect '/'
    erb :home
  end

  helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end
end