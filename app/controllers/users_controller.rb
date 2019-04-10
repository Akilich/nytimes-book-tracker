class UsersController < ApplicationController

    get '/users/home' do
        @user = User.find_by(username: params[:username])
        erb :'/users/home'
      end
    
    get '/user_books' do
      @books = Book.all
      erb :'/users/user_books/index' 
      end

    get '/user_books/new' do
      @book = Book.all
      erb :'/users/user_books/new'
    end

    post '/user_books' do
      if !params["book"]["title"].empty?
        @book = Book.create(params["book"])
        @book.user = @user
        @book.save
      else
        @book = Book.create(params["book"])
      end
      redirect "users/#{@book.title}"
    end

    get 'users/#{@book.title}' do
    @book = Book.find(params[:title])
      erb :'/users/user_books/show'
    end

    get 'users/#{@book.title}/edit' do
      @book = Book.find(params[:title])
      erb :'/users/user_books/edit'
    end

    patch 'users/#{@book.title}' do
      @book = Book.find(params[:title])
      @user = User.find_by_id(params[:id])
      @username = params[:username]
      @book.save
      redirect "/user_books"
  end
    
    
    get '/users/:id/edit' do
        @user = User.find(params[:id])
        @user = User.find_by(username: params[:username])
        erb :'/users/edit'
    end
    
    patch '/users/:id' do 
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