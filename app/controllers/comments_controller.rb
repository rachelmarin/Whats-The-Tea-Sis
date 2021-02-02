  class CommentsController < ApplicationController

    def create
      comment = Comment.create(comment_params)
      redirect_to comment.recipe
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:content, :recipe_id, :user_id, user_attributes:[:username])
    end
  end