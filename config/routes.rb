Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' , registrations: "settings/users"}
  resources :warehouse
  resources :clients, except: [:destroy] do
    resources :farms, only: [:new, :create, :edit, :update], module: :clients
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
    resources :municipalities, only: [:new, :create] do
      resources :barangays, only: [:new, :create]
    end
    resources :barangays, shallow: true do
      resources :sitios, only: [:new, :create]
    end
  end
end
