Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trips, only: [:index, :show]
  delete "/trips/:id/:traveler_id", to: "traveler_trips#destroy"
end
