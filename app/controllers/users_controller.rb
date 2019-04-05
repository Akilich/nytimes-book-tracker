class UsersController < ApplicationController

    get '/users/home' do
        @user = User.find_by(username: params[:username])
        erb :'/users/home'
      end
    
    get '/user_books' do
        @users = Users.all
        erb :'/users/index' 
    end
    
    post '/user_books' do 
      #binding.pry
      @user = User.create(params[:user])
      if !params["book"]["title"].empty?
        @user.books << Book.create(title: params["book"]["title"])
      end
      redirect "users/#{@user.id}"
    end
    
    get '/users/:id/edit' do
        @user = User.find(params[:id])
        erb :'/users/edit'
    end
    
    get '/users/:id' do 
        @user = User.find(params[:id])
        erb :'/users/show'
    end
    
    patch '/users/:id' do 
        @user = User.find_by_id(params[:id])
        @username = params[:username]
        @user.save
        redirect "users/#{@user.id}"
    end
end