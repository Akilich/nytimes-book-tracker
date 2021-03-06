class UsersController < ApplicationController

  get '/users/home' do
    if session[:user_id]
      @ny_times_list = Book.all
      erb :'/users/home'
    else
      erb :'/failure'
    end
  end

  get '/users/edit' do
    if @current_user ||= User.find_by(id: session[:user_id])
      erb :'/users/edit'
    else
      erb :'/failure'
    end
  end

  patch '/users/home' do 
    @user = current_user
    @user.update(username: params[:username], email: params[:email], password: params[:password])
    @user.save
    if @user
      flash.message = "Account updated!"
      redirect "users/home"
    else
      flash.message = "Failed to update. Please try again"
      redirect "users/edit"
    end
  end

  helpers do
    def flash
      @flash ||= FlashMessage.new(session)
    end
  
    def logged_in?
      !!session[:user_id]
    end
  
    def current_user
      User.find(session[:user_id])
    end
  end
end