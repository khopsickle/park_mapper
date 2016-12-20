Rails.application.routes.draw do

  root 'parks#index'
  resources :users
  resources :parks, only: [:index, :show]
  # get 'refresh', to: 'parks#refresh'
end
