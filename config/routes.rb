Rails.application.routes.draw do
  resources :trips, only: [:index, :show] do
    resources :travelers, only: [:destroy]
  end
end
