Rails.application.routes.draw do
  resources :customers

  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  get '/signout', to: 'session#logout'
  
  root 'session#new'

  resources :employees
  resources :products
  post '/send_order', to: "products#send_order"
  get '/mark_delivered', to: "products#mark_delivered"
  resources :buys ,only: [:create,:index]

end
