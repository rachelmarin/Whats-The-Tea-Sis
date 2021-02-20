class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in, only: [:show]
    
  def index
    @users = User.all.alphabetize 
  end 
  def new
        @user = User.new
      end
    
    def show
      @user = User.find(params[:id])
    end 

    def create
        @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
            redirect_to user_path(@user)
            is_logged_in
          
      else
          flash.now[:error] = @user.errors.full_messages
          render :new
        end
    end


  def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to login_path
  end

      private
    
        def user_params
          params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
        end
    
end
