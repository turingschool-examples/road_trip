Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :trips
  # namespace :travelers do
  #   resources :trips
  # end
  get '/trips/:id', to: 'trips#show'

  get '/traveler/:id/trips', to: 'trips#index'
  # get 'traveler/:id/trips/:trip_id', to: 'trips#show'
  delete '/traveler/:id/trips/:trip_id', to: 'trips#remove_traveler'
end
