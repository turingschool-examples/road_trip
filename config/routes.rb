Rails.application.routes.draw do
  resources :trips, only: [:index, :show, :destroy]
end
