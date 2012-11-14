Portfolio::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  match "signup" => "users#new"
  match "signin" =>  "sessions#new"
  match "signout" => "sessions#destroy", :via => :delete
  
#  root :to => "static_pages#home"
# paginas estaticas
#  get "statics_pages/home"
  match "root" => "static_pages#home"
#  get "statics_pages/help"
  match "help" => "static_pages#help"
#  get "statics_pages/about"
  match "about" => "static_pages#about"
#  get "statics_pages/contact"
  match "contact" => "static_pages#contact"
  match "news" => "static_pages#news"
 
 end
