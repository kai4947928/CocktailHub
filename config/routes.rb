# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }, skip: [:registrations, :password]

  root "home#index"

  get "how_to_use", to: "pages#how_to_use", as: :how_to_use
  get "terms_of_service", to: "pages#terms_of_service", as: :terms_of_service
  get "privacy_policy", to: "pages#privacy_policy", as: :privacy_policy


  resources :recipes, only: %i[index show new create edit update destroy] do
    resources :favorites, only: %i[create destroy]

    collection do
      %i[my_recipes autocomplete favorites suggest generate_suggestion].each do |action|
        if action == :generate_suggestion
          post action
        else
          get action
        end
      end
    end
  end
end
