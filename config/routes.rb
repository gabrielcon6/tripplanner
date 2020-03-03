Rails.application.routes.draw do
 
  root :to => 'session#new' #login page
  get '/new' => 'activities#create_trip' #add trip
  post '/new_user' => 'session#create_user' #add user

  
  get '/home' => 'trips#home' #homepage
  post '/home/new' => 'activities#create_trip' #add trip

  get '/profile' => 'about#me'
  post '/profile' => 'about#me'

  get '/trip/index/:id' => 'activities#index' #MAKE THIS AND THE BELOW ONE ROUTE
  get '/index/:id' => 'activities#index'
  post '/index/:id' => 'activities#index'
  
  get '/activities/new/:trip_id' => 'activities#index'
  post '/index/new/activities/:trip_id' => 'activities#new_submit'
  post '/new/activities/:trip_id' => 'activities#new_submit'
  post '/trip/index/new/activities/:trip_id' => 'activities#new_submit'

  get '/index/edit_trip/:trip_id' => 'activities#index'
  post '/index/edit_trip/:trip_id' => 'activities#edit_trip'
  delete '/index/delete_trip/:trip_id' => 'activities#destroy_trip'

  get '/index/activity/:trip_id/:activity_id' => 'activities#show_activity'  

  get '/index/edit_activity/:trip_id/:activity_id' => 'activities#index'
  post '/index/edit_activity/:trip_id/:activity_id' => 'activities#edit_activity'

  get '/index/delete_activity/:trip_id/:activity_id' => 'trips#home'
  delete '/index/delete_activity/:trip_id/:activity_id' => 'activities#destroy_activity'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/logout' => 'session#new'
  post '/logout' => 'session#destroy'

end