require_relative ./app/book_api.rb

class Book < ActiveRecord::Base
  belongs_to :user

  @@all = [ ]
  attr_accessor :title, :author, :description, :rank  
    
  def self.all
    if @@all.empty?
      create_from_api
    else 
      @@all
    end
  end
    
    #Iterating through each result/book of the NYT
    def initialize(book_info_hash)
      book_info_hash.each do |method,arg|  
        if self.respond_to?("#{method}=") 
          self.send("#{method}=",arg) 
        end   
      end
    end
    
    #Creating a new book in my database and assigning it's properties
  def self.create_from_api
    api = BookApi.new
    results = api.get_books.map do |book_info_hash|
      self.new(book_info_hash).save
    end
  end
    
    #finding existing books
  def find_book
    existing_book = Book.find_by(title: book["title"])
    if !params book["title"].empty?
    self.create_from_api
    end
  end

  def save
    @@all << self
    self
  end  
end