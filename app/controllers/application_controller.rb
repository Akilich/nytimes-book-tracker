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

  get '/' do
    erb :home
  end

  get '/signup' do
		erb :'/signup'
  end
  
  post '/signup' do
    @user = User.new(username: params[:username], email: params[:email], password_digest: params[:password_digest])
    @user.save
    session[:user_id] = @user.id
		redirect '/login'
  end

  get '/login' do
		erb :'/login'
	end

  post '/login' do
    @user = User.find_by(username: params[:username], password_digest: params[:password_digest])
    if @user
      @user.save
      session[:user_id] = @user.id
    end
		redirect '/users/home'
  end
  
  get '/users/home' do
    #if @user = Helpers.current_user(session)
    erb :'/users/home'
    #end
  end
  
  get '/logout' do
    session.clear
    redirect '/'
    erb :home
  end
end