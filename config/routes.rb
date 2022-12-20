Rails.application.routes.draw do
  devise_for :users
  root 'main#home'

  get "/orders", to: "main#orders"
  get "/curriersportal", to: "main#curriersportal"
  get "/costcalculator", to: "main#costcalculator"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
