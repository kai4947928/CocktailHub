class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @q = Recipe.ransack(params[:q])
    if params[:q] && params[:q][:search].present?
      keyword = params[:q][:search]
      @q.name_cont = keyword
    end
    @recipes = @q.result.includes(:difficulty, :base_liquor).distinct.page(params[:page])
  end

  def autocomplete
    @recipes = Recipe.where("name LIKE ?", "%#{params[:query]}%")
    render json: @recipes.pluck(:name)
  end

  def show
    @user = @recipe.user
  end

  def edit
    @recipe = current_user.recipes.find(params[:id])
  end

  def new
    @recipe = Recipe.new(alcohol_strength: nil)
    @recipe.recipe_ingredients.build
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
    params.require(:recipe).permit(:name, :image, :alcohol_strength, :flavor_id, :procedure, :difficulty_id, :base_liquor_id,
    recipe_ingredients_attributes: [:ingredient_id, :quantity, :_destroy])
  end

  def correct_user
    @recipe = current_user.recipes.find_by(id: params[:id])
    redirect_to recipes_path, alert: '権限がありません。' if @recipe.nil?
  end
end
