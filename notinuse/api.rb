#require './app/models/book.rb'
#require 'json'
#require 'open-uri'

#class Book::BookApi
#    def get_books
#        data = open("https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=RCGJYGTSwDbhvImLxnJ6VO1HyGNixAjm").read
 #       JSON.parse(data)
 #   end  
#end


#api controller actions
#attr_accessor :title, :description, :author, :rank
   
 #   @@all = [ ]
    
 #   def self.all
 #       if @@all.empty?
 #         create_from_api
 #       else 
 #         @@all
 #       end
 #     end
  
 #   def initialize(title_hash)
 #       title_hash.each do |method,arg|  
 #       if self.respond_to?("#{method}=") 
 #           self.send("#{method}=",arg) 
 #       end 
 #     end  
 #   end
   
  #  def self.create_from_api
  #      results = api.get_books.map do |title_hash|
  #        self.new(title_hash).save
  #      end
  #  end
  
  #  def save
  #      @@all << self
  #      self
  #  end