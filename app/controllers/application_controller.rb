class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  helper_method :is_logged_in, :current_user, :login_user
 
  
  def is_logged_in
    !!session[:user_id]
  end

  def current_user
    User.find_by_id(session[:user_id]) if is_logged_in
  end


 
private

def redirect_if_not_logged_in
    redirect_to '/login' if !is_logged_in
end

def redirect_if_logged_in
    redirect_to user_path(current_user) if is_logged_in
end


def find_recipe
    @recipe = Recipe.find_by_id(params[:id])
end

def find_category
  if params[:category_id]
    @category = Category.find_by_id(params[:category_id])
  end
end

def find_comment
  if params[:comment_id]
    @comment = Comment.find_by_id(params[:comment_id])
  end
end

end
