Rails.application.routes.draw do

  resources :trips, only: [:index, :show]

  delete '/traveler_trips/:traveler_id/:trip_id', to: 'traveler_trips#destroy'
end
