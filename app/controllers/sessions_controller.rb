class SessionsController < ApplicationController
    
    def new 
     @user = User.new  
    end
  
    def create 
      @user = User.find_by_email(params[:email])
  
      if @user && @user.authenticate(params[:password])
        login_user
        redirect_to recipes_path
      else
        flash.now[:error] = ["Username Or Password didn't match"]
        render :new
      end
    end
  
    def destroy 
      session.clear
      redirect_to root_path
    end
end
