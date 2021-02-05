class Comment < ApplicationRecord
   belongs_to :recipe
   belongs_to :user
  
   accepts_nested_attributes_for :user

   def user_attributes=(user_attributes)
     self.user = User.find_or_create_by(username: user_attributes[:username]) unless user_attributes[:username].blank?
   end
 
end
