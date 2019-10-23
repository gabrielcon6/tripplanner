Rails.application.routes.draw do
  get 'trips/home'
  resources :activities
  # get 'about/me'
  root :to => 'session#new'
  get '/home' => 'trips#home'
  get '/new' => 'activities#create_trip'
  post '/new' => 'activities#create_trip'
  get '/index' => 'activities#index'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  get '/home' => 'pages#home'

end
