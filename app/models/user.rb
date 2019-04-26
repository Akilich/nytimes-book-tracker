class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
    has_secure_password
    validates :username, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 8 }
    has_many :user_books
    has_many :books, through: :user_books
end 