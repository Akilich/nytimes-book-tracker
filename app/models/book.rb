require_relative ./app/book_api.rb

class Book < ActiveRecord::Base
    belongs_to :user

    @@all = [ ]
    attr_accessor :title, :author, :description, :rank  
    
    def self.all
      if @@all.empty?
        create_new_book
      else 
        @@all
      end
    end
    
    #Iterating through each result/book of the NYT
    def initialize(data)
      data["results"].each do |book, index|
    end
    
    #Creating a new book in my database and assigning it's properties
    def self.create_new_book
      books = BookApi.new do |key|
      key.title = book["title"]
      key.author = book["author"]
      key.description = book["description"]
      key.rank = book["rank"]
      self.new_book.save
    end
    
    #finding existing books
    def find_book
      existing_book = Book.find_by(title: book["title"])
      if !params book["title"].empty?
      self.create_new_book
      end
    end
    
    def save
        @@all << self
        self
    end  
end