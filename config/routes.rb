Rails.application.routes.draw do
  
  
  root(to: "static#home")
 
  resources :comments

  
  resources :recipes
  
  resources :recipes do
  resources :comments
  end 

  resources :categories do
    resources :recipes
  end
    
   
    get "/signup", to: "users#new", as: "signup"
    post "/signup", to: "users#create"
    get "/login", to: "sessions#new", as: "login"
    post "/login", to: "sessions#create"
  
    delete "/logout", to: "sessions#destroy", as: "destroy_user_session"
  
  

  # match '/auth/:google_oath2/callback' => 'static#google', via:[:get, :post]
  match '/auth/:facebook/callback' => 'static#facebook', via:[:get, :post]
end

