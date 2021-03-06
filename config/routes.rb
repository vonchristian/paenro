Rails.application.routes.draw do
  root to: 'clients#index'
  devise_for :users, controllers: { sessions: 'users/sessions' , registrations: "settings/users"}
  resources :warehouse
  resources :programs, only: [:index, :show]
  resources :requirement_submissions, only: [:new, :create]
  resources :clients, except: [:destroy] do
    resources :farms, only: [:new, :create, :edit, :update], module: :clients
  end
  resources :farms, only: [:index, :show] do
    resources :harvests, only: [:new, :create], module: :farms
    resources :croppings, only: [:new, :create], module: :farms
  end
  resources :settings, only: [:index]
  resources :municipalities, only: [:show]
  resources :barangays, only: [:show]
  resources :line_items
  resources :carts, only: [:destroy]
  resources :orders, only: [:index, :new, :create]
  resources :products, except: [:destroy] do
    match "/scope_to_category" => "products#scope_to_category", as: :scope_to_category, via: [:get], on: :collection
    resources :stocks, only: [:new, :create], module: :products
  end
  namespace :settings do
    resources :users, except: [:destroy]
    resources :categories, only: [:new, :create]
    resources :programs, only: [:new, :create] do
      resources :program_grants, only: [:new, :create]
      resources :program_locations, only: [:new, :create]

    end
    resources :requirements, only: [:new, :create]
    resources :crops, only: [:new, :create]
    resources :program_locations, only: [:edit, :update]
    resources :municipalities, only: [:new, :create] do
      resources :barangays, only: [:new, :create]
    end
    resources :barangays, shallow: true do
      resources :sitios, only: [:new, :create]
    end
  end
  resources :results, only: [:index]
  resources :reports, only: [:index]
  resources :claims_reports, only: [:index], module: :reports

end
