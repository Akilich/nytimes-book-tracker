class UsersController < ApplicationController
    
    get "/users/home" do
        @username = User.find(params[:username])
        erb :'/users/home'
    end
    
    get '/users' do
        @users = Users.all
        erb :'/users/index' 
    end
    
    post '/users' do 
      #binding.pry
      @user = User.create(params[:user])
      if !params["book"]["title"].empty?
        @user.books << Book.create(title: params["book"]["title"])
      end
      redirect "users/#{@user.id}"
    end

    
    
    get '/users/:id/edit' do
        @user = User.find(params[:id])
        @books = Book.all
        erb :'/users/edit'
    end
    
    get '/users/:id' do 
        @user = User.find(params[:id])
        @books = Book.all
        erb :'/users/show'
    end
    
    patch '/users/:id' do 
        @user = User.find_by_id(params[:id])
        @username = params[:username]
        @user.books << Book.create(name: params["book"]["title"])
        @user.save
        redirect "users/#{@user.id}"
    end
end