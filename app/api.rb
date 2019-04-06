require './app/models/book.rb'
require 'json'
require 'open-uri'

class Book::BookApi
    def get_books
        data = open("https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=RCGJYGTSwDbhvImLxnJ6VO1HyGNixAjm").read
        JSON.parse(data)
    end

    def list_books
        @books = Book.all
        @books.each.with_index do |book, i|
          puts "#{i+1}. #{book.title}"
        end
      end
end