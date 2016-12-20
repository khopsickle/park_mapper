Rails.application.routes.draw do

  root 'parks#index'
  resources :users
  resources :parks
  
end
