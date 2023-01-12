Rails.application.routes.draw do
  resources :reviews
  resources :customers
  resources :employees
  resources :products

  resources :buys ,only: [:create,:index]

  get '/signin', to: 'session#new', as:"login"
  post '/signin', to: 'session#create'
  get '/signout', to: 'session#logout', as:"logout"

  post '/send_order', to: "products#send_order"
  get '/mark_delivered', to: "products#mark_delivered"

  get "/myproducts", to: "products#myproducts", as: "my_products"

  root 'application#index'
end
