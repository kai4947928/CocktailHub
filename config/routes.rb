# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  root "home#index"
  get "how_to_use", to: "pages#how_to_use"
  get "terms_of_service", to: "pages#terms_of_service"
  get "privacy_policy", to: "pages#privacy_policy"

  resources :recipes, only: %i[index show new create edit update destroy] do
    resources :favorites, only: %i[create destroy]
    collection do
      get :my_recipes
      get :autocomplete
      get :favorites
      get :suggest
      post :generate_suggestion
    end
  end
end
