Rails.application.routes.draw do

  get "/trips", to: "trips#index"
  get "trips/:trip_id", to: "trips#show"
end
