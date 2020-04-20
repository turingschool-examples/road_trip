Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/trips', to: 'trips#index'
  get 'trips/:id', to: 'trips#show'
  # delete 'trips/:id/travelers/:traveler_id', to: 'traveler_trips#destroy'
  resources :traveler_trips, only: [:destroy]
end

# trips         GET    /trips(.:format)              trips#index
#                GET    /trips/:id(.:format)          trips#show
# traveler_trip DELETE /traveler_trips/:id(.:format) traveler_trips#destroy
