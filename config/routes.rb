Rails.application.routes.draw do
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
end
