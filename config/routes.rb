Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :trips, only: [:index, :show]

  delete "/trip_travelers/:trip_id/:traveler_id", to: "trip_travelers#destroy"

end
