Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :trips
  # namespace :travelers do
  #   resources :trips
  # end

  get 'traveler/:id/trips', to: 'trips#index'

end
