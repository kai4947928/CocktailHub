require 'rails_helper'

RSpec.describe "Favorites", type: :request do
  let(:user) { create(:user, email: "tests@example.com", provider: "google_oauth2", uid: "113456789") }  # ログインユーザー
  let(:recipe) { create(:recipe) }
  before do
    sign_in user
  end

  describe "POST /favorites" do
    context "ログインしている場合" do
      it "カクテルをお気に入り登録できる" do
        expect {
          post recipe_favorites_path(recipe), params: { recipe_id: recipe.id }
        }.to change(Favorite, :count).by(1)

        expect(response).to redirect_to(recipe_path(recipe))
      end
    end
  end

  describe "DELETE /favorites/:id" do
    let!(:favorite) { create(:favorite, user: user, recipe: recipe) }

    context "ログインしている場合" do
      it "カクテルのお気に入りを解除できる" do
        expect {
          delete recipe_favorite_path(favorite.recipe_id, favorite.id)
        }.to change(Favorite, :count).by(-1)

        expect(response).to redirect_to(recipe_path(recipe))
      end
    end
  end
end
