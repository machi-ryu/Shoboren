Rails.application.routes.draw do

  root "places#show"
  resources :places

end
