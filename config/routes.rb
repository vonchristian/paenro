Rails.application.routes.draw do
  resources :clients, except: [:destroy]
end
