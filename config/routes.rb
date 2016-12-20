Rails.application.routes.draw do

  root 'users#new'
  resources :users, only: [:new, :create, :show]
  resources :parks, only: [:index, :show]
  resource :session, only: [:new, :create, :destroy]
  # get 'refresh', to: 'parks#refresh'
  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
end
