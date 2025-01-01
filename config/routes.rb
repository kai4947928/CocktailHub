Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root 'recipes#index'

  resources :recipes, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    collection do
      get :my_recipes
      get :parent_recipe_options
    end
  end
end
