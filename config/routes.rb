Rails.application.routes.draw do
  resources :customers
  resources :employees

  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  get '/signout', to: 'session#logout'


  
  root 'session#new'
end
