class Recipe < ApplicationRecord
    validates :title, presence: true
    
    belongs_to :category
    accepts_nested_attributes_for :category, reject_if: :all_blank
     
    has_many :comments, dependent: :destroy 
    has_many :users, through: :comments
     
     def self.alphabetize
      order(title: :asc)
    end
    
    has_many :ingredients, dependent: :destroy 
    accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
    
    has_many :directions, dependent: :destroy  
    accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true
  

   



  def category_name
    self.category ? self.category.name : "category not available"
  end

  validates :title, :description, presence: true

	
end
