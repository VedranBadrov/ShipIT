# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'main#home'

  get '/aboutus', to: 'main#aboutus'
  get 'services', to: 'main#services'
  get '/receiversender', to: 'main#receiversender'
  get '/currierportal', to: 'main#currierportal'
  get '/costcalculator', to: 'main#costcalculator'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
