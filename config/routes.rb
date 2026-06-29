Rails.application.routes.draw do
  get "home", to: "home#index"

  devise_for :users

  get "static_pages/top"

  root "static_pages#top"

  resources :medication_records, only: [ :new, :create, :index, :destroy ]
  resources :health_records,
          only: [ :new, :create, :index, :edit, :update, :destroy ] do
  resources :likes,
            only: [ :create, :destroy ]
end

resources :public_health_records, only: [ :index ]
end
