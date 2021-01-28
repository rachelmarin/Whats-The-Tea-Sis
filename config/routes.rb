Rails.application.routes.draw do
  
  root(to: "static#home")
  
  devise_for :users
  resources :recipes
  resources :categories
 
end
