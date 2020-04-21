Rails.application.routes.draw do
  resources :travelers, only: [:show, :update]
end
