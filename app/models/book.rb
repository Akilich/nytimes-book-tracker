require 'json'

class Book < ActiveRecord::Base
    belongs_to :user
    
    attr_accessor :title, :description, :author, :rank
   
    @@all = [ ]
    
    def self.all
        if @@all.empty?
          create_from_api
        else 
          @@all
        end
      end
  
    def initialize(title_hash)
        title_hash.each do |method,arg|  
        if self.respond_to?("#{method}=") 
            self.send("#{method}=",arg) 
        end   
        end
    end
   
    def self.create_from_api
        api = Book::Api.new
        results = api.get_books.map do |title_hash|
          self.new(title_hash).save
        end
    end
  
    def save
        @@all << self
        self
    end
    
    def list_all_book_titles
        @books = Book.all
        @books.each.with_index do |film, i|
          puts "#{i+1}. #{book.title}"
        end
    end   
    
end