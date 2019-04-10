#require_relative ./app/book_api.rb
require 'nokogiri'
require 'open-uri'
require 'json'

class Book < ActiveRecord::Base
  belongs_to :users

  data = open("https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=RCGJYGTSwDbhvImLxnJ6VO1HyGNixAjm").read
  @results = JSON.parse(data)
  
  @@all = [ ]
  attr_accessor :title, :author, :description, :rank  

  def self.all
    if @@all.empty?
      create_from_api
    else 
      @@all
    end
  end
  
  def initialize(book_hash)
    book_hash.each do |method,arg|  
      if self.respond_to?("#{method}=") 
        self.send("#{method}=",arg) 
      end   
    end
  end
   
  def self.create_from_api
    @results.map do |book_hash|
      self.new(book_hash).save
    end
  end
  
  def save
      @@all << self
      self
  end
end  