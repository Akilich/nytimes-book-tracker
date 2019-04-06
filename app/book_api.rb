require './app/models/book.rb'
require 'json'
require 'open-uri'

class Book::BookApi
    def get_books
        data = open("https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=RCGJYGTSwDbhvImLxnJ6VO1HyGNixAjm").read
        JSON.parse(data)
        book_results = data['Book'].map { |rd| Book.new(rd['title'], rd['author'], rd['description'], rd['rank']) }
    end  
end




   
 