class Recipe < ApplicationRecord
    belongs_to :user
    validates :title, presence: true
    belongs_to :category
    has_many :comments
    has_many :users, through: :comments
    has_many :equipments
    has_many :ingredients 
  
  # accepts_nested_attributes_for :ingredient
  # accepts_nested_attributes_for :equipment
  # accepts_nested_attributes_for :category, reject_if: :all_blank

  def category_name
    self.category ? self.category.name : "category not available"
  end
    
end
