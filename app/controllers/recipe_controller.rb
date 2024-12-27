class RecipeController < ApplicationController
  def index
    @recipes = Recipe.all.includes(:difficulty, :base_liquor, :ingredients)
  end
end
