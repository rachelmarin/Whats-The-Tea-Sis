  class CommentsController < ApplicationController
      before_action :find_comment, only: [:edit, :update, :destroy]
      before_action :comment_auth, only: [:edit, :update, :destroy]
   
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
    
      def update
        if @comment.user_id = current_user.id
          @comment.update(comment_params)      
          redirect_to recipe_path(@comment.recipe)
          flash.now[:notice] = "Your comment has been updated."
        else
          redirect_to recipe_path
          flash.now[:notice] = "You cannot update this comment."
        end
        
      end
    
      def destroy
        if @comment.user_id == current_user.id 
        @comment.destroy
        flash[:notice] = "The comment was deleted."
        redirect_to recipe_path
        else
        flash[:notice] = "You must be comment owner to delete comment."
        redirect_to recipe_path
        end
      end
    
    
      private
    
      def comment_auth
        @comment = find_comment
        if @comment.user_id != current_user.id
          flash[:notice] = "You must be comment owner to update comment."
          redirect_to recipe_path(@comment.recipe)
        end
      end
    
      def comment_params
        params.require(:comment).permit(:content)
      end
    
      def find_comment
        @comment = Comment.find_by_id(params[:id])
      end
    end