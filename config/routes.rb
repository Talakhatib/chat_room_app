Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :messages
  resources :rooms
  resources :users

  get '/logout',to: "users#logout"


  root 'rooms#index'
end
