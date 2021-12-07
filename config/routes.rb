Rails.application.routes.draw do
  root 'pages#home'
  resources :users
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  resources :sessions, only: :create
end
