Rails.application.routes.draw do
  devise_for :users
  root 'recipes#index'

  resources :recipes, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    collection do
      get 'my_recipes'
    end
  end
end
