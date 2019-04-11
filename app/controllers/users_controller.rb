
class UsersController < ApplicationController

    get '/users/home' do
        @user = User.find_by(username: params[:username])
        @book = Book.all
        erb :'/users/home'
      end
    
   # get '/user_books' do
   #   @book = Book.all
    #  erb :'/users/user_books/index' 
    #  end

    get '/user_books/new' do
      erb :'/users/user_books/new'
    end

    post '/user_books' do
    @book = Book.all
      redirect "/users/user_books/:id"
    end

    get '/users/user_books/:id' do
      @book = Book.create(params["book"])
      @book.save
      erb :'/users/user_books/show'
    end

    get '/users/user_books/:id/edit' do
      @book = Book.find(params[:title])
      erb :'/users/user_books/edit'
    end

    patch '/users/user_books/:id' do
      @book = Book.find_by_id(params[:id])
      @user = User.find_by_id(params[:id])
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
        @user = User.find_by(username: params[:username])
        @username = (params[:username])
        @user.save
        redirect "users/home"
    end
end