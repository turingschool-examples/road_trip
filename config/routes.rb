Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # travelers
  get '/travelers/:id', to: 'travelers#show'
  # traveler_trips
  post '/travelers/:id/trips/new', to: 'traveler_trips#create'
end
