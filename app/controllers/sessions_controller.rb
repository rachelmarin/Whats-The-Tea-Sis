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

    def google
      @user = User.find_or_create_by(username: auth["info"]["name"]) do |user| 
          user.password =  SecureRandom.hex(10)
      end 
      if @user && @user.id
          session[:user_id] = @user.id
          redirect_to movies_path 
      else 
          redirect_to "/login"
      end 
  end 

  
  private 

  def auth
      request.env['omniauth.auth']
  end 



end
