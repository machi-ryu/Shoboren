Rails.application.routes.draw do

  devise_for :users
  #root "places#index"
  root "user#show"
  patch 'users/:id', to: 'user#update'
  resources :places
  resources :joins do
    collection do
      post :update_sanka
      patch :update_sanka
    end
  end
  resources :users
  resources :posts
  
  namespace :my do
    resources :events, only: [:index]
  end
end
