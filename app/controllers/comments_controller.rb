 class CommentsController < ApplicationController
   
    def new
      @comment = Comment.new(params[:comment])
    end
   
    def create
      comment = Comment.new(comment_params)
      if comment.valid?
          comment.save
      end
      redirect_to comment.recipe 
  end
  

  def destroy
    if current_user
      @recipe = Recipe.find(params[:recipe_id])
      @comment = @recipe.comments.find(params[:id])
      @comment.destroy
      redirect_to recipe_path(@recipe)
    else
      redirect_to recipe_path(@recipe)
    end
  end
  private
  
  def comment_params
      params.require(:comment).permit(:content, :recipe_id, :user_id, user_attributes: [:username])
  end

  end