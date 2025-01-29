# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :set_recipe

  def create
    if user_signed_in?
      current_user.favorite_recipes << @recipe
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @recipe, notice: 'お気に入り登録できました！' }
      end
    else
      redirect_to @recipe
    end
  end

  def destroy
    if user_signed_in?
      current_user.favorite_recipes.destroy(@recipe)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @recipe, notice: 'お気に入りを解除しました' }
      end
    else
      redirect_to @recipe
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
