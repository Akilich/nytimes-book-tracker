#require 'nokogiri'
#require 'open-uri'
#require 'json'
#require 'rest-client'

#class BookApi
#    def get_books
#        #data = open("https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=RCGJYGTSwDbhvImLxnJ6VO1HyGNixAjm").read
#        #JSON.parse(data)
#        nyt_url = "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=RCGJYGTSwDbhvImLxnJ6VO1HyGNixAjm"
#        data = JSON.parse(RestClient.get("#{nyt_url}#{ENV["RCGJYGTSwDbhvImLxnJ6VO1HyGNixAjm"]}"))
#    end 
#end



   
 