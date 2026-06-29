Rails.application.routes.draw do
  get "home", to: "home#index"

  devise_for :users

  get "static_pages/top"

  root "static_pages#top"

  resources :medication_records, only: [ :new, :create, :index, :destroy ]
  resources :health_records, only: [ :new, :create ]
end
