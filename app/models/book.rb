require 'nokogiri'
require 'open-uri'
require 'json'

class Book < ActiveRecord::Base
  belongs_to :users

  def self.import
    data = open("https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=RCGJYGTSwDbhvImLxnJ6VO1HyGNixAjm").read
    @results = JSON.parse(data)
    binding.pry
  end
end