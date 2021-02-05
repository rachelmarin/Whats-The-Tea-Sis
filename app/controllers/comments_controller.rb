  class CommentsController < ApplicationController
      before_action :find_comment, only: [:edit, :update, :destroy]
      
      def new 
        @comment = Comment.new
      end
    
      def show
        comment = Comment.find_by(user: current_user, recipe: find_by_recipe_id)
   
      end
    
      def create
          comment = Comment.new(comment_params)
          comment.recipe = find_by_recipe_id(@recipe)
          
          if comment.user_id = current_user.id
            comment.save
            flash[:notice] = "Comment has been added."
            redirect_to recipe_path(comment.recipe)
          else
            flash[:notice] = "You must be logged in to post a comment."
            redirect_to recipe_path
          end
      end
    
      def edit
        
      end