class User < ApplicationRecord
  has_many :recipes
  has_many :comments
  # has_many :recipes, through: :comments


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
