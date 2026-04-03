Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  resources :jobs, only: [:index, :show, :new, :create, :edit, :update]

  get "scanner", to: "scanner#index", as: :scanner
  post "scanner/check", to: "scanner#check", as: :scanner_check

  get "up" => "rails/health#show", as: :rails_health_check
end