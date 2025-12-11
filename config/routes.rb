Rails.application.routes.draw do
  get "home/index"
  devise_for :users
  resources :trucks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Authentication
  get "signup", to: "users#new"
  post "signup", to: "users#create"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  # Dashboard
  get "dashboard", to: "dashboard#index"
  get "dashboard/drivers", to: "dashboard#drivers_json", defaults: { format: :json }

  # Drivers management
  resources :drivers, except: [:show]

  # API for driver location updates
  namespace :api do
    post "drivers/:id/location", to: "drivers#update_location"
  end

  # Homepage
  root "pages#home"
end
devise_for :users
root 'home#index'
