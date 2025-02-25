# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :set_recipe

  def create #お気に入り追加
    return redirect_to @recipe unless user_signed_in?

    current_user.favorite_recipes << @recipe
    respond_with_notice('お気に入り登録できました！')
  end

  def destroy #お気に入り削除
    return redirect_to @recipe unless user_signed_in?

    current_user.favorite_recipes.destroy(@recipe)
    respond_with_notice('お気に入りを解除しました')
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def respond_with_notice(notice_message)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @recipe, notice: notice_message }
    end
  end
end
