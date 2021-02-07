class Category < ApplicationRecord
  
  has_many :recipes
  has_many :users, through: :recipes
  belongs_to :user
    
  accepts_nested_attributes_for :recipes, reject_if: :all_blank  
  
  validates :name, presence: true
    
  
    def self.alphabetize
      order(name: :asc)
    end 
end
