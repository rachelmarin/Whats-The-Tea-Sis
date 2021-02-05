Rails.application.routes.draw do
  
  root(to: "static#home")
  
  
  resources :recipes 
   resources :comments

  resources :categories do
    resources :recipes
  end

  # match '/auth/:google_oath2/callback' => 'static#google', via:[:get, :post]
  match '/auth/:facebook/callback' => 'static#facebook', via:[:get, :post]
end

