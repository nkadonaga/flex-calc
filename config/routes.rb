Rails.application.routes.draw do
  get 'welcome/index'

  resources :products
  resources :users
  resources :calculations
 
  root 'welcome#index'
end