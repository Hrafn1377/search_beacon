Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  resources :jobs, only: [:index, :show, :new, :create, :edit, :update]

  get "up" => "rails/health#show", as: :rails_health_check
end