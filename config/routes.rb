Rails.application.routes.draw do
  get 'welcome/index'

  resources :products
  resources :calculations
  resources :preferences
 
  root 'welcome#index'
end