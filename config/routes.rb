Rails.application.routes.draw do
  get "alerts/send_sms"
  devise_for :users
  root 'home#index'
resources :dashboard
  resources :trucks
end
resources :trucks do
  member do
    post :send_sms, controller: 'alerts'
  end
end
