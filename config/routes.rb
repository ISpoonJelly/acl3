Rails.application.routes.draw do
  # Frontend
  resources :sessions, only: [:create, :destroy]
  
  resources :users, except: [:index, :destroy] do
    member do
      get :history
    end
  end
  
  resources :posts
  
  # API
  namespace :api, defaults: { format: :json } do
    resources :sessions, only: :create
    resources :posts
  end
  
  root 'posts#index'
end
