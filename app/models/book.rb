require 'nokogiri'
require 'open-uri'
require 'json'

class Book < ActiveRecord::Base
  belongs_to :users

  def self.import
    data = open("https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=RCGJYGTSwDbhvImLxnJ6VO1HyGNixAjm").read
    @results = JSON.parse(data)
    books = @results['results']['books']
    books.each do |book_hash|
      book = Book.new
      book.title = book_hash['title']
      book.author = book_hash['author']
      book.description = book_hash['description']
      book.rank = book_hash['rank']
      book.save
    end
  end

  def self.list_books
    @books = self.all
    @books.each.with_index do |book, i|
      "#{i+1}. 'Title:'#{book.title}, 
      'Author:'#{book.author} 
      'Description:'#{book.description}
      'Rank:' #{book.rank}"
    end
    #binding.pry
  end
end
