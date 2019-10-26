Rails.application.routes.draw do
  # get 'users/new'
  # get 'users/create'
  # get 'users/show'
  # get 'users/edit'
  # get 'users/update'
  # get 'users/destroy'
  get 'trips/home' #???????
  # resources :activities
  get '/activities/new/:trip_id' => 'activities#new'

  root :to => 'session#new'
  get '/home' => 'trips#home'
  post '/home' => 'activities#create_trip'
  get '/new' => 'activities#create_trip'
  post '/new_user' => 'session#create_user'
  post '/new' => 'activities#create_trip'
  

  get '/index/:id' => 'activities#index'
  post '/index/:id' => 'activities#index'


  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end