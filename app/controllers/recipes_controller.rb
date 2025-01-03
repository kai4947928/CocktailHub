class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result.includes(:difficulty, :base_liquor, :ingredients).distinct
    @recipes = @recipes.where(category: 'original') if params[:q]&.[](:category_eq) == 'original'
  end

  def parent_recipe_options
    @recipes = Recipe.where(category: 'original')
    respond_to do |format|
      format.js
    end
  end

  def show

  end

  def edit
    @recipe = current_user.recipes.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @base_liquors = BaseLiquor.all
    @difficulties = Difficulty.all
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

      if @recipe.save
        redirect_to @recipe, notice: 'カクテルが投稿されました！'
      else
        flash.now[:alert] = "カクテルの投稿に失敗しました。"
        @base_liquors = BaseLiquor.all
        @difficulties = Difficulty.all
        @ingredients = Ingredient.all
        render :new
      end
  end

    def my_recipes
      @recipes = user_signed_in? ? current_user.recipes : []
    end

    def update
      @recipe = current_user.recipes.find(params[:id])

      if @recipe.update(recipe_params)
        redirect_to @recipe, notice: 'カクテルが更新されました！'
      else
        flash.now[:alert] = "カクテルの更新に失敗しました。"
        render :edit
      end
    end

    def destroy
      @recipe = current_user.recipes.find(params[:id])
      @recipe.destroy
      redirect_to my_recipes_recipes_path, notice: "カクテルが削除されました"
    end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :alcohol_strength, :flavor_id, :procedure, :difficulty_id, :base_liquor_id, ingredient_ids: [])
  end

  def correct_user
    @recipe = current_user.recipes.find_by(id: params[:id])
    redirect_to recipes_path, alert: '権限がありません。' if @recipe.nil?
  end
end
