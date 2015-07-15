Rails.application.routes.draw do
  root 'entries#index'
  resources :registrations, except: [:destroy]
  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
  resources :sessions, only: [:create]
  resources :users, only: [:show]
  resources :entries
  resources :relationships, only: [:create, :destroy]
end

