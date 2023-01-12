Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   
  resources :customers
  # root "articles#index"

  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  get '/signout', to: 'session#logout'

  root 'session#new'

  resources :employees
  resources :products
  get '/mark_accepted', to: "products#mark_accepted"
  resources :buys ,only: [:create,:index]

end
