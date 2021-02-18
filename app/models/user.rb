class User < ApplicationRecord
   
    has_secure_password

    validates :username, presence: true
    validates :email, presence: true, uniqueness: true 
    validates :password, length: {minimum: 6 }
    
    has_many :recipes
    has_many :categories, through: :recipes

    has_many :comments, dependent: :destroy
    has_many :recipes, through: :comments
    
    has_many :categories
    has_many :recipes, through: :categories
  
end
