#カクテル投稿
require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  describe "POST /recipes" do
    context "ログインしている場合" do
      before do
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
          provider: "google_oauth2",
          uid: "123456789",
          info: { email: "test@example.com", name: "Test User" },
          credentials: { token: "mock_token" }
        )

        user = User.create(email: "test@example.com", provider: "google_oauth2", uid: "123456789")
        sign_in user
      end

      it "カクテルを投稿できる" do
        expect {
          post recipes_path, params: {
            recipe: {
              name: "モヒート",
              procedure: "ラムとミントの爽やかカクテル",
              difficulty_id: Difficulty.first.id,
              flavor_id: Flavor.first.id,
              base_liquor_id: BaseLiquor.first.id
            }
          }
        }.to change(Recipe, :count).by(1)

        recipe = Recipe.last

        expect(response).to redirect_to(recipe_path(recipe))
      end
    end
  end

  describe "PATCH /recipes/:id" do
    context "ログインしている場合" do
      let!(:user) { create(:user, email: "tessts@example.com", provider: "google_oauth2", uid: "113956789") }
      let!(:recipe) { create(:recipe, user: user) }

      before do
        sign_in user
      end

      it "カクテルの情報を更新できる" do
        patch recipe_path(recipe), params: { recipe: { name: "New Name" } }
        recipe.reload
        expect(recipe.name).to eq("New Name")
        expect(response).to redirect_to(recipe_path(recipe))
      end
    end
  end

  describe "DELETE /recipes/:id" do
    context "ログインしている場合" do
      let!(:user) { create(:user, email: "tessats@example.com", provider: "google_oauth2", uid: "118956789") }
      let!(:recipe) { create(:recipe, user: user) }

      before do
        sign_in user
      end

      it "カクテルを削除できる" do
        delete recipe_path(recipe)
        expect(response).to redirect_to(my_recipes_recipes_path)
        expect(Recipe.exists?(recipe.id)).to be_falsey
      end
    end
  end
end
