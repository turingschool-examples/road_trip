Rails.application.routes.draw do
  resources :trips, only: [:index, :show]

  patch "/trips", to: "trips#update"
end
