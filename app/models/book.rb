require 'nokogiri'
require 'open-uri'
require 'json'

class Book < ActiveRecord::Base
  belongs_to :user, optional: true
  has_many :user_books
  has_many :users, through: :user_books

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
      book.genre = @results['results']['list_name']
      book.save
    end
  end
end
