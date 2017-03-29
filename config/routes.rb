Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' , registrations: "settings/users"}
  resources :clients, except: [:destroy]
  resources :settings, only: [:index]
  namespace :settings do 
    resources :users, except: [:destroy]
  end
end
