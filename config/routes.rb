Rails.application.routes.draw do

  devise_for :users
  #root "places#index"
  root "user#show"
  resources :places
  resources :joins

end
