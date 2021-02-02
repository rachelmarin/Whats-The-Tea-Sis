Rails.application.routes.draw do
  
  root(to: "static#home")
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :recipes
  resources :comments
  resources :categories do
    resources :recipes, only: [:new, :create, :index]
  end

  # match '/auth/:google_oath2/callback' => 'static#google', via:[:get, :post]
  match '/auth/:facebook/callback' => 'static#facebook', via:[:get, :post]
end
