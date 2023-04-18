# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :orders

  root 'main#home'
  
  get '/aboutus', to: 'main#aboutus'
  get 'services', to: 'main#services'
  get '/receiversender', to: 'main#receiversender'
  get '/currierportal', to: 'main#currierportal'
  get '/costcalculator', to: 'main#costcalculator'
  get '/new', to: 'orders#new'
  get '/show', to: 'orders#show'
  get '/track', to: 'orders#track'
  get '/history', to: 'orders#history'
  get 'orders/search', to: 'orders#search', as: 'search_orders'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
