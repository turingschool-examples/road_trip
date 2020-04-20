Rails.application.routes.draw do

  get "/trips", to: "trips#index"
  get "trips/:trip_id", to: "trips#show"
  delete "trips/:trip_id/:traveler_id", to: "travelers#destroy"
end
