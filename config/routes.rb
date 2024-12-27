Rails.application.routes.draw do
  root 'recipe#index'

  resources :recipes, only: [:index, :show, :new, :create]
end
