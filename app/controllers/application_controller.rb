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
end
