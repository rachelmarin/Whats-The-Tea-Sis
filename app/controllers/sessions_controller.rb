class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, except: [:destroy]
  def new 
     @user = User.new  
    end
  
    def create 
      @user = User.find_by_email(params[:email])
  
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
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



    def google #if they are logging in with oauth
      user = User.find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |u|
          u.email = auth["info"]["email"]
          u.password = SecureRandom.hex(15)
          u.first_name = auth["info"]["first_name"]
          u.last_name = auth["info"]["last_name"]
          u.username = auth["info"]["email"]
          end
          if @user && @user.id
                    session[:user_id] = @user.id
                    redirect_to recipes_path 
                else 
                    redirect_to "/login"
                end 
            end 



  # #     if user.valid? #if the user exsists then I want to save them into my session
  # #         session[:user_id] = user.id  
  # #         redirect_to user_path(user)
  # #     else
  # #         redirect_to login_path
  # #     end
  # # end




  #   def google
  #     @user = User.find_or_create_by(username: auth["info"]["name"]) do |user| 
         
  #       user.password =  SecureRandom.hex(10)
  #     end 
  #     if @user && @user.id
  #         session[:user_id] = @user.id
  #         redirect_to recipes_path 
  #     else 
  #         redirect_to "/login"
  #     end 
  # end 

  
  private 

  def auth
      request.env['omniauth.auth']
  end 




end
