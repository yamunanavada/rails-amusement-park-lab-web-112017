Rails.application.routes.draw do
  root 'sessions#index'

  get "/signup", to: "users#new"
  get "/signin", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy", as: 'delete_session'

  resources :users
  resources :attractions
  resources :rides


end
