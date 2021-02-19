 class CommentsController < ApplicationController
  before_action :redirect_if_not_logged_in
   
  def index
    if params[:recipe_id]
      @recipe = Recipe.find_by(id: params[:recipe_id])
      if @recipe.nil?
        redirect_to recipes_path, alert: "recipe not found"
      else
        @comments = @recipe.comments
      end
    else
      @comments = Comment.all
    end
  end

  def show
    if params[:recipe_id]
      @recipe = Recipe.find_by(id: params[:recipe_id])
      @comment = @recipe.comments.find_by(id: params[:id])
      if @comment.nil?
        redirect_to recipe_comments_path(@recipe), alert: "comment not found"
      end
    else
      @comment = Comment.find_by_id(params[:id])
    end
  end

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
      params.require(:comment).permit(
        :content, 
        :recipe_id, 
        :user_id, 
        user_attributes: [:username])
  end

  end