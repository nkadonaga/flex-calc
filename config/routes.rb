Rails.application.routes.draw do
  get 'welcome/index'

  resources :products
  resources :calculations
  resources :configurations
 
  root 'welcome#index'
end