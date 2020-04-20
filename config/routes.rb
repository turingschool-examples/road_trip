Rails.application.routes.draw do
  get '/trips', to: 'trips#index'
  get '/trips/:id', to: 'trips#show'
  delete '/trips/:trip_id/travelers/:traveler_id', to: 'traveler_trips#destroy'
end
