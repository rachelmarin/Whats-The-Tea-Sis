class UsersController < ApplicationController
  
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
          login_user
          redirect_to recipes_path
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
