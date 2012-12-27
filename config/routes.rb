Portfolio::Application.routes.draw do

  # Authentication
  match '/auth/:provider/callback' => 'authentications#create'

  resources :authentications
  resources :users do
    resources :experiences do
        get 'summary', on: :collection
    end
  end
  resources :sessions,    only: [:new, :create, :destroy]
  resources :microposts,  only: [:create, :destroy]
  
  match "root" =>    "static_pages#home"

  # statics page
  match "help" =>    "static_pages#help"
  match "about" =>   "static_pages#about"
  match "contact" => "static_pages#contact"
  match "news" =>    "static_pages#news"
 
  # users
  match "signup" =>  "users#new"
  match "signin" =>  "sessions#new"
  match "signout" => "sessions#destroy", :via => :delete
  
  # emails
  match "summary" =>  "experiences#summary"
 
end
