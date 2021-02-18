Rails.application.routes.draw do
  
  root(to: "static#home")
  
 
  match '/auth/:google_oauth2/callback' => 'sessions#google', via: [:get,:post]
 

  get "/signup", to: "users#new", as: "signup"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy", as: "destroy_user_session"

  resources :comments

  
  resources :recipes
  resources :categories
  resources :users, except: [:update, :destroy]
  
  resources :recipes do
  resources :comments
  end 

  resources :categories do
    resources :recipes
  end

  

end

