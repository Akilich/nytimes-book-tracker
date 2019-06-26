class BooksController < ApplicationController
  
  get '/user_books' do
    if logged_in? && current_user
      @user_books = UserBook.all
      erb :'/users/user_books/index'
    else
      redirect '/login'
    end
  end
  
  get '/user_books/new' do
    if logged_in?
      @book = UserBook.find_by(params[:book_id])
    erb :'/users/user_books/new'
    else redirect '/login'
    end
  end

  post '/user_books' do
    if logged_in? && !params[:rating].empty?
      @user_book = UserBook.create(user_id: session[:user_id], book_id: params[:book_id], rating: params[:rating], book_review: params[:book_review])
      @user_book.save
      redirect '/user_books'
    end
  end

  get '/user_books/:book_id' do 
    @user_book = UserBook.find_by(params[:book_id])
    if logged_in?
      erb :'/users/user_books/show'
    else
      redirect '/login'
    end
  end

  get '/user_books/:book_id/edit' do
    if logged_in?
      @user_book = UserBook.find_by(user_id: params[:user_id], book_id: params[:book_id], rating: params[:rating], book_review: params[:book_review])
     erb :'/users/user_books/edit'
    else 
      redirect '/login'
    end
  end

  patch '/user_books/:book_id' do
    @user_book = UserBook.find_by(params[:id])
    @user_book.update(rating: params[:rating], book_review: params[:book_review])
    @user_book.save
    redirect '/user_books'
  end

  delete '/user_books/:id/delete' do
    if logged_in?
      @user_book = UserBook.find_by(book_id: params[:book_id])
        if @user_book && current_user
          @user_book.destroy
        end
      redirect '/user_books'
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