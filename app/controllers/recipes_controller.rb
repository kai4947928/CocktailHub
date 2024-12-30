class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result.includes(:difficulty, :base_liquor, :ingredients).presence || Recipe.all
  end

  def show

  end

  def new
    @recipe = Recipe.new
    @base_liquors = BaseLiquor.all
    @difficulties = Difficulty.all
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    default_user = User.find_by(email: 'user@example.com')
    if default_user
      @recipe.user = default_user
      if @recipe.save
        redirect_to @recipe, notice: 'カクテルが投稿されました！'
      else
        flash.now[:alert] = "カクテルの投稿に失敗しました。"
        @base_liquors = BaseLiquor.all
        @difficulties = Difficulty.all
        @ingredients = Ingredient.all
        render :new
      end
    else
      flash[:alert] = "デフォルトユーザーが存在しません。ユーザーを作成してください。"
      render :new
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :alcohol_strength, :flavor_id, :procedure, :difficulty_id, :base_liquor_id, ingredient_ids: [])
  end
end
