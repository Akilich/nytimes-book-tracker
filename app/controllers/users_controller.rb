class UsersController < ApplicationController

    get '/users/home' do
      @ny_times_list = Book.all
      erb :'/users/home'
    end

    get '/user_books/new' do
      erb :'/users/user_books/new'
    end

    post '/user_books' do
      @book = Book.find_by(params[:title])
      @book.update(title: params[:title])
    if params[:title].empty?
      @userbook = Book.create(params[:id],params[:title],params[:author],params[:description],params[:rank],params[:read])
    end
      @book.save
      redirect "/users/user_books/:id"
    end

    get '/users/user_books/:id' do
      @books = UserBooks.user_list
      erb :'/users/user_books/show'
    end

    get '/users/user_books/:id/edit' do
      @book = Book.find(params["title"])
      erb :'/users/user_books/edit'
    end

    patch '/users/user_books/:id' do
      @book = Book.find_by_id(params[:title])
      @user = User.find_by_id(params[:username])
      @username = params[:username]
      @book.save
      redirect "/user_books"
    end

    delete '/users/user_books/:id/delete' do
      if logged_in?
        @book = Book.find_by_id(params[:id])
          if @book && current_user
              @book.destroy
          end
        redirect to '/users/home'
        end
    end
    
    get '/users/:id' do 
      @user = User.find_by_id(params[:username])
      @username = params[:username]
      erb :'users/#{@user.id}'
    end

    get '/users/:id/edit' do
      @user = User.find_by(username: params[:username])
      erb :'/users/edit'
    end

    patch '/users/:id' do 
      User.update(username: params[:username])
      @user = User.find_by(username: params[:username])
        redirect "users/home"
    end
end