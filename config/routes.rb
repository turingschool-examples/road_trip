Rails.application.routes.draw do
  get '/travelers/:id', to: 'travelers#show'
end
