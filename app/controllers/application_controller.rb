require './config/environment'
require './app/models/user'
require 'pry'
#!/usr/bin/ruby
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
		erb :'/signup'
  end
  
  post "/signup" do
    @user = User.new(username: params[:username], email: params[:email], password_digest: params[:password_digest])
    @user.save
    session[:user_id] = @user.id
			redirect "/login"
  end

  get '/sessions/login' do
    erb :'sessions/login'
  end

  post '/sessions' do
    if @user = User.find_by(email: params["email"], password_digest: params["password_digest"])
      session[:user_id] = @user.id
      redirect '/users/home'
    else
      @error="Invalid email or password"
      redirect '/sessions/login'
    end
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
