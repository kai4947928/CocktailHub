class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.includes(:difficulty, :base_liquor, :ingredients)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
