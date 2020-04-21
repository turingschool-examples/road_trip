Rails.application.routes.draw do

  resources :travelers, only: [:show]
  # resources :trips, only: [:create]

  # get 'travelers/:id', to: 'travelers#show'
  # get '/travelers/:id', to: 'traveler_trips#new'
  # post '/travelers/:id', to: 'traveler_trips#create'
  post 'travelers/:id', to: 'traveler_trips#add_trip'
end

# traveler GET  /travelers/:id(.:format) travelers#show