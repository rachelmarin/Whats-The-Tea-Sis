Rails.application.routes.draw do
  
  root(to: "static#home")
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :recipes
  resources :categories do
    resources :recipes, only: [:new, :create, :index]
  end
end
