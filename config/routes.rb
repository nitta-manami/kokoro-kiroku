Rails.application.routes.draw do
  get "pages/terms"
  get "pages/privacy"
  get "home", to: "home#index"
  get "terms", to: "pages#terms"
  get "privacy", to: "pages#privacy"
  get "contact", to: "pages#contact"

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
