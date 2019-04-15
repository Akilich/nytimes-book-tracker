class User < ActiveRecord::Base
    has_secure_password
    has_many :books
    validates :email, presence: true
    validates :password_digest, presence: true  
end 