Rails.application.routes.draw do
  # get 'users/new'
  # get 'users/create'
  # get 'users/show'
  # get 'users/edit'
  # get 'users/update'
  # get 'users/destroy'
  # get 'trips/home' #???????
  # resources :activities
 

  root :to => 'session#new'
  get '/new' => 'activities#create_trip'
  post '/new_user' => 'session#create_user'

  
  get '/home' => 'trips#home'
  post '/home/new' => 'activities#create_trip'


  

  get '/trip/index/:id' => 'activities#index' #MAKE THIS AND THE BELOW ONE ROUTE
  get '/index/:id' => 'activities#index'
  post '/index/:id' => 'activities#index'

  get '/activities/new/:trip_id' => 'activities#new'
  post '/index/new/activities/:trip_id' => 'activities#new_submit'
  post '/new/activities/:trip_id' => 'activities#new_submit'
  post '/trip/index/new/activities/:trip_id' => 'activities#new_submit'

  get '/index/edit_trip' => 'activities#new'
  post '/index/edit_trip/:trip_id' => 'activities#edit_trip'

  get '/index/edit_activity' => 'activities#new'
  post '/index/edit_activity/:trip_id/:activity_id' => 'activities#edit_activity'
  delete '/index/delete_activity/:trip_id/:activity_id' => 'activities#destroy_activity'


  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end