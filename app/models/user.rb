class User < ApplicationRecord
   
    validates :email, presence: true, uniqueness: true 
    has_secure_password
    has_many :recipes
    has_many :comments
    has_many :recipes, through: :comments
  
  
end
