class Category < ApplicationRecord
    has_many :recipes

    validates :name, presence: true
  
    accepts_nested_attributes_for :recipes, reject_if: :all_blank  
end
