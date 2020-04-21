Rails.application.routes.draw do
  resources :travelers
  get '/travelers/:traveler_id/trips/new', to: 'trips#new'
  post '/travelers/:traveler_id/trips', to: 'trips#create'

end
