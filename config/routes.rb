Rails.application.routes.draw do
  get 'welcome/index'

  resources :products
  resources :calculations
 
  root 'welcome#index'
end