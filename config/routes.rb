# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :orders do
    member do 
      patch 'accept'
    end
  end
  

  #put :accept, on: :currier

  root 'main#home'
  
  get '/aboutus', to: 'main#aboutus'
  get '/careers', to: 'main#careers'
  get '/receiversender', to: 'main#receiversender'
  get '/currierportal', to: 'main#currierportal'
  get '/costcalculator', to: 'main#costcalculator'

  get '/new', to: 'orders#new'
  get '/show', to: 'orders#show'
  get '/track', to: 'orders#track'
  get '/history', to: 'orders#history'

  get '/currierorder', to: 'currier#currierorder'
  get '/acceptedorder', to: 'currier#acceptedorder'
  get '/manageorder', to: 'currier#manageorder'
  get '/routeplanner', to: 'currier#routeplanner'
  get '/curriertrack', to: 'currier#curriertrack'
  get '/currierhistory', to: 'currier#currierhistory'
  #get '/orders/search', to: 'orders#search', as: 'search_orders'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
