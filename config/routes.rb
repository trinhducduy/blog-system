Rails.application.routes.draw do
  root 'entries#index'
  resources :registrations, except: [:destroy]
  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
  resources :sessions, only: [:create]
  resources :users, only: [:show]
  resources :entries do
    resources :comments, only: [:create, :destroy], on: :member
  end
  resources :relationships, only: [:create, :destroy]
end

