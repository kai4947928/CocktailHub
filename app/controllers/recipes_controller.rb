# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_recipe, only: %i[show edit update destroy]
  before_action :correct_user, only: %i[edit update destroy]

  def index
    @search_params = search_params
    @q = Recipe.ransack(search_params)
    base_query = @q.result.includes(:difficulty, :base_liquor).distinct

    @official_recipes = base_query.tagged_with("公式").page(params[:page])
    @post_recipes = base_query.tagged_with("投稿").where.not(id: Recipe.tagged_with("公式").select(:id)).page(params[:page])
  end

  def autocomplete
    query = params[:q].to_s.strip
    @recipes = Recipe.where(Recipe.arel_table[:name].matches("%#{query}%"))

    respond_to do |format|
      format.html { render "autocomplete", layout: false }
      format.json { render json: @recipes.select(:id, :name) }
    end
  end

  def show
    @user = @recipe.user
    image_url = @recipe.image.attached? ? url_for(@recipe.image) : helpers.asset_url('default_ogp.png')

    set_meta_tags helpers.default_meta_tags(
      title: @recipe.name,
      image: image_url
    )
  end

  def edit
    @ingredients = Ingredient.all
  end

  def new
    @recipe = Recipe.new(alcohol_strength: nil)
    @recipe.recipe_ingredients.build
    load_form_collections
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    load_form_collections

    if @recipe.save
      redirect_to @recipe, notice: "カクテルが投稿できました！"
    else
      flash.now[:alert] = "カクテルの投稿に失敗しました。"
      render :new, status: :unprocessable_entity
    end
  end

  def my_recipes
    @recipes = current_user&.recipes || []
  end

  def update
    @ingredients = Ingredient.all

    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'カクテルが更新されました！'
    else
      flash.now[:alert] = 'カクテルの更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to my_recipes_recipes_path, notice: 'カクテルが削除されました'
  end

  def favorites
    @favorite_recipes = current_user.favorite_recipes
  end

  def suggest
    @suggestion = nil
  end

  def generate_suggestion
    base = params[:base]
    taste = params[:taste]

    service = OpenaiService.new
    @suggestion = service.suggest_cocktail(base, taste)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to suggest_recipes_path, notice: @suggestion }
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def search_params
    params.fetch(:q, {}).permit(:name_cont, :base_liquor_id_eq, :difficulty_id_eq)
  end

  def recipe_params
    params.require(:recipe).permit(:name, :image, :alcohol_strength, :flavor_id, :procedure, :difficulty_id, :base_liquor_id,
    recipe_ingredients_attributes: %i[ingredient_id quantity _destroy])
  end

  def correct_user
    redirect_to recipes_path, alert: '権限がありません。' unless @recipe.user == current_user
  end

  def load_form_collections
    @base_liquors = BaseLiquor.all
    @difficulties = Difficulty.all
    @ingredients = Ingredient.all
  end
end
