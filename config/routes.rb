Rails.application.routes.draw do
  resources :trips, only: [:index, :show]
  resources :travelers_trips, only: [:destroy]
end
