# Add seed data here. Seed your database with `rake db:seed`
require 'json'

      data = open("https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=RCGJYGTSwDbhvImLxnJ6VO1HyGNixAjm").read
      request.basic_auth("api.nytimes.com", "RCGJYGTSwDbhvImLxnJ6VO1HyGNixAjm")
      JSON.parse(data)