#require_relative './models/book.rb'

class BooksController < ApplicationController
    get '/books' do 
        @books = Book.all
        erb :index
      end   
end