class BooksController < ApplicationController
  
  get '/users/user_books' do
    if logged_in? && current_user
      @user_books = UserBook.all
      erb :'/users/user_books/index'
    else
      redirect '/login'
    end
  end
  
  get '/users/user_books/new' do
    if logged_in?
      @book = UserBook.find_by(params[:book_id])
    erb :'/users/user_books/new'
    else redirect '/login'
    end
  end

  post '/users/user_books' do
    if logged_in? && !params[:rating].empty?
      @user_books = UserBook.create(user_id: session[:user_id], book_id: params[:book_id], rating: params[:rating], book_review: params[:book_review])
      @user_books.save
      redirect '/users/user_books'
    end
  end

  get 'users/user_books/:book_id' do 
    @user_books = UserBook.find_by(params[:book_id])
    @user_book = UserBook.all
    if logged_in?
      erb :'/users/user_books/show'
    else
      redirect '/login'
    end
  end

  get '/users/user_books/:book_id/edit' do
    if logged_in?
      @user_book = UserBook.find_by(user_id: params[:user_id], book_id: params[:book_id], rating: params[:rating], book_review: params[:book_review])
     erb :'/users/user_books/edit'
    else 
      redirect '/login'
    end
  end

  patch '/users/user_books/:book_id' do
    @user_books = UserBook.find_by(params[:id])
    @user_books.update(rating: params[:rating], book_review: params[:book_review])
    @user_books.save
    redirect '/users/user_books'
  end

  delete '/users/user_books/:id/delete' do
    if logged_in?
      @user_books = UserBook.find_by(book_id: params[:book_id])
        if @user_books && current_user
          @user_books.destroy
        end
      redirect '/users/user_books'
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