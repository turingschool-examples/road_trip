Rails.application.routes.draw do
  # For details on the DSL available within this file, see http:
  resources :trips, only: [:index]
end
