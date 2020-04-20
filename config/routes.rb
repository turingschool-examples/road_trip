Rails.application.routes.draw do

  get "/trips", to: 'trips#index'
  get "/trips/:trip_id", to: 'trips#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
