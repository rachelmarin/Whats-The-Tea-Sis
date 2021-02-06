class Comment < ApplicationRecord
   belongs_to :recipe
   belongs_to :user
   
   def user_attributes=(user_attributes)
      if user_attributes[:username].present?
          #self.build_user(user_attributes) # doesn't check if username already exists
          self.user = User.find_or_create_by(username: user_attributes[:username])
      end
  end
end
