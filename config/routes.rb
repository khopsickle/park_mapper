Rails.application.routes.draw do

  root 'parks#refresh'
  resources :users
  resources :parks
  get 'refresh', to: 'parks#refresh'
end
