# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]
  before_action :correct_user, only: %i[edit update destroy]

  def index #カクテル一覧(公式・投稿レシピを表示)
    @q = Recipe.ransack(params[:q])
    base_query = @q.result.includes(:difficulty, :base_liquor).distinct

    @official_recipes = base_query.tagged_with("公式").page(params[:page])

    @post_recipes = base_query.tagged_with("投稿").where.not(id: Recipe.tagged_with("公式").select(:id)).page(params[:page])
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

  def show #カクテル詳細
    @user = @recipe.user
    image_url = @recipe.image.attached? ? url_for(@recipe.image) : helpers.asset_url('default_ogp.png')

    set_meta_tags helpers.default_meta_tags(
      title: @recipe.name,
      image: image_url
    )
  end

  def edit #カクテル編集
    @ingredients = Ingredient.all
  end

  def new #カクテル作成
    @recipe = Recipe.new(alcohol_strength: nil)
    @recipe.recipe_ingredients.build
    load_form_collections
  end

  def create #カクテル保存
    if user_signed_in?  # ログインしているか確認
      @recipe = current_user.recipes.build(recipe_params)
      load_form_collections

      if @recipe.save
        redirect_to @recipe, notice: "カクテルが投稿できました！"
      else
        flash.now[:alert] = "カクテルの投稿に失敗しました。"
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to new_user_session_path, alert: "ログインしてください。"  # 未ログインの場合はログインページへ
    end
  end

  def my_recipes #ユーザーの投稿したカクテル一覧
    @recipes = current_user&.recipes || []
  end

  def update #カクテル更新
    @ingredients = Ingredient.all

    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'カクテルが更新されました！'
    else
      flash.now[:alert] = 'カクテルの更新に失敗しました。'
      render :edit
    end
  end

  def destroy #カクテル削除
    @recipe.destroy
    redirect_to my_recipes_recipes_path, notice: 'カクテルが削除されました'
  end

  def favorites #お気に入り機能
    @favorite_recipes = current_user.favorite_recipes
  end

  def suggest; end #OpenAI APIを使ったカクテル提案フォーム

  def generate_suggestion #OpenAI APIを使ったカクテル提案
    service = OpenaiService.new
    @suggestion = service.suggest_cocktail(params[:base], params[:taste])

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to suggest_recipes_path, notice: @suggestion }
    end
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
    redirect_to recipes_path, alert: '権限がありません。' unless current_user.recipes.exists?(id: params[:id])
  end

  def load_form_collections
    @base_liquors = BaseLiquor.all
    @difficulties = Difficulty.all
    @ingredients = Ingredient.all
  end
end
