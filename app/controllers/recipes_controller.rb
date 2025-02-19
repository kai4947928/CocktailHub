# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @q = Recipe.ransack(params[:q])
    @official_recipes = @q.result.includes(:difficulty, :base_liquor)
                        .tagged_with("公式")
                        .distinct
                        .page(params[:official_page])

    @post_recipes = @q.result.includes(:difficulty, :base_liquor)
                    .tagged_with("投稿")
                    .where.not(id: Recipe.tagged_with("公式").select(:id))
                    .distinct
                    .page(params[:post_page])
  end

  def autocomplete
    query = params[:q] || ""
    recipes = Recipe.where("name LIKE ?", "%#{query}%")
    @recipes = recipes

    respond_to do |format|
      format.html { render "autocomplete", layout: false }
      format.json { render json: recipes.map { |recipe| { id: recipe.id, name: recipe.name } } }
    end
  end

  def show
    @user = @recipe.user

    image_url = @recipe.image.attached? ? url_for(@recipe.image) : helpers.asset_url('default_ogp.png')

    Rails.logger.debug "🔥 OGP画像URL: #{image_url}"

    set_meta_tags helpers.default_meta_tags(
      title: @recipe.name,
      image: image_url
    )
  end

  def edit
    @recipe = current_user.recipes.find(params[:id])
    @ingredients = Ingredient.all
  end

  def new
    @recipe = Recipe.new(alcohol_strength: nil)
    @recipe.recipe_ingredients.build
    @base_liquors = BaseLiquor.all
    @difficulties = Difficulty.all
    @ingredients = Ingredient.all
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    @difficulties = Difficulty.all

    if @recipe.save
      redirect_to @recipe, notice: "カクテルが投稿できました！"
    else
      flash.now[:alert] = "カクテルの投稿に失敗しました。"
      render :new, status: :unprocessable_entity
    end
  end

  def my_recipes
    @recipes = user_signed_in? ? current_user.recipes : []
  end

  def update
    @recipe = current_user.recipes.find(params[:id])
    @ingredients = Ingredient.all

    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'カクテルが更新されました！'
    else
      flash.now[:alert] = 'カクテルの更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @recipe = current_user.recipes.find(params[:id])
    @recipe.destroy
    redirect_to my_recipes_recipes_path, notice: 'カクテルが削除されました'
  end

  def favorites
    @favorite_recipes = current_user.favorite_recipes
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :image, :alcohol_strength, :flavor_id, :procedure, :difficulty_id, :base_liquor_id,
                                   recipe_ingredients_attributes: %i[ingredient_id quantity _destroy])
  end

  def correct_user
    @recipe = current_user.recipes.find_by(id: params[:id])
    redirect_to recipes_path, alert: '権限がありません。' if @recipe.nil?
  end
end
