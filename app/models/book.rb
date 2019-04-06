class Book < ActiveRecord::Base
    belongs_to :user

    attr_accessor :title, :author, :description, :rank  
    
    def initialize(title, author, description, rank)
      @title = title
      @author = author
      @description = description
      @rank = rank
  end
end