class UsersController < ApplicationController

    get '/users/home' do
        @user = User.find_by(username: params[:username])
        erb :'/users/home'
      end
    
    get '/user_books' do
        erb :'/users/user_books/index' 
    end
    
    get '/user_books/new' do
      erb :'/users/user_books/new'
    end

    get '/user_books/edit' do
      erb :'/users/user_books/edit'
    end

    post '/user_books' do
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