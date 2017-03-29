Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' , registrations: "settings/users"}
  resources :clients, except: [:destroy]
  resources :settings, only: [:index]
  resources :municipalities, only: [:show]
  resources :barangays, only: [:show]
  namespace :settings do
    resources :users, except: [:destroy]
    resources :municipalities, only: [:new, :create] do
      resources :barangays, only: [:new, :create]
    end
    resources :barangays, shallow: true do
      resources :sitios, only: [:new, :create]
    end
  end
end
