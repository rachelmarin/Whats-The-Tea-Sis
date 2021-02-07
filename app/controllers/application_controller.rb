class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :user_signed_in?, :current_user

  def user_signed_in?
    !!session[:user_id]
  end

  def current_user
    User.find_by_id(session[:user_id]) if user_signed_in?
  end

  def login_user
    session[:user_id] = @user.id
  end
  
  def authorized_to_edit?
    @recipe.user == current_user
  end

private

def redirect_if_not_logged_in
    redirect_to '/login' if !logged_in?
end

def redirect_if_logged_in
    redirect_to user_path(current_user) if logged_in?
end

def find_category
    @category = Category.find(params[:id])
end

def find_recipe
    @recipe = recipe.find(params[:id])
end

end
