class UserBooks < ActiveRecord::Base
    belongs_to :user
    belongs_to :book
    
    def self.user_list
        @book = Book.new
        @book.each.with_index do |book, i|
          puts "#{i+1}. " "#{book.title}" 
          puts "Author: " "#{book.author}"
          puts "Description: " "#{book.description}"
          puts "Rank: " "#{book.rank}"
        end
      end
end