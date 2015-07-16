Rails.application.routes.draw do
  root 'entries#index'
  resources :registrations, except: [:destroy]
  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
  resources :sessions, only: [:create]
  
  resources :users, only: [:show] do 
    get :dashboard, on: :collection
  end
  
  resources :entries do
    resources :comments, only: [:create, :destroy], on: :member
  end
  post '/comments/:id/reply', to: 'comments#reply', as: :comment_reply
  resources :relationships, only: [:create, :destroy]
end

