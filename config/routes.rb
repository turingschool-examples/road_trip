Rails.application.routes.draw do

  resources :travelers, only: [:show]
end

# traveler GET  /travelers/:id(.:format) travelers#show