class Recipe < ApplicationRecord
  
  
  belongs_to :category
  belongs_to :user
 
  accepts_nested_attributes_for :category, reject_if: :all_blank
  
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
  
  
  has_many :ingredients, dependent: :destroy 
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  
  has_many :directions, dependent: :destroy  
  accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true
  
  validates :title, :description, presence: true
  

    scope :alphabetize, -> { order(:title, :asc) }

  def self.search(params)
    where("LOWER(title) LIKE :term OR LOWER(description) LIKE :term", term: "%#{params}%")  
  end

  def category_name
    self.category ? self.category.name : "category not available"
  end
end
