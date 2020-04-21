Rails.application.routes.draw do
  resources :travelers, only: [:show] do
    resources :trips, only: [:show, :create]
  end
end
