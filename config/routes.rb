Rails.application.routes.draw do
  resources :customers

  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  get '/signout', to: 'session#logout'
  
  root 'session#new'

  resources :employees
  resources :products
  get '/mark_accepted', to: "products#mark_accepted"
  resources :buys ,only: [:create,:index]

end
