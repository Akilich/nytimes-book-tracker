require 'nokogiri'
require 'open-uri'
require 'json'

class BookApi < ActiveRecord::Base

    nyt_url = "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key="
    nyt_api_key = RCGJYGTSwDbhvImLxnJ6VO1HyGNixAjm
    
    def get_books
        #data = open("https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=RCGJYGTSwDbhvImLxnJ6VO1HyGNixAjm").read
        #JSON.parse(data)
        data = JSON.parse(RestClient.get("#{nyt_url}#{ENV["nyt_api_key"]}"))
    end 
end




   
 