Rails.application.routes.draw do
  root 'users#dashboard'
  resources :registrations, except: [:destroy]
  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
  resources :sessions, only: [:create]
  resources :users, only: [:show]
end

