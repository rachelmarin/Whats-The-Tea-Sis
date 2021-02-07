class UsersController < ApplicationController
  #  before_action :set_user, only: [:show, :edit, :update, :destroy]

    def new
        @user = User.new
      end
    
    def show
      @user = User.find(params[:id])
    end 

    def create
        @user = User.new(user_params)
      if @user.save
          login_user
          redirect_to recipes_path
      else
          flash.now[:error] = @user.errors.full_messages
          render :new
        end
    end
    
      private
    
        def user_params
          params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
        end
    
end
