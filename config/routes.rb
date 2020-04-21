Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :travelers, only: [:show]
  post '/travelers/:id', to: 'traveler_trips#create'
  
end
