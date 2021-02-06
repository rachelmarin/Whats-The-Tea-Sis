  class CommentsController < ApplicationController
    def index
    end
  
    def show
      @recipe = Recipe.find(params[:recipe_id])
      @comment = Comment.find(params[:id])
    end
  
    # /recipes/:recipe_id/comments/new 
    def new
      @recipe = Recipe.find(params[:recipe_id])
      @comment = @recipe.comments.build
      # comment.new(recipe_id:@recipe.id)
    end
  
    def create
      @comment = Comment.new(comment_params)
      if @comment.save
        # /recipes/:recipe_id/comments/:id
        redirect_to recipe_path(params[:recipe_id], @comment)
      else 
        render :new 
      end 
    end
  
    def edit
      @comment = Comment.find(params[:id])
      @recipe = Recipe.find(params[:recipe_id])
    end
  
    def update
      @comment = Comment.find(params[:id])
      @comment.update(comment_params)
      redirect_to recipe_path(@comment.recipe_id)
    end
  
    def destory
      @comment.destroy
      flash[:notice] = "#{@comment.content} was deleted"
      redirect_to recipes_path  
    end 
  
    private 
     def comment_params
      params.require(:comment).permit(:content,:user_id,:recipe_id)
     end 
  end