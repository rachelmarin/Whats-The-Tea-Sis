class Recipe < ApplicationRecord
    validates :title, presence: true
    belongs_to :user
    belongs_to :category
    # has_many :comments
    # has_many :users, through: :comments
    has_many :ingredients 
  
   accepts_nested_attributes_for :ingredients
   accepts_nested_attributes_for :category, reject_if: :all_blank

  def category_name
    self.category ? self.category.name : "category not available"
  end
    
end
