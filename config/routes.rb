# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :orders do
    member do 
      patch 'accept'
      patch 'begin'
      patch 'cancel'
      patch 'complete'
      get 'manage'
      get 'confirmation'
    end
    collection do
      get 'search'
    end
  end
  
  

  root 'main#home'
  
  get '/aboutus', to: 'main#aboutus'
  get '/careers', to: 'main#careers'
  get '/receiversender', to: 'main#receiversender'
  get '/receiver', to: 'main#receiver'
  get '/currierportal', to: 'main#currierportal'
  
  get '/new', to: 'orders#new'
  get '/show', to: 'orders#show'
  get '/history', to: 'orders#history'
  get '/costcalculator', to: 'orders#costcalculator'
  post 'orders/costcalculator'
  
  get '/currierorder', to: 'currier#currierorder'
  get '/acceptedorder', to: 'currier#acceptedorder'
 
  get '/routeplanner', to: 'currier#routeplanner'
  get '/curriertrack', to: 'currier#curriertrack'
  get '/currierhistory', to: 'currier#currierhistory'
  #get '/orders/search', to: 'orders#search', as: 'search_orders'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
