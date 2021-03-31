Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, except: [:new] do
    member do
      get :followings
      get :followers
      get :favtweets
      get :favballs
    end
  end
  resources :relationships, only: [:create, :destroy]
  
  resources :tweets, only: [:show, :create, :new, :edit, :update, :destroy]
  resources :tweet_favorites, only: [:create, :destroy]
  
  resources :balls
  resources :ball_favorites, only: [:create, :destroy]
end
