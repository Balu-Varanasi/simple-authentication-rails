Authentication::Application.routes.draw do

  root :to => "home#dashboard"
  
  match "signup", :to => "users#new"

  match "login", :to => "sessions#new"
  match "logout", :to => "sessions#destroy"
  post "sessions/create", :to => "sessions#create"
  
  match "home", :to => "sessions#home"

  resources :users

end
