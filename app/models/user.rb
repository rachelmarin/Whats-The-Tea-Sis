class User < ApplicationRecord
   
    has_secure_password
    
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true 
    validates :password, length: {minimum: 6 }
    has_many :recipes
    has_many :comments
    has_many :recipes, through: :comments
  
  
end
