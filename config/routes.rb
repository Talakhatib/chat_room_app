Rails.application.routes.draw do
  get 'notifications/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # mount ActionCable.server => "/cable"
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#logout'
  resources :rooms do 
    resources :messages
    # resources :notifications, only: [:index]
  end
  resources :users
  root 'rooms#index'
  post '/search', to: "users#search"
end
