Rails.application.routes.draw do
  get 'about/me'
  root :to => 'session#new'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  get '/home' => 'pages#home'

end
