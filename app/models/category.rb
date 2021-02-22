class Category < ApplicationRecord
  
  has_many :recipes, dependent: :destroy  
  has_many :users, through: :recipes
  belongs_to :user
  # validates :name, presence: true
  accepts_nested_attributes_for :recipes, reject_if: :all_blank  
  

    def self.alphabetize
      order(name: :asc)
    end 
end
