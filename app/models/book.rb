class Book < ActiveRecord::Base
  belongs_to :users

  def create_book_from_api
    api = BookApi.new
    @book_information = api.get_books.map do |title,author,description,rank|
      self.new('title','author','description','rank').save
    end
  end
end