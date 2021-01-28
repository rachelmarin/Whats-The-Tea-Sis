Rails.application.routes.draw do
  
  root(to: "application#home")
  
  devise_for :users
  resources :recipes
  resources :categories
 
end
